Case #_WO1202 :
OpenGadgetList(0, 4)
TextGadget(3002, 0, 320, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(3002, #PB_Gadget_BackColor, $A7E3EF)
       
     If ListViewGadget(#_w4, 0, 340, 200, 120)
       SetGadgetColor(#_w4, #PB_Gadget_BackColor, $F3C8F3)  
       DatabaseQuery(#mysql, "SELECT * FROM job WHERE (wo, pstatus) = ('"+GetGadgetText(#_WO1202)+"', '0')", #PB_Database_DynamicCursor)
     
     
      
           While  NextDatabaseRow(#mysql) 
                JOB1.s = GetDatabaseString(#mysql, 2)
               
               AddGadgetItem(#_w4, -1, ""+JOB1)
                 Wend  
                 FinishDatabaseQuery(#mysql)
                
                 ButtonGadget(3003, 0, 460, 200, 30, "Nouveau travaux")

                 TextGadget(#_wo5, 0, 500, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
                 SetGadgetColor(#_wo5, #PB_Gadget_BackColor, $A7E3EF)
       
               EndIf
               
               
               
                If  ListViewGadget(#_wo6, 0, 520, 200, 80)
       SetGadgetColor(#_wo6, #PB_Gadget_BackColor, $F3C8F3) 
       DatabaseQuery (#mysql, "SELECT * FROM note WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_wo6, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend       
                 FinishDatabaseQuery(#mysql)
                 EndIf
       ButtonGadget(#_wo7, 0, 600, 200, 20, "Sauvegarder note")
       ButtonGadget(#_wo8, 0, 620, 200, 20, "Supprimer note")
       ButtonGadget(#_wo9, 0, 640, 200, 20,"Nouvelle note")
       
       
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
       
       ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        TextGadget(#PB_wo5, 530, 0, 185, 20, "bon travail", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo5, #PB_Gadget_BackColor, $A7E3EF)
       TextGadget(6052, 530, 20, 185, 20, GetGadgetText(#_WO1202), #PB_Text_Border | #PB_Text_Center)
      ; SetGadgetColor(6052, #PB_Gadget_BackColor, $F3C8F3)
            
       
       
   
        TextGadget(6050, 715, 0, 185, 20, "# série", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(6050, #PB_Gadget_BackColor, $A7E3EF)
      DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo='"+GetGadgetText(#_WO1202)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6054, 715, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6054, #PB_Gadget_BackColor, $F3C8F3)   
             FinishDatabaseQuery(#mysql)
       
       
       
       
          
        TextGadget(2020, 900, 0, 185, 20, "Année", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(2020, #PB_Gadget_BackColor, $A7E3EF)
        DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6055, 900, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(2500, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
         
         ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
         TextGadget(2120, 1085, 0, 185, 20, "Unitée", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(2120, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
      TextGadget(#PB_ll1, 1085, 20, 185, 20, GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(#PB_ll1, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
             
              TextGadget(#PB_wo9, 530, 40, 185, 20, "Make", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo9, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
      TextGadget(6056, 530, 60, 185, 20, GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6056, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
         
         
          TextGadget(#PB_w10, 715, 40, 185, 20, "Model", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w10, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
       TextGadget(6057, 715, 60, 185, 20, GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6057, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql) 
           
           
           
           TextGadget(#PB_w11, 900, 40, 185, 20, "KM", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w11, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6058, 900, 60, 185, 20, GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6058, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(1220, 1085, 40, 185, 20, "HRS", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(1220, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql) 
      TextGadget(6059, 1085, 60, 185, 20, GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6059, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
         TextGadget(1320, 530, 80, 185, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(1320, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6060, 530, 100, 185, 20, GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6060, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
            TextGadget(#PB_w14, 715, 80, 185, 20, "Prochaine maintenance", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w14, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6061, 715, 100, 185, 20, GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6061, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w15, 900, 80, 185, 20, "Prochaine Insp.", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w15, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6062, 900, 100, 185, 20, GetDatabaseString(#mysql, 11), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6062, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w16, 1085, 80, 185, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w16, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6063, 1085, 100, 185, 20, GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6063, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
            TextGadget(#PB_w17, 530, 120, 185, 20, "Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w17, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
      FirstDatabaseRow(#mysql)  
       TextGadget(6064, 530, 140, 185, 20, GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6064, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w18, 715, 120, 185, 20, "Liscence", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w18, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql) 
       TextGadget(6065, 715, 140, 185, 20, GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6065, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w19, 900, 120, 370, 20, "Noms entreprise", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w19, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
       TextGadget(6066, 900, 140, 370, 20, GetDatabaseString(#mysql, 13), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6066, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           ;///////////////////////////////////////////////////////////////////////////////////////////////////////////
           
           
           TextGadget(6067, 530, 160, 750, 20, "Modification table Bon de travail", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6067, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#PB_w20, 530, 180, 100, 30, "KM")
          ButtonGadget(#PB_w21, 630, 180, 100, 30, "HRS")
          ButtonGadget(#PB_w22, 730, 180, 100, 30, "Date")
          ButtonGadget(#PB_w23, 830, 180, 200, 30, "Prochaine maintenance")
          ButtonGadget(#PB_w24, 1030, 180, 240, 30, "Prochaine Insp. P.E.P/S.A.A.Q")
          
         
          
          ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          
          
          
               TextGadget(6068, 530, 220, 350, 20, "Feuillet inv. WO",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6068, #PB_Gadget_BackColor, $A7E3EF)
      
       TextGadget(6070, 900, 220, 370, 20, "Stock Inventaire",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6070, #PB_Gadget_BackColor, $A7E3EF)
           
             
               
           If      ListIconGadget(#PB_w26, 530, 240, 350, 280, "# pièce", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w26, #PB_Gadget_BackColor, $00FFFF)
                 
                 AddGadgetColumn(#PB_w26, 1, "Quantité", 60)
             AddGadgetColumn(#PB_w26, 2, "Description", 200)
            
          DatabaseQuery (#mysql, "SELECT * FROM invwo WHERE wo='"+GetGadgetText(6052)+"' ORDER BY descp ASC", #PB_Database_DynamicCursor)
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w26, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 3))
              Wend  
                FinishDatabaseQuery(#mysql)
                EndIf
                TextGadget(#PB_Any, 880, 420, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                TextGadget(#PB_Any, 880, 360, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                TextGadget(#PB_Any, 880, 380, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
TextGadget(#PB_Any, 880, 400, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                            If  ListIconGadget(#PB_w32, 900, 240, 370, 280, "# Pièce", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w32, #PB_Gadget_BackColor, $00FFFF)
                 
                 AddGadgetColumn(#PB_w32, 1, "Quantité", 60)
             AddGadgetColumn(#PB_w32, 2, "Description", 190)
            
           DatabaseQuery (#mysql, "SELECT * FROM inventaire ORDER BY description ASC")
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w32, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 2))
              Wend  
                FinishDatabaseQuery(#mysql)
               EndIf 
           TextGadget(6069, 530, 520, 750, 20, "Modification table inventaire des pièces", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6069, #PB_Gadget_BackColor, $A7E3EF)
 
 
         
          
  ButtonGadget(#PB_w27, 530, 540, 100, 30, "Quantitée")
          ButtonGadget(#PB_w28, 630, 540, 100, 30, "# Pièces")
          ButtonGadget(2002, 730, 540, 100, 30, "Desc.")
          ButtonGadget(#PB_w30, 920, 540, 300, 30, "Ajouter une pièce")
          ButtonGadget(#PB_w31, 530, 570, 300, 30, "Suprrimer une pièce")
          
          
          
          
          ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   ButtonGadget(#_402, 530, 620, 740, 40, "Fermer WO >> Facturation !")
                
             
       
       ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
       punch()
       CloseGadgetList()
       
       Case #_wo6 : ;open note
            OpenGadgetList(0, 4)
           
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
         
         
         
         
 Case 3003 : ;newjobbuttonhandler
   
   OpenGadgetList(0, 4)
   
 Text200$ = InputRequester("nouvelle job", "Veuillez entrer le nom de la nouvelle job", "")
          Text201$ = InputRequester("Info job", "Veuillez entrer les information sur les travaux", "")
        
   
 If    DatabaseQuery (#mysql, "SELECT * FROM job")
   query67.s = "INSERT INTO job (jobname, jobinfo, wo, pstatus) VALUES ('"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(#_WO1202)+"', '0')"
    
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(#mysql, query67)
    
    Debug "data successfully inserted."

 
    FinishDatabaseQuery(#mysql)
  EndIf
 ; aWOordertHandler()
  CloseGadgetList()
  
  Case  #_w4 : ;joblist
             OpenGadgetList(0, 4)
    
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, wo) = ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_WO1202)+"')")
      
     
     TextGadget(1204, 200, 320, 320, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     SetGadgetColor(1204, #PB_Gadget_BackColor, $A7E3EF)
    ListViewGadget(1206, 200, 340, 320, 65)
   SetGadgetColor(1206, #PB_Gadget_BackColor, $9280EE)
        
  While NextDatabaseRow(#mysql)
  
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
   
   Wend
     FinishDatabaseQuery(#mysql)
     EndIf
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, pstatus) = ('"+GetGadgetText(#_w4)+"', '1')")
      
      
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
   
   
   
   
   Case #_wo9 :  ;new note         ;a modifier #serie identifier
    OpenGadgetList(0, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
    
   If  DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(#_WO1202)+"'")
   query.s = "INSERT INTO note (notename, wo, content, serie) " + "VALUES ('"+Text100$+"', '"+GetGadgetText(4500)+"', '', '"+GetGadgetText(4500)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(#mysql, query)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
If  ListViewGadget(#_1203, 225, 320, 200, 150)
              DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(#_WO1202)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
              FinishDatabaseQuery(#mySql)
            EndIf
           

     
      
     
            CloseGadgetList()
            
            
            
              Case #_2002 :;punchout
          
         
         
          OpenGadgetList(0, 4)
       
   
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
    query12_1.s = "INSERT INTO job (jobname, jobinfo, jobrepport, wo, pstatus) VALUES ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(1206)+"', '"+query3$+"', '"+GetGadgetText(#_WO1202)+"', '1')"
    
   
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
          
        OpenGadgetList(0, 4)

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
     
   query11.s = "INSERT INTO punch (wo, jobname, punchin, pstatus) VALUES ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_w4)+"', '"+time+"', '1')"
          
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
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; CursorPosition = 298
; EnableXP
; DPIAware