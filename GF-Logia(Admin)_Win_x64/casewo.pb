 Case #_WO1202 :
    ;OpenGadgetList(1, 4)
   
          
    
         Debug "yes"
        
          aWOordertHandler()
           
          punch()
          
          
          
          ; CloseGadgetList()
          
 Case #_402 : ;archive Workorder
        OpenGadgetList(1 ,4)
        queryarchwo.s = "UPDATE workorder SET status='2' WHERE wo='"+GetGadgetText(#_WO1202)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
       DatabaseUpdate(#mysql, queryarchwo)
     FinishDatabaseQuery(#mysql)
   
       mainwo()
       histwo()
       CloseGadgetList()
      
      
       
  
      
      
        Case #_wo6 : ;open note
            OpenGadgetList(1, 4)
           
       If     DatabaseQuery (#mysql, "SELECT * FROM note WHERE notename='"+GetGadgetText(#_wo6)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
     While  NextDatabaseRow(#mysql) 
         AddGadgetItem(#_wo13, -1, GetDatabaseString(#mysql, 3))
         Wend
         FinishDatabaseQuery(#mysql)
         EndIf
  CloseGadgetList()
 
 
  Case #PB_fh2 : ;creation wo
    
    OpenGadgetList(1, 3)
          wotext1$ = InputRequester("bon de travail" , "nom du bon de travail", "")
          wotext2$ = GetGadgetText(#PB_fh1)
          wotext3$ = "1"
  querywo4.s = "INSERT INTO workorder (wo, serie, status) VALUES ('"+wotext1$+"', '"+wotext2$+"', '"+wotext3$+"')"
;     annee, model, unitee, garantie, plate, proprioname, proprioadd, vehadd, ecm, status, make
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(#mysql, querywo4)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf
 FinishDatabaseQuery(#mysql)
  
  
  CloseGadgetList()
    mainwo()
    
 

 
 
 
Case #_wo14 : ;newjobbuttonhandler
   
   OpenGadgetList(1, 4)
   
 Text200$ = InputRequester("nouvelle job", "Veuillez entrer le nom de la nouvelle job", "")
          Text201$ = InputRequester("Info job", "Veuillez entrer les information sur les travaux", "")
        
   
 If    DatabaseQuery (#mysql, "SELECT * FROM job")
   query67.s = "INSERT INTO job (jobname, jobinfo, wo, pstatus) VALUES ('"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(#_WO1202)+"', '0')"
    
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(#mysql, query67)
    
    Debug "data successfully inserted."

 
    FinishDatabaseQuery(#mysql)
  EndIf
  aWOordertHandler()
  CloseGadgetList()

        
       
       Case #_2002 :;punchout
          
         
         
          OpenGadgetList(1, 4)
       
   
    Debug "editor window saved"
    
    
   
     
               
       query3$ = InputRequester("rapport job : "+GetGadgetText(#_w4), " Veuillez écrire le nouveau rapport", "")
    


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
   
   query12.s = "UPDATE punch SET punchout = '"+time+"', pstatus = '2' WHERE (jobname, wo, pstatus) = ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_WO1202)+"', '1')"
    query12_1.s = "INSERT INTO job (username, jobname, jobinfo, jobrepport, wo, pstatus) VALUES ('"+GetGadgetText(#_wo2)+"', '"+GetGadgetText(#_w4)+"', '"+GetGadgetText(1206)+"', '"+query3$+"', '"+GetGadgetText(#_WO1202)+"', '1')"
    
   
  ; update the database With the literal prepared query And confirm the write
    If DatabaseUpdate(#mysql, query12)
     FinishDatabaseQuery(#mysql)
    MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)
    Debug "punch out query12 "+time+" successfully inserted."
    DatabaseUpdate(#mysql, query12_1)
    FinishDatabaseQuery(#mysql)
      MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)
      Debug "query12_1 successfully inserted."
       punch()
  Else
    Debug "not working punch out"
   
   
  EndIf
  
  
 
 
  
   
  

  

 
  CloseGadgetList()


   Case #_2001 : ;punch in
          
        OpenGadgetList(1, 4)

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
     
   query11.s = "INSERT INTO punch (wo, jobname, username, punchin, pstatus) VALUES ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_wo2)+"', '"+time+"', '1')"
          
  ; update the database With the literal prepared query And confirm the write
                  
            
           If DatabaseUpdate(#mysql, query11)
    
    Debug "punch out "+time+" successfully inserted."
punch()
  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  
 
  CloseGadgetList()
  
   Case  #_w4 : ;joblist
             OpenGadgetList(1, 4)
    
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
      
     
     TextGadget(1204, 200, 320, 320, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     SetGadgetColor(1204, #PB_Gadget_BackColor, $A7E3EF)
    ListViewGadget(1206, 200, 340, 320, 65)
   SetGadgetColor(1206, #PB_Gadget_BackColor, $9280EE)
        
  While NextDatabaseRow(#mysql)
  
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
   
   Wend
     FinishDatabaseQuery(#mysql)
     EndIf
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname) = ('"+GetGadgetText(#_w4)+"')")
      
      
 ListViewGadget(1207, 200, 405, 320, 85)
     ; EditorGadget(1207, 200, 405, 320, 85) 
      SetGadgetColor(1207, #PB_Gadget_BackColor, $F3D2A8)
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, ""+GetDatabaseString(#mysql, 1)+" : " + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   EndIf
   
punch()
    
CloseGadgetList()



Case #PB_w20 :
  
  OpenGadgetList(1 ,4)
  queryw20_1$ = InputRequester("nouveau Kilometrage", "Veuillez entrer le nouveau kilometrage du vehicule", "")
        queryw20.s = "UPDATE flotte SET km='"+queryw20_1$+"' WHERE serie='"+GetGadgetText(6054)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
   If    DatabaseUpdate(#mysql, queryw20)
     FinishDatabaseQuery(#mysql)
   EndIf
        aWOordertHandler()
       CloseGadgetList()
  
     Case #PB_w21 :
       
         OpenGadgetList(1 ,4)
  queryw21_1$ = InputRequester("nouveau Kilometrage", "Veuillez entrer le nouveau kilometrage du vehicule", "")
        queryw21.s = "UPDATE flotte SET hrs='"+queryw21_1$+"' WHERE serie='"+GetGadgetText(6054)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
    If   DatabaseUpdate(#mysql, queryw21)
     FinishDatabaseQuery(#mysql)
   EndIf
        aWOordertHandler()
       CloseGadgetList()
  
     Case #PB_w22 :
       
       OpenGadgetList(1 ,4)
       day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"
   date2.s = FormatDate(""+day+"/"+month+"/"+year+"", Date())
        queryw22.s = "UPDATE flotte SET date='"+date2+"' WHERE serie='"+GetGadgetText(6054)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
    If   DatabaseUpdate(#mysql, queryw22)
      FinishDatabaseQuery(#mysql)
       aWOordertHandler()
   EndIf
       
        CloseGadgetList()
        
  
      Case #PB_w23 :
        
             OpenGadgetList(1 ,4)
       day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"
   date3.s = FormatDate(""+day+"/"+month+"/"+year+"", Date())
        queryw23.s = "UPDATE flotte SET nexmai='"+date3+"' WHERE serie='"+GetGadgetText(6054)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
   If    DatabaseUpdate(#mysql, queryw23)
     FinishDatabaseQuery(#mysql)
     aWOordertHandler()
   EndIf
        
        CloseGadgetList()
  
      Case #PB_w24 :
        
                  OpenGadgetList(1 ,4)
       day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"
   date4.s = FormatDate(""+day+"/"+month+"/"+year+"", Date())
        queryw24.s = "UPDATE flotte SET nexinspq='"+date4+"' WHERE serie='"+GetGadgetText(6054)+"'"
  
        ; update the database with the literal prepared query and confirm the write
     
     If  DatabaseUpdate(#mysql, queryw24)
     FinishDatabaseQuery(#mysql)
   EndIf
        aWOordertHandler()
        CloseGadgetList()
        
        
        
     Case #PB_w27 :
       
       OpenGadgetList(1 ,4)
        queryw27_1.s = InputRequester("nouvelle quantiter", "Veuillez entrer la nouvelle quantiter", "")
        queryw27.s = "UPDATE invwo SET quant='"+queryw27_1+"' WHERE nopic='"+GetGadgetText(#PB_w26)+"'"
        FinishDatabaseQuery(#mysql)
        
        If  DatabaseQuery(#mysql, "SELECT * FROM inventaire WHERE nopiece="+GetGadgetText(#PB_w26)+"", #PB_Database_DynamicCursor) 
   FirstDatabaseRow(#mysql)
   
   queryw27_3.i = GetDatabaseLong(#mysql, 3)
   FinishDatabaseQuery(#mysql)
   
   
   
  DatabaseQuery(#mysql, "SELECT * FROM invwo WHERE nopic="+GetGadgetText(#PB_w26)+"", #PB_Database_DynamicCursor) 
  FirstDatabaseRow(#mysql)
  result345.i = GetDatabaseLong(#mysql, 1)
  FinishDatabaseQuery(#mysql)
   If GetDatabaseLong(#mysql, 1) > Val(queryw27_1)
     
     ;+
    DatabaseQuery(#mysql, "SELECT * FROM invwo WHERE nopic="+GetGadgetText(#PB_w26)+"", #PB_Database_DynamicCursor) 
   FirstDatabaseRow(#mysql)
     result345.i = GetDatabaseLong(#mysql, 1)
     query345.i = Val(queryw27_1) + result345
     FinishDatabaseQuery(#mysql)
     queryw27_5.i = queryw27_3 + query345
   Else
     ;-
     DatabaseQuery(#mysql, "SELECT * FROM invwo WHERE nopic="+GetGadgetText(#PB_w26)+"", #PB_Database_DynamicCursor) 
     FirstDatabaseRow(#mysql)
     result345 = GetDatabaseLong(#mysql, 1)
     query345 = Val(queryw27_1) - result345
     FinishDatabaseQuery(#mysql)
     queryw27_5.i = queryw27_3 - query345
     EndIf
   
   ;queryw27_4.i = Val(queryw27_1)
   ;queryw27_5.i = query345 - queryw27_4
   queryw27_2.s = "UPDATE inventaire SET quantiter='"+Str(queryw27_5)+"' WHERE nopiece='"+GetGadgetText(#PB_w26)+"'"
   DatabaseUpdate(#mysql, queryw27_2)
   FinishDatabaseQuery(#mysql)
   Debug "piece inventaire successfully updated."
   Debug result345
   Debug query345
    Debug queryw27_3
    Debug queryw27_4
    Debug queryw27_5
    DatabaseUpdate(#mysql, queryw27)
    FinishDatabaseQuery(#mysql)
    aWOordertHandler()
  Else
    
    Debug "error inserting data inventaire update! " + DatabaseError()
    
   EndIf
        
        
        
        
        
        
        ; update the database With the literal prepared query And confirm the write
     
       
       FinishDatabaseQuery(#mysql)
   
        
        CloseGadgetList()
        
        
        
      Case #PB_w28 :
        
         
   queryw27_1.s = InputRequester("nouveau # piece", "Veuillez entrer la nouveau # piece -Liste WorkOrder!", "")
   quantcase2_1.i = Val(queryw27_1)
   
   querycase1_2.s = "UPDATE invwo SET nopic='"+quantcase2_1+"' WHERE nopic='"+GetGadgetText(#PB_w26)+"'"
 
      ; update the database With the literal prepared query And confirm the write
            
   If  DatabaseUpdate(#mysql, querycase1_2)
     Debug "#piece successfully updated."
     Debug quantcase2_1
     aWOordertHandler()
   Else
    
     Debug "error  updating # pièce! " + DatabaseError()
    
   EndIf
   FinishDatabaseQuery(#mysql) 
        
        
        
    Case #PB_w29 :
   
   
   
   
    query3_1.s = InputRequester("nouvelle description", "Veuillez entrer la nouvelle description -Liste WorkOrder!", "")
   
   
   querycase3_2.s = "UPDATE invwo SET descp='"+query3_1+"' WHERE nopic='"+GetGadgetText(#PB_w26)+"'"
  
      ; update the database With the literal prepared query And confirm the write
            
   If  DatabaseUpdate(#mysql, querycase3_2)
     Debug "Description successfully updated."
     Debug quantcase2_1
     aWOordertHandler()
   Else
    
     Debug "error  updating description! " + DatabaseError()
    
   EndIf
   FinishDatabaseQuery(#mysql) 
   
   
   
   
   
   
   
   
   
   
   
    
        
     Case #PB_w30 :
        
        ;  DatabaseQuery(#mysql, "SELECT * FROM inventaire WHERE id='"+GetGadgetText(#PB_w32)+"'")
        
     If   DatabaseQuery(#mysql, "SELECT * FROM inventaire WHERE nopiece="+GetGadgetText(#PB_w32)+"", #PB_Database_DynamicCursor) 
        FirstDatabaseRow(#mysql)
       quuue1.q = GetDatabaseQuad(#mysql, 1)
       FinishDatabaseQuery(#mysql)
       EndIf
     If  DatabaseQuery(#mysql, "SELECT * FROM inventaire WHERE nopiece="+GetGadgetText(#PB_w32)+"", #PB_Database_DynamicCursor) 
        FirstDatabaseRow(#mysql)
       quuue4.s = GetDatabaseString(#mysql, 2)
       FinishDatabaseQuery(#mysql)
      EndIf
       
            quantiter_1.s = Str(1)
            querycase1.s = "INSERT INTO invwo (quant, nopic, descp, wo) VALUES ('"+quantiter_1+"', '"+Str(quuue1)+"', '"+quuue4+"', '"+GetGadgetText(#_WO1202)+"')"
            
            
        If DatabaseUpdate(#mysql, querycase1)
    
    Debug "piece successfully inserted."
aWOordertHandler()
  Else
    
    Debug "error inserting data! " + DatabaseError()
   
  EndIf
   FinishDatabaseQuery(#mysql)
  ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
 If  DatabaseQuery(#mysql, "SELECT * FROM inventaire WHERE nopiece="+GetGadgetText(#PB_w32)+"", #PB_Database_DynamicCursor) 
   FirstDatabaseRow(#mysql)
   
   quantcase1_2_2.i = GetDatabaseLong(#mysql, 3)
   FinishDatabaseQuery(#mysql)
   
   test.i = 1
   qunatcase1.i = quantcase1_2_2-test
  
   querycase1_2.s = "UPDATE inventaire SET quantiter='"+qunatcase1+"' WHERE nopiece='"+GetGadgetText(#PB_w32)+"'"
   EndIf
      ; update the database With the literal prepared query And confirm the write
            
   If  DatabaseUpdate(#mysql, querycase1_2)
     Debug "piece successfully updated."
     Debug qunatcase1
     aWOordertHandler()
   Else
    
     Debug "error  updating data! " + DatabaseError()
    
   EndIf
   FinishDatabaseQuery(#mysql)               
            
 

   
   Case #PB_w31 :
     
      querydelinvwo2.s = "DELETE FROM invwo WHERE (nopic, wo) = ('"+GetGadgetText(#PB_w26)+"', '"+GetGadgetText(#_WO1202)+"')"
  
                         DatabaseUpdate(#mysql, querydelinvwo2) 
                           FinishDatabaseQuery(#mysql)
                           aWOordertHandler()
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 431
; FirstLine = 352
; EnableXP
; DPIAware