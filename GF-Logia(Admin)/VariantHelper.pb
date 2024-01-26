;-TOP

; Comment   : Variant and SafeArray Helper Include
; Author    : mk-soft
; Version   : v2.06.1
; Create    : 23.09.2018
; Update    : 09.12.2021
; Link      : https://www.purebasic.fr/english/viewtopic.php?f=12&t=71399#p527090

; OS        : Windows

; ***************************************************************************************

;- Structure pData for SafeArray (Like 'C' direct access)

CompilerIf Defined(pData, #PB_Structure) = 0
  Structure pData
    StructureUnion
      llVal.q[0]
      lVal.l[0]
      bVal.b[0]
      iVal.w[0]
      fltVal.f[0]
      dblVal.d[0]
      boolVal.w[0]
      bool.w[0]
      scode.l[0]
      cyVal.l[0]
      date.d[0]
      bstrVal.i[0]
      varVal.VARIANT[0]
      Value.VARIANT[0]
      *punkVal.IUnknown[0]
      *pdispVal.IDispatch[0]
      *parray[0]
      *pbVal.BYTE[0]
      *piVal.WORD[0]
      *plVal.LONG[0]
      *pllVal.QUAD[0]
      *pfltVal.FLOAT[0]
      *pdblVal.DOUBLE[0]
      *pboolVal.LONG[0]
      *pbool.LONG[0]
      *pscode.LONG[0]
      *pcyVal.LONG[0]
      *pdate.DOUBLE[0]
      *pbstrVal.INTEGER[0]
      *ppunkVal.INTEGER[0]
      *ppdispVal.INTEGER[0]
      *pparray.INTEGER[0]
      *pvarVal.VARIANT[0]
      *byref[0]
      cVal.b[0]
      uiVal.w[0]
      ulVal.l[0]
      ullVal.q[0]
      intVal.l[0]
      uintVal.l[0]
      *pdecVal.LONG[0]
      *pcVal.BYTE[0]
      *puiVal.WORD[0]
      *pulVal.LONG[0]
      *pullVal.QUAD[0]
      *pintVal.LONG[0]
      *puintVal.LONG[0]
      decVal.l[0]
      brecord.VARIANT_BRECORD[0]
    EndStructureUnion
  EndStructure
CompilerEndIf

; ++++

;- SafeArray

Procedure GetSafeArrayVartype(*psa.SAFEARRAY)
  Protected vartype
  If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
    ProcedureReturn vartype
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure GetSafeArrayDims(*psa.SAFEARRAY)
  ProcedureReturn *psa\cDims
EndProcedure

; ----

Procedure GetSafeArrayElements(*psa.SAFEARRAY, Part) ; Base 1
  If Part < 1 Or Part > *psa\cDims
    ProcedureReturn 0
  Else
    ProcedureReturn *psa\rgsabound[*psa\cDims - Part]\cElements
  EndIf
EndProcedure

; ----

Procedure GetSafeArrayElementPtr(*psa.SAFEARRAY, a, b = 0, c = 0) ; Base 0
  Protected *ptr
  
  With *psa
    Select \cDims
      Case 1
        If a >= \rgsabound[0]\cElements : ProcedureReturn 0 : EndIf
        *ptr = \cbElements * a + \pvData
        ProcedureReturn *ptr
        
      Case 2
        If a >= \rgsabound[1]\cElements : ProcedureReturn 0 : EndIf
        If b >= \rgsabound[0]\cElements : ProcedureReturn 0 : EndIf
        *ptr = \rgsabound[1]\cElements * b
        *ptr + a
        *ptr * \cbElements + \pvData
        ProcedureReturn *ptr
        
      Case 3
        If a >= \rgsabound[2]\cElements : ProcedureReturn 0 : EndIf
        If b >= \rgsabound[1]\cElements : ProcedureReturn 0 : EndIf
        If c >= \rgsabound[0]\cElements : ProcedureReturn 0 : EndIf
        *ptr = \rgsabound[1]\cElements * \rgsabound[2]\cElements * c 
        *ptr + \rgsabound[2]\cElements * b
        *ptr + a
        *ptr * \cbElements + \pvData
        ProcedureReturn *ptr
        
      Default
        ProcedureReturn 0
    EndSelect
  EndWith
  
EndProcedure

; ++++

;- Variant

Procedure IsVariantVarArray(*Value.variant)
  If *Value And *Value\vt & #VT_ARRAY
    ProcedureReturn #True
  Else
    ProcedureReturn #False
  EndIf
EndProcedure

Procedure GetVariantVarType(*Value.Variant)
  If *Value
    ProcedureReturn *Value\vt
  EndIf
EndProcedure

; ----

Procedure.s GetVariantString(*Value.Variant)
  Protected hr, result.s, VarDest.Variant
  If *Value
    If *Value\vt = #VT_BSTR
      ProcedureReturn PeekS(*Value\bstrVal, #PB_Any, #PB_Unicode)
    Else
      hr = VariantChangeType_(VarDest, *Value, 0, #VT_BSTR)
      If hr = #S_OK
        result = PeekS(VarDest\bstrVal, #PB_Any, #PB_Unicode)
        VariantClear_(VarDest)
      EndIf
    EndIf
  EndIf
  ProcedureReturn result
EndProcedure

; ----

Procedure.i GetVariantInteger(*Value.Variant)
  Protected hr, result.i, VarDest.Variant
  If *Value
    CompilerSelect #PB_Compiler_Processor
      CompilerCase #PB_Processor_x86
        If *Value\vt = #VT_I4
          ProcedureReturn *Value\lVal
        Else
          hr = VariantChangeType_(VarDest, *Value, 0, #VT_I4)
          If hr = #S_OK
            result = VarDest\lVal
            VariantClear_(VarDest)
          EndIf
        EndIf
      CompilerCase #PB_Processor_x64
        If *Value\vt = #VT_I8
          ProcedureReturn *Value\llVal
        Else
          hr = VariantChangeType_(VarDest, *Value, 0, #VT_I8)
          If hr = #S_OK
            result = VarDest\llVal
            VariantClear_(VarDest)
          EndIf
        EndIf
    CompilerEndSelect
  EndIf
  ProcedureReturn result
EndProcedure

; ----

Procedure.d GetVariantDouble(*Value.Variant)
  Protected hr, result.d, VarDest.Variant
  If *Value
    If *Value\vt = #VT_R8
      ProcedureReturn *Value\dblVal
    Else
      hr = VariantChangeType_(VarDest, *Value, 0, #VT_R8)
      If hr = #S_OK
        result = VarDest\dblVal
        VariantClear_(VarDest)
      EndIf
    EndIf
  EndIf
  ProcedureReturn result
EndProcedure

; ----

Procedure.i GetVariantDate(*Value.Variant) ; Result PB-Date from Variant Date
  Protected hr, result, VarDest.Variant
  If *Value
    hr = VariantChangeType_(VarDest, *Value, 0, #VT_DATE)
    If hr = #S_OK
      If Int(VarDest\dblVal)
        result = (VarDest\dblVal - 25569.0) * 86400.0
      Else
        result = (VarDest\dblVal) * 86400.0
      EndIf
      VariantClear_(VarDest)
    EndIf
  EndIf
  ProcedureReturn result
EndProcedure

; ----

Procedure.i GetVariantBool(*Value.Variant)
  Protected hr, result, VarDest.Variant
  If *Value
    hr = VariantChangeType_(VarDest, *Value, 0, #VT_BOOL)
    If hr = #S_OK
      If VarDest\bool
        result = #True
      Else
        result = #False
      EndIf
      VariantClear_(VarDest)
    EndIf
  EndIf
  ProcedureReturn result
EndProcedure

; ----

Procedure GetVariantSafeArray(*Value.Variant)
  Protected *psa
  If *Value
    If *Value\vt & #VT_ARRAY
      If *Value\vt & #VT_BYREF
        *psa = *Value\pparray\i
      Else
        *psa = *Value\parray
      EndIf
    EndIf
  EndIf
  ProcedureReturn *psa
EndProcedure

; ----

Procedure SetVariantString(*Value.Variant, String.s)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value
    VariantClear_(*Value)
    *Value\vt = #VT_BSTR
    *Value\bstrVal = SysAllocString_(@String)
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure SetVariantInteger(*Value.Variant, Integer)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value
    VariantClear_(*Value)
    CompilerSelect #PB_Compiler_Processor
      CompilerCase #PB_Processor_x86
        *Value\vt = #VT_I4
        *Value\lVal = Integer
        ProcedureReturn *Value
      CompilerCase #PB_Processor_x64
        *Value\vt = #VT_I8
        *Value\llVal = Integer
        ProcedureReturn *Value
    CompilerEndSelect
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure SetVariantDouble(*Value.Variant, Double.d)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value
    VariantClear_(*Value)
    *Value\vt = #VT_R8
    *Value\dblVal = Double
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure SetVariantDate(*Value.Variant, Date)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value
    VariantClear_(*Value)
    *Value\vt = #VT_DATE
    *Value\dblVal = Date / 86400.0 + 25569.0
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure SetVariantBool(*Value.Variant, State)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value
    VariantClear_(*Value)
    *Value\vt = #VT_BOOL
    If State
      *Value\bool = #VARIANT_TRUE
    Else
      *Value\bool = #VARIANT_FALSE
    EndIf
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure SetVariantSafeArray(*Value.Variant, *SafeArray.SAFEARRAY)
  If *Value = #PB_Any
    *Value = AllocateStructure(Variant)
  EndIf
  If *Value And *SafeArray
    VariantClear_(*Value)
    *Value\vt = #VT_ARRAY | #VT_VARIANT
    *Value\parray = *SafeArray
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure FreeStructureVariant(*Value.Variant)
  If *Value
    VariantClear_(*Value)
    FreeStructure(*Value)
  EndIf
EndProcedure

; ++++

;- Convert Array and List (Strings)

; Covert an array of type string to a simple safearray of type variant

Procedure ArrayToSafeArray(Array Strings.s(1), LBound = 0)
  Protected rgsabound.SAFEARRAYBOUND, *psa.SAFEARRAY, Index, Size
  
  Size = ArraySize(Strings())
  rgsabound\lLbound = LBound
  rgsabound\cElements = Size + 1
  
  *psa = SafeArrayCreate_(#VT_VARIANT, 1, rgsabound)
  If *psa
    For Index = 0 To size
      *psa\pvData\Value[Index]\vt = #VT_BSTR
      *psa\pvData\Value[Index]\bstrVal = SysAllocString_(Strings(Index))
    Next
    ProcedureReturn *psa
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

; Convert a simple safearray of type variant to an array of type string

Procedure SafeArrayToArray(*Source.SAFEARRAY, Array Dest.s(1))
  Protected cnt, index, vartype
  
  cnt = -1
  If *Source And *Source\cDims = 1
    If SafeArrayGetVartype_(*Source, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *Source\rgsabound[0]\cElements - 1
        Dim Dest(cnt)
        For index = 0 To cnt
          Dest(index) = GetVariantString(*Source\pvData\Value[index])
        Next
      EndIf
    EndIf
  EndIf
  ProcedureReturn cnt
EndProcedure

; ----

; Convert a list of type string to a simple safearry of type variant

Procedure ListToSafeArray(List Strings.s(), LBound = 0)
  Protected rgsabound.SAFEARRAYBOUND, *psa.SAFEARRAY, Index, Size
  
  Size = ListSize(Strings())
  If Size
    rgsabound\lLbound = LBound
    rgsabound\cElements = Size
    
    *psa = SafeArrayCreate_(#VT_VARIANT, 1, rgsabound)
    If *psa
      index = 0
      ForEach Strings()
        *psa\pvData\Value[Index]\vt = #VT_BSTR
        *psa\pvData\Value[Index]\bstrVal = SysAllocString_(Strings())
        index + 1
      Next
      ProcedureReturn *psa
    Else
      ProcedureReturn 0
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
EndProcedure

; ----

; Convert a simple safearray of type variant to a list of type string

Procedure SafeArrayToList(*Source.SAFEARRAY, List Dest.s())
  Protected cnt, index, vartype
  
  ClearList(Dest())
  If *Source And *Source\cDims = 1
    If SafeArrayGetVartype_(*Source, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *Source\rgsabound[0]\cElements - 1
        For index = 0 To cnt
          AddElement(Dest())
          Dest() = GetVariantString(*Source\pvData\Value[index])
        Next
      EndIf
    EndIf
  EndIf
  ProcedureReturn cnt
EndProcedure

; ++++

;- PB Array To Variant Array. Only 1 Dims

Procedure StringArrayToVariant(Array String.s(1), *Value.Variant)
  Protected rgsabound.SAFEARRAYBOUND, *psa.SAFEARRAY, Index, Size
  
  If Not *Value
    ProcedureReturn 0
  EndIf
  
  VariantClear_(*Value)
  
  Size = ArraySize(String())
  rgsabound\lLbound = 0
  rgsabound\cElements = Size + 1
  *psa = SafeArrayCreate_(#VT_VARIANT, 1, rgsabound)
  If *psa
    For Index = 0 To Size
      *psa\pvData\Value[Index]\vt = #VT_BSTR
      *psa\pvData\Value[Index]\bstrVal = SysAllocString_(String(Index))
    Next
    *Value\vt = #VT_ARRAY | #VT_VARIANT
    *Value\parray = *psa
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

Procedure DoubleArrayToVariant(Array Double.d(1), *Value.Variant)
  Protected rgsabound.SAFEARRAYBOUND, *psa.SAFEARRAY, Index, Size
  
  If Not *Value
    ProcedureReturn 0
  EndIf
  
  VariantClear_(*Value)
  
  Size = ArraySize(Double())
  rgsabound\lLbound = 0
  rgsabound\cElements = Size + 1
  *psa = SafeArrayCreate_(#VT_VARIANT, 1, rgsabound)
  If *psa
    For Index = 0 To Size
      *psa\pvData\Value[Index]\vt = #VT_R8
      *psa\pvData\Value[Index]\dblVal = Double(Index)
    Next
    *Value\vt = #VT_ARRAY | #VT_VARIANT
    *Value\parray = *psa
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

Procedure IntegerArrayToVariant(Array Integer.i(1), *Value.Variant)
  Protected rgsabound.SAFEARRAYBOUND, *psa.SAFEARRAY, Index, Size
  
  If Not *Value
    ProcedureReturn 0
  EndIf
  
  VariantClear_(*Value)
  
  Size = ArraySize(Integer())
  rgsabound\lLbound = 0
  rgsabound\cElements = Size + 1
  *psa = SafeArrayCreate_(#VT_VARIANT, 1, rgsabound)
  If *psa
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
      For Index = 0 To Size
        *psa\pvData\Value[Index]\vt = #VT_I8
        *psa\pvData\Value[Index]\llVal = Integer(Index)
      Next
    CompilerElse
      For Index = 0 To Size
        *psa\pvData\Value[Index]\vt = #VT_I4
        *psa\pvData\Value[Index]\lVal = Integer(Index)
      Next
    CompilerEndIf
    *Value\vt = #VT_ARRAY | #VT_VARIANT
    *Value\parray = *psa
    ProcedureReturn *Value
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ++++

;- Variant Array To PB Array. Only 1 Dims.

Procedure VariantToStringArray(*Value.Variant, Array Dest.s(1))
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        Dim Dest(cnt)
        For index = 0 To cnt
          Dest(index) = GetVariantString(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure VariantToDoubleArray(*Value.Variant, Array Dest.d(1))
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        Dim Dest(cnt)
        For index = 0 To cnt
          Dest(index) = GetVariantDouble(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure VariantToIntegerArray(*Value.Variant, Array Dest.i(1))
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        Dim Dest(cnt)
        For index = 0 To cnt
          Dest(index) = GetVariantInteger(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

;- Variant Array To PB List. Only 1 Dims.

Procedure VariantToStringList(*Value.Variant, List Dest.s())
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  ClearList(Dest())
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        For index = 0 To cnt
          AddElement(Dest())
          Dest() = GetVariantString(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure VariantToDoubleList(*Value.Variant, List Dest.d())
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  ClearList(Dest())
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        For index = 0 To cnt
          AddElement(Dest())
          Dest() = GetVariantDouble(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

Procedure VariantToIntegerList(*Value.Variant, List Dest.i())
  Protected *psa.SAFEARRAY, cnt, index, vartype
  
  ClearList(Dest())
  
  If *Value And *Value\vt & #VT_ARRAY
    If *Value\vt & #VT_BYREF
      *psa = *Value\pparray\i
    Else
      *psa = *Value\parray
    EndIf
  Else
    ProcedureReturn 0
  EndIf
  
  If *psa And *psa\cDims = 1
    If SafeArrayGetVartype_(*psa, @vartype) = #S_OK
      If vartype = #VT_VARIANT
        cnt = *psa\rgsabound[0]\cElements - 1
        For index = 0 To cnt
          AddElement(Dest())
          Dest() = GetVariantInteger(*psa\pvData\Value[index])
        Next
      EndIf
    EndIf
    ProcedureReturn cnt + 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

; ----

; ***************************************************************************************

; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 777
; FirstLine = 737
; Folding = ------
; EnableXP
; DPIAware