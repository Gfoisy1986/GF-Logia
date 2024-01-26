;-TOP

; Comment   : Modul ActiveScript
; Author    : mk-soft
; Version   : v2.09.1
; Create    : 15.09.2018
; Update    : 24.07.2020

; Link to ActiveScript  : https://www.purebasic.fr/english/viewtopic.php?f=12&t=71399
; Link to SmartTags     : https://www.purebasic.fr/english/viewtopic.php?f=12&t=71399#p527089
; Link to VariantHelper : https://www.purebasic.fr/english/viewtopic.php?f=12&t=71399#p527090

; ***************************************************************************************

; Descriptions Control:
;
; *Control = NewActiveScript(Language) : Create and initialze active script control
; - FreeActiveScript(*Control) : Release script control
; - ParseScriptText(*Control, Script) : Added and run scripts
; - AddNamedObject(*Control, Name, *Object) : Added own named objects with interface type IDispatch
;
; Descriptions Addon Runtime:
;   Bind Runtime variables and procedures to script
;
; - Runtime.[Integer, Double, String](RuntimeName) : Get and put runtime variables
; - Runtime.Sleep Time : Delay for script in milliseconds
; - Runtime.Trace Text: Trace output to MS DebugView
; - Runtime.Call(RuntimeName, Parameters, ...) : Call a runtime procedure as callback
;
; * Syntax Runtime Callback:
;
;   Runtime Procedure Name(cArgs.i, *vArgs, *vResult.Variant)
;   - cArgs: Count of Parameters
;   - *vArgs: Pointer To Array of Parameters As Variant. Reverse order of parameters
;   - *vResult: Pointer To Result As Variant (ByRef). Is Zero by call As Method (Sub Name)

; ***************************************************************************************

CompilerIf #PB_Compiler_Unicode = 0
  CompilerError "Use Compiler-Option Unicode"
CompilerEndIf

; ***************************************************************************************

;- Module ActiveScriptCommon

DeclareModule ActiveScriptCommon
  
  ; Active Debuglevel
  #DebugLevel = 1
  
  ; Define Debuglevel
  #DebugLevelRuntimeTrace   = 1
  #DebugLevelRuntimeDebug   = 4
  #DebugLevelActiveScript   = 5
  #DebugLevelActiveScriptEx = 6
  
  #UseActiveScriptInterruptPull = #False
  #UseActiveScriptDebugView     = #False
  
  ; -----------------------------------------------------------------------------------
  
  ;-- Constants
  
  #SCRIPTTEXT_DELAYEXECUTION    = $00000001
  #SCRIPTTEXT_ISVISIBLE         = $00000002
  #SCRIPTTEXT_ISEXPRESSION      = $00000020
  #SCRIPTTEXT_ISPERSISTENT      = $00000040
  #SCRIPTTEXT_HOSTMANAGESSOURCE = $00000080
  #SCRIPTTEXT_ISXDOMAIN         = $00000100
  #SCRIPTTEXT_ISNONUSERCODE     = $00000200
  
  #SCRIPTSTATE_UNINITIALIZED = 0
  #SCRIPTSTATE_INITIALIZED   = 5
  #SCRIPTSTATE_STARTED       = 1
  #SCRIPTSTATE_CONNECTED     = 2
  #SCRIPTSTATE_DISCONNECTED  = 3
  #SCRIPTSTATE_CLOSED        = 4
  
  #SCRIPTITEM_ISVISIBLE      = $0000002
  #SCRIPTITEM_ISSOURCE       = $0000004
  #SCRIPTITEM_GLOBALMEMBERS  = $0000008
  #SCRIPTITEM_ISPERSISTENT   = $0000040
  #SCRIPTITEM_CODEONLY       = $0000200
  #SCRIPTITEM_NOCODE         = $0000400
  
  #SCRIPTINFO_IUNKNOWN       = 1
  #SCRIPTINFO_ITYPEINFO      = 2
  
  ; -----------------------------------------------------------------------------------
  
  ;-- Interface
  
  Interface IActiveScript
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    SetScriptSite(pass)
    GetScriptSite(riid, ppvObject)
    SetScriptState(ssState)
    GetScriptState(pssState)
    Close()
    AddNamedItem(pstrName, dwFlags)
    AddTypeLib(rguidTypeLib, dwMajor, dwMinor, dwFlags)
    GetScriptDispatch(pstrItemName, ppdisp)
    GetCurrentScriptThreadID(pstidThread)
    GetScriptThreadID(dwWin32ThreadId, pstidThread)
    GetScriptThreadState(stidThread, pstsState)
    InterruptScriptThread(stidThread, pexcepinfo, dwFlags)
    Clone(ppscript)
  EndInterface
  
  Interface IActiveScriptParse
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    InitNew()
    AddScriptlet(pstrDefaultName, pstrCode, pstrItemName, pstrSubItemName, pstrEventName,
                 pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags, pbstrName, pexcepinfo)
    ParseScriptText(pstrCode, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie,
                    ulStartingLineNumber, dwFlags, pvarResult, pexcepinfo)
  EndInterface
  
  Interface IActiveScriptSite
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    GetLCID(plcid)
    GetItemInfo(pstrName, dwReturnMask, ppiunkItem, ppti)
    GetDocVersionString(pbstrVersion)
    OnScriptTerminate(pvarResult, pexcepinfo)
    OnStateChange(ssScriptState)
    OnScriptError(pscripterror)
    OnEnterScript()
    OnLeaveScript()
  EndInterface
  
  Interface IActiveScriptSiteWindow
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    GetWindow(pWindowId)
    EnableModless(fEnable)
  EndInterface
  
  Interface IActiveScriptSiteInterruptPoll
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    QueryContinue()
  EndInterface
  
  Interface IActiveScriptError
    QueryInterface(riid, ppvObject)
    AddRef()
    Release()
    GetExceptionInfo(pexcepinfo)
    GetSourcePosition(pdwSourceContext, pulLineNumber, plCharacterPosition)
    GetSourceLineText(pbstrSourceLine)
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      GetSourcePosition64(pdwSourceContext, pulLineNumber, plCharacterPosition)
    CompilerEndIf
  EndInterface
  
  ; -----------------------------------------------------------------------------------
  
  ;-- Structure
  
  Structure objActiveNamedItems
    Name.s
    *Object.IDispatch
    Type.i
  EndStructure
  
  Structure objActiveScriptControl
    *ActiveScript.IActiveScript
    *ActiveScriptParse.IActiveScriptParse
    *ActiveScriptSite.IActiveScriptSite
    Map NamedItems.objActiveNamedItems()
  EndStructure
  
  ; -----------------------------------------------------------------------------------
  
  ;-- DataSection
  
  DataSection
    
    IID_IUnknown: ; {00000000-0000-0000-C000-000000000046}
    Data.l $00000000
    Data.w $0000, $0000
    Data.b $C0, $00, $00, $00, $00, $00, $00, $46
    
    IID_IDispatch: ; {00020400-0000-0000-C000-000000000046}
    Data.l $00020400
    Data.w $0000, $0000
    Data.b $C0, $00, $00, $00, $00, $00, $00, $46
    
    IID_IDispatchEx: ; {A6EF9860-C720-11D0-9337-00A0C90DCAA9}
    Data.l $A6EF9860
    Data.w $C720, $11D0
    Data.b $93, $37, $00, $A0, $C9, $0D, $CA, $A9
    
    IID_IActiveScript:  ; {BB1A2AE1-A4F9-11CF-8F20-00805F2CD064}
    Data.l $BB1A2AE1
    Data.w $A4F9, $11CF
    Data.b $8F, $20, $00, $80, $5F, $2C, $D0, $64
    
    IID_IActiveScriptSite:  ; {DB01A1E3-A42B-11CF-8F20-00805F2CD064}
    Data.l $DB01A1E3
    Data.w $A42B, $11CF
    Data.b $8F, $20, $00, $80, $5F, $2C, $D0, $64
    
    IID_IActiveScriptSiteInterruptPoll: ; {539698A0-CDCA-11CF-A5EB-00AA0047A063}
    Data.l $539698A0
    Data.w $CDCA, $11CF
    Data.b $A5, $EB, $00, $AA, $00, $47, $A0, $63
    
    IID_IActiveScriptSiteWindow:  ; {DB01A1E3-A42B-11CF-8F20-00805F2CD064}
    Data.l $D10F6761
    Data.w $83E9, $11CF
    Data.b $8F, $20, $00, $80, $5F, $2C, $D0, $64
    
    IID_IActiveScriptSiteTraceInfo: ; {4B7272AE-1955-4BFE-98B0-780621888569}
    Data.l $4B7272AE
    Data.w $1955, $4BFE
    Data.b $98, $B0, $78, $06, $21, $88, $85, $69
    
    IID_IActiveScriptSiteUIControl: ; {AEDAE97E-D7EE-4796-B960-7F092AE844AB}
    Data.l $AEDAE97E
    Data.w $D7EE, $4796
    Data.b $B9, $60, $7F, $09, $2A, $E8, $44, $AB
    
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
      IID_IActiveScriptParse:  ; {BB1A2AE2-A4F9-11CF-8F20-00805F2CD064} 32 bit
      Data.l $BB1A2AE2
      Data.w $A4F9, $11CF
      Data.b $8F, $20, $00, $80, $5F, $2C, $D0, $64
    CompilerEndIf
    
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      IID_IActiveScriptParse:  ; {C7EF7658-E1EE-480E-97EA-D52CB4D76D17} 64 bit
      Data.l $C7EF7658
      Data.w $E1EE, $480E
      Data.b $97, $EA, $D5, $2C, $B4, $D7, $6D, $17
    CompilerEndIf
    
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
      IID_IActiveScriptSiteDebug: ; {51973C11-CB0C-11D0-B5C9-00A0244A0E7A} 32 bit
      Data.l $51973C11
      Data.w $CB0C, $11D0
      Data.b $B5, $C9, $00, $A0, $24, $4A, $0E, $7A
    CompilerEndIf
    
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      IID_IActiveScriptSiteDebug: ; {D6B96B0A-7463-402C-92AC-89984226942F} 64 bit
      Data.l $D6B96B0A
      Data.w $7463, $402C
      Data.b $92, $AC, $89, $98, $42, $26, $94, $2F
    CompilerEndIf
    
  EndDataSection
  
  ; -----------------------------------------------------------------------------------
  
  ;-- Public Funtions
  
  Declare.s GetGuidString(*Guid.GUID)
  
  ; -----------------------------------------------------------------------------------
  
EndDeclareModule

; ---

Module ActiveScriptCommon
  
  EnableExplicit
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Procedure.s GetGuidString(*Guid.GUID)
    Protected msg.s
    msg = "{"
    msg + RSet (Hex(*Guid\Data1  , #PB_Long), 8, "0") + "-"
    msg + RSet (Hex(*Guid\Data2  , #PB_Word), 4, "0") + "-"
    msg + RSet (Hex(*Guid\Data3  , #PB_Word), 4, "0") + "-"
    msg + RSet (Hex(*Guid\Data4[0], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[1], #PB_Byte), 2, "0") + "-"
    msg + RSet (Hex(*Guid\Data4[2], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[3], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[4], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[5], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[6], #PB_Byte), 2, "0")
    msg + RSet (Hex(*Guid\Data4[7], #PB_Byte), 2, "0")
    msg + "}"
    ProcedureReturn msg
  EndProcedure
  
  ; ---------------------------------------------------------------------------
  
EndModule

; ***************************************************************************************

;- Module ActiveScriptRuntime - Integrates runtime variables from Purebasic into VB-Script

DeclareModule ActiveScriptRuntime
  
  Declare New()
  
EndDeclareModule

Module ActiveScriptRuntime
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Enumeration 1
    #DispID_RuntimeCall
    #DispId_RuntimeInteger
    #DispId_RuntimeDouble
    #DispId_RuntimeString
    #DispId_RuntimeSleep
    #DispId_RuntimeTrace
  EndEnumeration
  
  Structure objRuntime
    *VTABLE
    cntRef.i
  EndStructure
  
  Structure udtArgs
    Value.Variant[0]
  EndStructure
  
  Prototype protoRuntimeProc(cArgs, *Args.udtArgs, *pResult.Variant)
  
  ; -----------------------------------------------------------------------------------
  
  Procedure CheckVT(*var.VARIANT, Type)
    If (*var\vt & #VT_TYPEMASK) <> Type
      ProcedureReturn #DISP_E_BADVARTYPE
    Else
      ProcedureReturn #S_OK
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure.s VT_STR(*Var.Variant)
    Protected hr, result.s, VarDest.Variant
    If *Var
      If *Var\vt = #VT_BSTR
        result = PeekS(*Var\bstrVal, #PB_Any, #PB_Unicode)
        ProcedureReturn result
      Else
        hr = VariantChangeType_(VarDest, *Var, 0, #VT_BSTR)
        If hr = #S_OK
          result = PeekS(VarDest\bstrVal, #PB_Any, #PB_Unicode)
          VariantClear_(VarDest)
          ProcedureReturn result
        Else
          ProcedureReturn ""
        EndIf
      EndIf
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  ; Begin Standard Interfaces
  
  Procedure QueryInterface(*This.objRuntime, *iid.IID, *Object.Integer)
    
    ; Standardzuweisungen auf eigenes Objekt
    If CompareMemory(*iid, ?IID_IUnknown, 16)
      Debug "Runtime - QueryInterface() : IUnknown -> Ok", #DebugLevelRuntimeDebug
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    ElseIf CompareMemory(*iid, ?IID_IDispatch, 16)
      Debug "Runtime - QueryInterface() : IDispatch -> Ok", #DebugLevelRuntimeDebug
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    ElseIf CompareMemory(*iid, ?IID_IDispatchEx, 16)
      ; Debug "Runtime - QueryInterface() : IDispatchEx -> No Interface", #DebugLevelRuntimeDebug
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    Else
      Debug "Runtime - QueryInterface() : No Interface", #DebugLevelRuntimeDebug
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddRef(*This.objRuntime)
    
    Debug "Runtime - AddRef() :  Refcount = " + Str(*This\cntRef) + " > " + Str(*This\cntRef + 1), #DebugLevelRuntimeDebug
    *This\cntRef + 1
    ProcedureReturn *This\cntRef
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Release(*This.objRuntime)
    
    *This\cntRef - 1
    If *This\cntRef < 1
      Debug "Runtime - Release() : Destroy Object", #DebugLevelRuntimeDebug
      FreeStructure(*This)
      ProcedureReturn 0
    Else
      Debug "Runtime - Release() : Refcount = " + Str(*This\cntRef + 1) + " > " + Str(*This\cntRef), #DebugLevelRuntimeDebug
      ProcedureReturn *This\cntRef
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetTypeInfoCount(*This.objRuntime, *CntTypeInfo.Long)
    *CntTypeInfo\l = 0
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetTypeInfo(*This.objRuntime, TypeInfo.l, LocalId.l, *ppTypeInfo.Integer)
    ProcedureReturn #E_NOTIMPL
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetIDsOfNames(*This.objRuntime, *iid.IID, *Name.String, cntNames.l, lcid.l, *DispId.Long)
    
    Protected Name.s
    
    Name = LCase(*Name\s)
    
    ; Hier die Funktionsnamen auf DispId auflösen
    Select name
      Case "integer"
        *DispId\l = #DispId_RuntimeInteger
      Case "double"
        *DispId\l = #DispId_RuntimeDouble
      Case "string"
        *DispId\l = #DispId_RuntimeString
      Case "call"
        *DispId\l = #DispID_RuntimeCall
      Case "sleep"
        *DispId\l = #DispId_RuntimeSleep
      Case "trace"
        *DispId\l = #DispId_RuntimeTrace
      Default
        Debug "Runtime - GetIDsOfNames() : Member Not Found", #DebugLevelRuntimeDebug
        ProcedureReturn #DISP_E_MEMBERNOTFOUND
        
    EndSelect
    
    Debug "Runtime - GetIDsOfNames() : Name = " + Name + " -> DispId = " + *DispId\l, #DebugLevelRuntimeDebug
    
    ProcedureReturn #S_OK
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Invoke(*This.objRuntime, DispId.l, *iid.IID, lcid.l, Flags.w, *DispParams.DISPPARAMS, *vResult.VARIANT, *ExcepInfo.EXCEPINFO, *ArgErr.Integer)
    
    Protected cArgs, *vArgs.udtArgs, name.s, value.variant, *Call.protoRuntimeProc, t1
    
    cArgs  = *DispParams\cArgs
    *vArgs = *DispParams\rgvarg
    
    Select DispId
      Case #DispID_RuntimeCall
        If Flags & #DISPATCH_PROPERTYGET
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs < 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          cArgs - 1
          If CheckVT(*vArgs\Value[cArgs], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[cArgs])
          Debug "Runtime - Invoke() PropertyGet - Call : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name) And Right(name,2) = "()"
            *Call = GetRuntimeInteger(name)
            If *Call
              ProcedureReturn *Call(cArgs, *vArgs, *vResult)
            EndIf
          Else
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          
        ElseIf Flags & #DISPATCH_METHOD
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs < 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          cArgs - 1
          If CheckVT(*vArgs\Value[cArgs], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[cArgs])
          Debug "Runtime - Invoke() Method - Call : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name) And Right(name,2) = "()"
            *Call = GetRuntimeInteger(name)
            If *Call
              ProcedureReturn *Call(cArgs, *vArgs, 0) ; No Result
            EndIf
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
        EndIf
        
      Case #DispId_RuntimeInteger
        If Flags & #DISPATCH_PROPERTYGET
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[0], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[0])
          Debug "Runtime - Invoke() PropertyGetInteger : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
              *vResult\vt   = #VT_I4
              *vResult\lVal = GetRuntimeInteger(name)
            CompilerElse
              *vResult\vt    = #VT_I8
              *vResult\llVal = GetRuntimeInteger(name)
            CompilerEndIf
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
          
        ElseIf Flags & #DISPATCH_PROPERTYPUT
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 2
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[1], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[1])
          Debug "Runtime - Invoke() PropertyPutInteger : " + Name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
              If VariantChangeType_(Value, *vArgs\Value[0], 0, #VT_I4) = #S_OK
                SetRuntimeInteger(name, Value\lVal)
                VariantClear_(Value)
              EndIf
            CompilerElse
              If VariantChangeType_(Value, *vArgs\Value[0], 0, #VT_I8) = #S_OK
                SetRuntimeInteger(name, Value\llVal)
                VariantClear_(Value)
              EndIf
            CompilerEndIf
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
        Else
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        
      Case #DispId_RuntimeDouble
        If Flags & #DISPATCH_PROPERTYGET
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[0], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[0])
          Debug "Runtime - Invoke() PropertyGetDouble : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            *vResult\vt     = #VT_R8
            *vResult\dblVal = GetRuntimeDouble(name)
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
          
        ElseIf Flags & #DISPATCH_PROPERTYPUT
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 2
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[1], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[1])
          Debug "Runtime - Invoke() PropertyPutDouble : " + Name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            If VariantChangeType_(Value, *vArgs\Value[0], 0, #VT_R8) = #S_OK
              SetRuntimeDouble(name, Value\dblVal)
              VariantClear_(Value)
            EndIf
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
        Else
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        
      Case #DispId_RuntimeString
        If Flags & #DISPATCH_PROPERTYGET
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[0], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[0])
          Debug "Runtime - Invoke() PropertyGetString : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            *vResult\vt      = #VT_BSTR
            *vResult\bstrVal = SysAllocString_(GetRuntimeString(name))
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
          
        ElseIf Flags & #DISPATCH_PROPERTYPUT
          ; Hier werden die Anzahl der Parameter überprüft
          If cArgs <> 2
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[1], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          name = VT_STR(*vArgs\Value[1])
          Debug "Runtime - Invoke() PropertyPutString : " + name, #DebugLevelRuntimeDebug
          If IsRuntime(name)
            If VariantChangeType_(Value, *vArgs\Value[0], 0, #VT_BSTR) = #S_OK
              SetRuntimeString(name, PeekS(Value\bstrVal))
              VariantClear_(Value)
            EndIf
            ProcedureReturn #S_OK
          Else
            ProcedureReturn #DISP_E_BADINDEX
          EndIf
        Else
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        
      Case #DispId_RuntimeSleep
        ; Hier werden die Anzahl der Parameter überprüft
        If *Dispparams\cArgs <> 1
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        ; Hier werden die Typen der Parameter überprüft
        If VariantChangeType_(Value, *vArgs\Value[0], 0, #VT_I4) = #S_OK
          t1 = Value\lVal
          VariantClear_(Value)
        Else
          ProcedureReturn #DISP_E_BADVARTYPE
        EndIf
        Debug "Runtime - Invoke() Sleep : " + t1, #DebugLevelRuntimeDebug
        If t1 > 60000
          t1 = 60000
        EndIf
        Delay(t1)
        ProcedureReturn #S_OK
        
      Case #DispId_RuntimeTrace
        ; Hier werden die Anzahl der Parameter überprüft
        If *Dispparams\cArgs <> 1
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        ; Hier werden die Typen der Parameter überprüft
        name = VT_STR(*vArgs\Value[0])
        If #UseActiveScriptDebugView
          OutputDebugString_(name)
        EndIf
        Debug "Runtime.Trace: " + name, #DebugLevelRuntimeTrace
        ProcedureReturn #S_OK
        
      Default
        ProcedureReturn #DISP_E_MEMBERNOTFOUND
        
    EndSelect
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure New()
    Protected *this.objRuntime
    
    *this = AllocateStructure(objRuntime)
    If *this = 0
      Debug "New ActiveRuntime - Out Of Memory", #DebugLevelRuntimeDebug
      ProcedureReturn 0
    Else
      Debug "New ActiveRuntime - Allocate Object", #DebugLevelActiveScriptEx
      *this\VTABLE = ?VT_Runtime
      *this\cntRef = 1
      ProcedureReturn *this
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  DataSection
    VT_Runtime:
    Data.i @QueryInterface()
    Data.i @AddRef()
    Data.i @Release()
    Data.i @GetTypeInfoCount()
    Data.i @GetTypeInfo()
    Data.i @GetIDsOfNames()
    Data.i @Invoke()
  EndDataSection
  
  ; -----------------------------------------------------------------------------------
  
EndModule

; ***************************************************************************************

;- Module ActiveScriptInterruptPull

DeclareModule ActiveScriptInterruptPull
  
  Declare New()
  
EndDeclareModule

; ---

Module ActiveScriptInterruptPull
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Structure objActiveScriptSiteInterruptPoll
    *VTable
    cntRef.i
    *IID.IID
    *Me.cSH
    time.i
  EndStructure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure QueryInterface(*This.objActiveScriptSiteInterruptPoll, *iid.IID, *Object.Integer)
    
    ; Standardzuweisungen auf eigenes Objekt
    If CompareMemory(*iid, ?IID_IUnknown, 16)
      Debug "ActiveScriptSiteInterruptPoll - QueryInterface() : IUnknown -> Ok", #DebugLevelActiveScript
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    Else
      Debug "ActiveScriptSiteInterruptPoll - QueryInterface() : No Interface", #DebugLevelActiveScript
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddRef(*This.objActiveScriptSiteInterruptPoll)
    
    Debug "ActiveScriptSiteInterruptPoll - AddRef() :  Refcount = " + Str(*This\cntRef) + " > " + Str(*This\cntRef + 1), #DebugLevelActiveScript
    *This\cntRef + 1
    ProcedureReturn *This\cntRef
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Release(*This.objActiveScriptSiteInterruptPoll)
    
    *This\cntRef - 1
    If *This\cntRef < 1
      Debug "ActiveScriptSiteInterruptPoll - Release() : Destroy Object", #DebugLevelActiveScript
      FreeStructure(*This)
      ProcedureReturn 0
    Else
      Debug "ActiveScriptSiteInterruptPoll - Release() : Refcount = " + Str(*This\cntRef + 1) + " > " + Str(*This\cntRef), #DebugLevelActiveScript
      ProcedureReturn *This\cntRef
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure QueryContinue(*This.objActiveScriptSiteInterruptPoll)
    
    Debug "ActiveScriptSiteInterruptPoll - QueryContinue()", #DebugLevelActiveScript
    ; Abfrage ob Script fortgesetzt werden soll
    Select MessageRequester("ActiveScript", "Scriptcodes stopped." + #CRLF$ + "Continue Scriptcode?", #PB_MessageRequester_YesNo)
      Case #PB_MessageRequester_Yes
        ProcedureReturn #S_OK
      Case #PB_MessageRequester_No
        ProcedureReturn #S_FALSE
    EndSelect
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure New()
    Protected *this.objActiveScriptSiteInterruptPoll
    
    *this = AllocateStructure(objActiveScriptSiteInterruptPoll)
    If *this = 0
      Debug "New ActiveScriptSiteInterruptPoll - Out Of Memory", #DebugLevelActiveScript
      ProcedureReturn 0
    Else
      Debug "New ActiveScriptSiteInterruptPoll - Allocate Object", #DebugLevelActiveScriptEx
      *this\VTABLE = ?VT_ActiveScriptSiteInterruptPoll
      *this\IID    = ?IID_IActiveScriptSiteInterruptPoll
      *this\cntRef = 1
      *this\Me     = 0
      ProcedureReturn *this
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  DataSection
    VT_ActiveScriptSiteInterruptPoll:
    Data.i @QueryInterface()
    Data.i @AddRef()
    Data.i @Release()
    Data.i @QueryContinue()
  EndDataSection
  
  ; -----------------------------------------------------------------------------------
  
EndModule

; ***************************************************************************************

;- Module ActiveScriptSiteWindow

DeclareModule ActiveScriptSiteWindow
  
  Declare New()
  
EndDeclareModule

; ---

Module ActiveScriptSiteWindow
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Structure objActiveScriptSiteWindow
    *VTable
    cntRef.i
  EndStructure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure QueryInterface(*This.objActiveScriptSiteWindow, *iid.IID, *Object.Integer)
    
    If CompareMemory(*iid, ?IID_IUnknown, 16)
      ; Standardzuweisungen auf eigenes Objekt
      Debug "ActiveScriptSiteWindow - QueryInterface() : IUnknown -> Ok", #DebugLevelActiveScript
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    Else
      ; Unbekanntes Interface
      Debug "ActiveScriptSiteWindow - QueryInterface() : No Interface", #DebugLevelActiveScript
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddRef(*This.objActiveScriptSiteWindow)
    
    Debug "ActiveScriptSiteWindow - AddRef() :  Refcount = " + Str(*This\cntRef) + " > " + Str(*This\cntRef + 1), #DebugLevelActiveScript
    *This\cntRef + 1
    ProcedureReturn *This\cntRef
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Release(*This.objActiveScriptSiteWindow)
    
    *This\cntRef - 1
    If *This\cntRef < 1
      Debug "ActiveScriptSiteWindow - Release() : Destroy Object", #DebugLevelActiveScript
      FreeStructure(*This)
      ProcedureReturn 0
    Else
      Debug "ActiveScriptSiteWindow - Release() : Refcount = " + Str(*This\cntRef + 1) + " > " + Str(*This\cntRef), #DebugLevelActiveScript
      ProcedureReturn *This\cntRef
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetWindow(*this.objActiveScriptSiteWindow, *WindowID.Integer)
    Debug "ActiveScriptSiteWindow - GetWindow()", #DebugLevelActiveScript
    *WindowID\i = 0
    ProcedureReturn #E_NOTIMPL
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure EnableModless(*this.objActiveScriptSiteWindow, fEnable)
    Debug "ActiveScriptSiteWindow - EnableModless()", #DebugLevelActiveScript
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure New()
    Protected *this.objActiveScriptSiteWindow
    
    *this = AllocateStructure(objActiveScriptSiteWindow)
    If *this = 0
      Debug "New ActiveScriptSiteWindow - Out Of Memory", #DebugLevelActiveScript
      ProcedureReturn 0
    Else
      Debug "New ActiveScriptSiteWindow - Allocate Object", #DebugLevelActiveScriptEx
      *this\VTABLE = ?VT_ActiveScriptSiteWindow
      *this\cntRef = 1
      ProcedureReturn *this
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  DataSection
    VT_ActiveScriptSiteWindow:
    Data.i @QueryInterface()
    Data.i @AddRef()
    Data.i @Release()
    Data.i @GetWindow()
    Data.i @EnableModless()
  EndDataSection
  
  ; -----------------------------------------------------------------------------------
  
EndModule

; ***************************************************************************************

;- Module ActiveScriptSite

DeclareModule ActiveScriptSite
  
  Declare New(*Parent)
  
EndDeclareModule

; ---

Module ActiveScriptSite
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Structure objActiveScriptSite
    *VTABLE
    cntRef.i
    *Parent.objActiveScriptControl
    *ActiveScriptInterruptPoll.IActiveScriptSiteInterruptPoll
    *ActiveScriptSiteWindow.IActiveScriptSiteWindow
  EndStructure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure QueryInterface(*this.objActiveScriptSite, *iid.IID, *Object.Integer)
    
    If CompareMemory(*iid, ?IID_IUnknown, 16)
      ; IUnknown
      Debug "ActiveScriptSite - QueryInterface() : IUnknown -> Ok", #DebugLevelActiveScript
      *this\cntRef + 1
      *Object\i = *this
      ProcedureReturn #S_OK
      
    ElseIf CompareMemory(*iid, ?IID_IActiveScriptSite, 16)
      ; ActiveScriptSite
      Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSite -> Ok", #DebugLevelActiveScript
      *this\cntRef + 1
      *Object\i = *this
      ProcedureReturn #S_OK
      
    ElseIf CompareMemory(*iid, ?IID_IActiveScriptSiteWindow, 16)
      ; ActiveScriptSiteWindow - Objekt zuweisen
      If *this\ActiveScriptSiteWindow = 0
        *this\ActiveScriptSiteWindow = ActiveScriptSiteWindow::New()
        If *this\ActiveScriptSiteWindow
          Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteWindow -> New", #DebugLevelActiveScript
          ProcedureReturn #S_OK
        Else
          Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteWindow -> Out of Memory", #DebugLevelActiveScript
          ProcedureReturn #E_OUTOFMEMORY
        EndIf
      Else
        Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteWindow -> Ok", #DebugLevelActiveScript
        *this\ActiveScriptSiteWindow\AddRef()
        *Object\i = *this\ActiveScriptSiteWindow
        ProcedureReturn #S_OK
      EndIf
      
    ElseIf CompareMemory(*iid, ?IID_IActiveScriptSiteUIControl, 16)
      ; ActiveScriptSiteUIControl
      Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteUIControl -> No Interface", #DebugLevelActiveScript
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
      
    ElseIf CompareMemory(*iid, ?IID_IActiveScriptSiteInterruptPoll, 16)
      If Not #UseActiveScriptInterruptPull
        Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteInterruptPoll -> No Interface", #DebugLevelActiveScript
        ProcedureReturn #E_NOINTERFACE
      EndIf
      ; SiteInterruptPoll - Objekt zuweisen
      If *this\ActiveScriptInterruptPoll = 0
        *this\ActiveScriptInterruptPoll = ActiveScriptInterruptPull::New()
        If *this\ActiveScriptInterruptPoll
          Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteInterruptPoll -> New", #DebugLevelActiveScript
          ProcedureReturn #S_OK
        Else
          Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteInterruptPoll -> Out of Memory", #DebugLevelActiveScript
          ProcedureReturn #E_OUTOFMEMORY
        EndIf
      Else
        Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteInterruptPoll -> Ok", #DebugLevelActiveScript
        *this\ActiveScriptInterruptPoll\AddRef()
        *Object\i = *this\ActiveScriptInterruptPoll
        ProcedureReturn #S_OK
      EndIf
      
    ElseIf CompareMemory(*iid, ?IID_IActiveScriptSiteDebug, 16)
      ; ActiveScriptSiteDebug
      Debug "ActiveScriptSite - QueryInterface() : IActiveScriptSiteDebug -> No Interface", #DebugLevelActiveScript
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
      
    Else
      Debug "ActiveScriptSite - QueryInterface() : IID " + GetGuidString(*iid) + " -> No Interface", #DebugLevelActiveScript
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddRef(*this.objActiveScriptSite)
    
    Debug "ActiveScriptSite - AddRef() : Refcount " + Str(*This\cntRef) + " > " + Str(*This\cntRef + 1), #DebugLevelActiveScript
    *this\cntRef + 1
    ProcedureReturn *this\cntRef
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Release(*this.objActiveScriptSite)
    Protected hr
    *this\cntRef - 1
    If *this\cntRef < 1
      If *this\ActiveScriptInterruptPoll
        Repeat
          hr = *this\ActiveScriptInterruptPoll\Release()
        Until hr = 0
      EndIf
      If *this\ActiveScriptSiteWindow
        Repeat
          hr = *this\ActiveScriptSiteWindow\Release()
        Until hr = 0
      EndIf
      Debug "ActiveScriptSite - Release() : Destroy Object", #DebugLevelActiveScript
      FreeStructure(*this)
      ProcedureReturn 0
    Else
      Debug "ActiveScriptSite - Release() : Refcount = " + Str(*This\cntRef + 1) + " > " + Str(*This\cntRef), #DebugLevelActiveScript
      ProcedureReturn *this\cntRef
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetLCID(*this.objActiveScriptSite, *LCID.Long)
    Protected sLCID.s{6}
    
    ;Language Id auslesen
    GetLocaleInfo_(#LOCALE_USER_DEFAULT, #LOCALE_ILANGUAGE, @sLCID, 6)
    *LCID\l = Val(sLCID)
    ProcedureReturn #S_OK
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetItemInfo(*this.objActiveScriptSite, SpaceName.s, ReturnMask.l, *ItemPtr.Integer, *TypeInfo.Long)
    Protected name.s
    
    Debug "ActiveScriptSite - GetItemInfo() : SpaceName = " + SpaceName, #DebugLevelActiveScript
    Select ReturnMask
      Case #SCRIPTINFO_IUNKNOWN
        name = LCase(SpaceName)
        If FindMapElement(*this\Parent\NamedItems(), name)
          *ItemPtr\i = *this\Parent\NamedItems()\Object
          ProcedureReturn #S_OK
        EndIf
      Case #SCRIPTINFO_ITYPEINFO
        ProcedureReturn #E_NOTIMPL
      Default
        ProcedureReturn #E_NOTIMPL
    EndSelect
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetDocVersionString(*this.objActiveScriptSite, *result)
    ProcedureReturn #E_NOTIMPL
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure OnScriptTerminate(*this.objActiveScriptSite, *pvarResult.Variant, *pexcepinfo.excepinfo)
    Debug "ActiveScriptSite - OnScriptTerminate()", #DebugLevelActiveScript
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure OnStateChange(*this.objActiveScriptSite, ssScriptState)
    Debug "ActiveScriptSite - OnStateChange() : State = " + ssScriptState, #DebugLevelActiveScript
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure OnScriptError(*this.objActiveScriptSite, *ScriptError.IActiveScriptError)
    Protected Title.s, Error.s, pexcepinfo.excepinfo, pbstrSourceLineText
    Protected pdwSourceContext, pulLineNumber, plCharacterPosition
    
    Debug "ActiveScriptSite - OnScriptError()", #DebugLevelActiveScript
    
    *ScriptError\GetExceptionInfo(@pexcepinfo)
    *ScriptError\GetSourcePosition(@pdwSourceContext, @pulLineNumber, @plCharacterPosition)
    *ScriptError\GetSourceLineText(@pbstrSourceLineText)
    
    Title = "ActiveScriptSite - OnScriptError"
    Error = ""
    If pexcepinfo\bstrSource
      Error + PeekS(pexcepinfo\bstrSource) + #LF$ + #LF$
      SysFreeString_(pexcepinfo\bstrSource)
    EndIf
    If pexcepinfo\bstrDescription
      Error + PeekS(pexcepinfo\bstrDescription) + #LF$
      SysFreeString_(pexcepinfo\bstrDescription)
    EndIf
    Error + "Line: " + pulLineNumber + " / Column: " + plCharacterPosition + #LF$ + #LF$
    If pbstrSourceLineText
      Error + "SourceLine: " + PeekS(pbstrSourceLineText)
      SysFreeString_(pbstrSourceLineText)
    EndIf
    If pexcepinfo\bstrHelpFile
      SysFreeString_(pexcepinfo\bstrHelpFile)
    EndIf
    
    MessageRequester(Title, Error, #PB_MessageRequester_Error)
    
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure OnEnterScript(*this.objActiveScriptSite)
    Debug "ActiveScriptSite - OnEnterScript()", #DebugLevelActiveScript
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure OnLeaveScript(*this.objActiveScriptSite)
    Debug "ActiveScriptSite - OnLeaveScript()", #DebugLevelActiveScript
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure New(*ParentControl)
    Protected *this.objActiveScriptSite
    
    *this = AllocateStructure(objActiveScriptSite)
    If *this = 0
      Debug "ActiveScriptSite - Out Of Memory", #DebugLevelActiveScript
      ProcedureReturn 0
    Else
      Debug "ActiveScriptSite - Allocate Object", #DebugLevelActiveScriptEx
      *this\VTABLE = ?VT_ActiveScriptSite
      *this\cntRef = 1
      *this\Parent = *ParentControl
      ProcedureReturn *this
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  DataSection
    VT_ActiveScriptSite:
    Data.i @QueryInterface()
    Data.i @AddRef()
    Data.i @Release()
    Data.i @GetLCID()
    Data.i @GetItemInfo()
    Data.i @GetDocVersionString()
    Data.i @OnScriptTerminate()
    Data.i @OnStateChange()
    Data.i @OnScriptError()
    Data.i @OnEnterScript()
    Data.i @OnLeaveScript()
  EndDataSection
  
  ; -----------------------------------------------------------------------------------
  
EndModule

; ***************************************************************************************

;- Module ActiveScript

DeclareModule ActiveScript
  
  #SCRIPTTEXT_ISVISIBLE      = 2
  #SCRIPTTEXT_ISEXPRESSION   = 32
  #SCRIPTTEXT_ISPERSISTENT   = 64
  
  Declare NewActiveScript(Script.s = "VBScript")
  Declare FreeActiveScript(*Control)
  Declare ParseScriptText(*Control, Code.s, dwFlags = #SCRIPTTEXT_ISPERSISTENT | #SCRIPTTEXT_ISVISIBLE)
  Declare AddNamedObject(*Control, SpaceName.s, *Object.IDispatch)
  
EndDeclareModule

; ---

Module ActiveScript
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Global ClsId.GUID
  Global ExcInfo.EXCEPINFO
  Global LastError
  
  ; -----------------------------------------------------------------------------------
  
  Procedure NewActiveScript(Script.s = "VBScript")
    Protected hr, *Control.objActiveScriptControl
    
    With *Control
      Debug "NewActiveScript - AllocateStructure()", #DebugLevelActiveScriptEx
      *Control = AllocateStructure(objActiveScriptControl)
      If *Control = 0
        ProcedureReturn 0
      EndIf
      
      hr = CoInitialize_(0)
      If hr <> #S_OK And hr <> #S_FALSE
        LastError = hr
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; KlassenId suchen
      Debug "NewActiveScript - CLSIDFromProgID : ActiveScript(" + Script + ")", #DebugLevelActiveScriptEx
      hr = CLSIDFromProgID_(@Script, @ClsId)
      If hr <> #S_OK
        LastError = hr
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Instanz der Scriptengine erstellen
      Debug "NewActiveScript - CoCreateInstance : ActiveScript", #DebugLevelActiveScriptEx
      hr = CoCreateInstance_(@ClsId, 0, 1, ?IID_IActiveScript, @\ActiveScript)
      If hr <> #S_OK
        LastError = hr
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      hr = \ActiveScript\AddRef()
      Debug "NewActiveScript - ActiveScript.AddRef() : RefCount " + hr, #DebugLevelActiveScriptEx
      
      ; Parseinterface der Scriptengine suchen
      Debug "NewActiveScript - ActiveScript.QueryInterface() : ActiveScriptParse", #DebugLevelActiveScriptEx
      hr = \ActiveScript\QueryInterface(?IID_IActiveScriptParse, @\ActiveScriptParse)
      If hr <> #S_OK
        LastError = hr
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Object für Scriptsite erstellen
      Debug "NewActiveScript - CreateObject() : ActiveScriptSide", #DebugLevelActiveScriptEx
      \ActiveScriptSite = ActiveScriptSite::New(*Control)
      If \ActiveScriptSite
        \ActiveScriptSite\AddRef()
      Else
        LastError = #E_UNEXPECTED
        \ActiveScriptParse\Release()
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Scriptsite zuweisen
      Debug "NewActiveScript - ActiveScript.SetScriptSide()", #DebugLevelActiveScriptEx
      hr = \ActiveScript\SetScriptSite(\ActiveScriptSite)
      If hr <> #S_OK
        LastError = hr
        \ActiveScriptSite\Release()
        \ActiveScriptParse\Release()
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Parseinterface initialisieren
      Debug "NewActiveScript - ActiveScriptParse.InitNew()", #DebugLevelActiveScriptEx
      hr = \ActiveScriptParse\InitNew()
      If hr <> #S_OK
        LastError = hr
        \ActiveScriptSite\Release()
        \ActiveScriptParse\Release()
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Script Engine Starten
      Debug "NewActiveScript - ActiveScript.SetScriptState()", #DebugLevelActiveScriptEx
      hr = \ActiveScript\SetScriptState(#SCRIPTSTATE_STARTED)
      If hr <> #S_OK
        LastError = hr
        \ActiveScriptSite\Release()
        \ActiveScriptParse\Release()
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Script Engine Verbinden
      hr = \ActiveScript\SetScriptState(#SCRIPTSTATE_CONNECTED)
      If hr <> #S_OK
        LastError = hr
        \ActiveScriptSite\Release()
        \ActiveScriptParse\Release()
        \ActiveScript\Release()
        FreeStructure(*Control)
        ProcedureReturn 0
      EndIf
      
      ; Added PB Runtime variables
      Debug "NewActiveScript - ActiveScript.AddNamedItem() : Object Runtime", #DebugLevelActiveScriptEx
      AddNamedObject(*Control, "Runtime", ActiveScriptRuntime::New())
      
      ProcedureReturn *Control
    EndWith
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure FreeActiveScript(*Control.objActiveScriptControl)
    Protected hr
    
    With *Control
      If \ActiveScriptParse
        hr = \ActiveScriptParse\AddRef()
        Debug "FreeActiveScript - ActiveScriptParse.AddRef() : RefCount " + hr, #DebugLevelActiveScriptEx
        Repeat
          hr = \ActiveScriptParse\Release()
          Debug "FreeActiveScript - ActiveScriptParse.Release() : RefCount " + hr, #DebugLevelActiveScriptEx
        Until hr <= 2
      EndIf
      Debug "FreeActiveScript - Release ActiveScriptSide", #DebugLevelActiveScriptEx
      If \ActiveScriptSite
        Repeat
          hr = \ActiveScriptSite\Release()
        Until hr = 0
      EndIf
      If \ActiveScript
        hr = \ActiveScript\AddRef()
        Debug "FreeActiveScript - ActiveScript.AddRef() : RefCount " + hr, #DebugLevelActiveScriptEx
        Repeat
          hr =  \ActiveScript\Release()
          Debug "FreeActiveScript - ActiveScript.Release() : RefCount " + hr, #DebugLevelActiveScriptEx
        Until hr <= 1
      EndIf
      Debug "FreeActiveScript - Release all NamedItems", #DebugLevelActiveScriptEx
      ForEach \NamedItems()
        Repeat
          hr = \NamedItems()\Object\Release()
        Until hr = 0
      Next
      Debug "FreeActiveScript - FreeStructure()", #DebugLevelActiveScriptEx
      FreeStructure(*Control)
    EndWith
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure ParseScriptText(*Control.objActiveScriptControl, Code.s, dwFlags = #SCRIPTTEXT_ISPERSISTENT | #SCRIPTTEXT_ISVISIBLE)
    Protected hr
    With *Control
      If \ActiveScriptParse
        hr = \ActiveScriptParse\ParseScriptText(@Code, 0, 0, 0, 0, 0, dwFlags, 0, @ExcInfo)
        \ActiveScriptParse\Release()
        ProcedureReturn hr
      Else
        ProcedureReturn #S_FALSE
      EndIf
    EndWith
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddNamedObject(*Control.objActiveScriptControl, SpaceName.s, *Object.IDispatch)
    Protected hr, name.s
    With *Control
      If \ActiveScript
        hr = \ActiveScript\AddNamedItem(@SpaceName, #SCRIPTITEM_ISVISIBLE)
        If hr = #S_OK
          name = LCase(SpaceName)
          AddMapElement(\NamedItems(), name)
          \NamedItems()\Name   = SpaceName
          \NamedItems()\Object = *Object
          \NamedItems()\type   = #SCRIPTITEM_ISVISIBLE
        EndIf
      Else
        hr = #S_FALSE
      EndIf
    EndWith
    ProcedureReturn hr
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
EndModule

;- End Module

; ***************************************************************************************

; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 1509
; FirstLine = 1469
; Folding = ----------
; EnableXP
; DPIAware