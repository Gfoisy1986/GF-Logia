;-TOP

; Comment   : Modul ActiveScript AddOn SmartTags of type Variant (Case Sensisive)
; Author    : mk-soft
; Version   : v2.04
; Create    : 15.09.2018
; Update    : 02.01.2020
; Link      : https://www.purebasic.fr/english/viewtopic.php?f=12&t=71399#p527089

; OS        : Windows

; ***************************************************************************************

XIncludeFile "Modul_ActiveScript.pb"

DeclareModule ActiveSmartTags
  
  Global NewMap SmartTags.VARIANT()
  
  Declare NewSmartTags()
  Declare ClearSmartTags(Tag.s = "")
  Declare LockSmartTags()
  Declare UnlockSmartTags()
  
EndDeclareModule

Module ActiveSmartTags
  
  EnableExplicit
  
  UseModule ActiveScriptCommon
  
  ; Define Debuglevel
  #DebugLevelSmartags = 2
  
  DebugLevel #DebugLevel
  
  ; -----------------------------------------------------------------------------------
  
  Enumeration 1
    #DispId_Value
  EndEnumeration
  
  Structure objSmartTags
    *VTABLE
    cntRef.i
  EndStructure
  
  Structure udtArgs
    Value.Variant[0]
  EndStructure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure InitModule()
    Global MutexSmartTags = CreateMutex()
  EndProcedure : InitModule()
  
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
  
  Procedure LockSmartTags()
    LockMutex(MutexSmartTags)
    PushMapPosition(SmartTags())
  EndProcedure
  
  Procedure UnlockSmartTags()
    PopMapPosition(SmartTags())
    UnlockMutex(MutexSmartTags)
  EndProcedure
  ; -----------------------------------------------------------------------------------
  
  ; Begin Interfaces IDispatch
  
  Procedure QueryInterface(*This.objSmartTags, *iid.IID, *Object.Integer)
    
    ; Standardzuweisungen auf eigenes Objekt
    If CompareMemory(*iid, ?IID_IUnknown, 16)
      Debug "SmartTags - QueryInterface() : IUnknown -> Ok", #DebugLevelSmartags
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    ElseIf CompareMemory(*iid, ?IID_IDispatch, 16)
      Debug "SmartTags - QueryInterface() : IDispatch -> Ok", #DebugLevelSmartags
      *Object\i = *This
      *This\cntRef + 1
      ProcedureReturn #S_OK
    ElseIf CompareMemory(*iid, ?IID_IDispatchEx, 16)
      Debug "SmartTags - QueryInterface() : IDispatchEx -> No Interface", #DebugLevelSmartags
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    Else
      Debug "SmartTags - QueryInterface() No Interface", #DebugLevelSmartags
      *Object\i = 0
      ProcedureReturn #E_NOINTERFACE
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure AddRef(*This.objSmartTags)
    
    Debug "SmartTags - AddRef() :  Refcount = " + Str(*This\cntRef) + " > " + Str(*This\cntRef+1), #DebugLevelSmartags
    *This\cntRef + 1
    ProcedureReturn *This\cntRef
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Release(*This.objSmartTags)
    
    *This\cntRef - 1
    If *This\cntRef < 1
      Debug "SmartTags - Release() : Destroy Object", #DebugLevelSmartags
      FreeStructure(*This)
      ProcedureReturn 0
    Else
      Debug "SmartTags - Release() : Refcount = " + Str(*This\cntRef + 1) + " > " + Str(*This\cntRef), #DebugLevelSmartags
      ProcedureReturn *This\cntRef
    EndIf
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetTypeInfoCount(*This.objSmartTags, *CntTypeInfo.Long)
    *CntTypeInfo\l = 0
    ProcedureReturn #S_OK
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetTypeInfo(*This.objSmartTags, TypeInfo, LocalId, *ppTypeInfo.Integer)
    ProcedureReturn #E_NOTIMPL
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure GetIDsOfNames(*This.objSmartTags, *iid.IID, *Name.String, cntNames, lcid, *DispId.Long)
    
    Protected Name.s
    
    Name = LCase(*Name\s)
    
    ; Hier die Funktionsnamen auf DispId auflösen
    Select name
      Case "value"  
        *DispId\l = #DispId_Value
        
      Default
        Debug "SmartTags - GetIDsOfNames() : Member Not Found", #DebugLevelSmartags
        ProcedureReturn #DISP_E_MEMBERNOTFOUND
        
    EndSelect
    
    Debug "SmartTags - GetIDsOfNames() : Name = " + Name + " -> DispId = " + *DispId\l, #DebugLevelSmartags
    
    ProcedureReturn #S_OK
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure Invoke(*This.objSmartTags, DispId.l, *iid.IID, lcid.l, Flags.w, *DispParams.DISPPARAMS, *vResult.VARIANT, *ExcepInfo.EXCEPINFO, *ArgErr.Integer)
    
    Protected *vArgs.udtArgs, tagname.s
    
    *vArgs = *DispParams\rgvarg
    
    ; Hier werden die Funktionen aufgerufen
    ; Mit den Flags kann man den Type PropertyGet oder PropertyPut unterscheiden  
    
    Select DispId
      Case 0, #DispId_Value
        ; Funktion für Get aufrufen
        If Flags & #DISPATCH_PROPERTYGET
          ; Hier werden die Anzahl der Parameter überprüft
          If *Dispparams\cArgs <> 1
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[0], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          ; 
          tagname = VT_STR(*vArgs\Value[0])
          Debug "SmartTags - Invoke() PropertyGet : " + tagname, #DebugLevelSmartags
          LockSmartTags()
          If FindMapElement(SmartTags(), tagname)
            VariantCopy_(*vResult, @SmartTags())
            UnlockSmartTags()
            ProcedureReturn #S_OK
          Else
            UnlockSmartTags()
            ProcedureReturn #S_FALSE
          EndIf
          
          ; Funktion für Put aufrufen
        ElseIf Flags & #DISPATCH_PROPERTYPUT
          ; Hier werden die Anzahl der Parameter überprüft
          If *Dispparams\cArgs <> 2
            ProcedureReturn #DISP_E_BADPARAMCOUNT
          EndIf
          ; Hier werden die Typen der Parameter überprüft
          If CheckVT(*vArgs\Value[1], #VT_BSTR)
            ProcedureReturn #DISP_E_BADVARTYPE
          EndIf
          tagname = VT_STR(*vArgs\Value[1])
          Debug "SmartTags - Invoke() PropertyPut : " + tagname, #DebugLevelSmartags
          LockSmartTags()
          If FindMapElement(SmartTags(), tagname)
            VariantClear_(@SmartTags())
            VariantCopy_(@SmartTags(), *vArgs\Value[0])
            UnlockSmartTags()
            ProcedureReturn #S_OK
          Else
            If AddMapElement(SmartTags(), tagname)
              VariantCopy_(@SmartTags(), *vArgs\Value[0])
              UnlockSmartTags()
              ProcedureReturn #S_OK
            Else
              UnlockSmartTags()
              ProcedureReturn #E_OUTOFMEMORY
            EndIf
          EndIf
          
        Else
          ; Funktion wurde ohne Get oder Put aufgerufen
          ProcedureReturn #DISP_E_BADPARAMCOUNT
        EndIf
        
      Default
        ProcedureReturn #DISP_E_MEMBERNOTFOUND
        
    EndSelect
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure NewSmartTags()
    Protected *this.objSmartTags
    
    *this = AllocateStructure(objSmartTags)
    If *this = 0
      Debug "ActiveSmartTags - Out Of Memory", #DebugLevelSmartags
      ProcedureReturn 0
    Else
      *this\VTABLE = ?VT_Smarttags
      *this\cntRef = 1
      ProcedureReturn *this
    EndIf
    
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  Procedure ClearSmartTags(Tag.s = "")
    LockMutex(MutexSmartTags)
    If Bool(Tag)
      If FindMapElement(SmartTags(), Tag)
        VariantClear_(@SmartTags())
        DeleteMapElement(SmartTags())
      EndIf
    Else
      ForEach SmartTags()
        VariantClear_(@SmartTags())
      Next
      ClearMap(SmartTags())
    EndIf
    UnlockMutex(MutexSmartTags)
  EndProcedure
  
  ; -----------------------------------------------------------------------------------
  
  DataSection
    VT_Smarttags:
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

; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 322
; FirstLine = 282
; Folding = ---
; EnableXP
; DPIAware