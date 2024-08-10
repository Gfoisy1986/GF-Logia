Case #_WO1202 :
  
  
   OpenGadgetList(10, 2)
      PanelGadget     (1111, 0, 20, 650, 480)
      AddGadgetItem (1111, -1, "Vehicule leger")
      AddGadgetItem (1111, -1, "Vehicule moyen")
      AddGadgetItem (1111, -1, "Vehicule lourd")
      AddGadgetItem (1111, -1, "S.A.A.Q")
      CloseGadgetList()
  
  
  
  OpenGadgetList(10, 3)
TextGadget(3002, 0, 0, 150, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(3002, #PB_Gadget_BackColor, $A7E3EF)
       
     If ListViewGadget(3003, 0, 20, 150, 120)
       SetGadgetColor(3003, #PB_Gadget_BackColor, $F3C8F3)  
       DatabaseQuery(#mysql, "SELECT * FROM job WHERE (wo, pstatus) = ('"+GetGadgetText(#_WO1202)+"', '0')", #PB_Database_DynamicCursor)
     
     
      
           While  NextDatabaseRow(#mysql) 
                JOB1.s = GetDatabaseString(#mysql, 2)
               
               AddGadgetItem(3003, -1, ""+JOB1)
                 Wend  
                 FinishDatabaseQuery(#mysql)
                
                 ButtonGadget(3004, 0, 140, 150, 30, "Nouveau travaux")
                 
  CloseGadgetList()
  OpenGadgetList(10, 1)
  
                 TextGadget(3005, 0, 0, 150, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
                 SetGadgetColor(3005, #PB_Gadget_BackColor, $A7E3EF)
       
               EndIf
               
             
               
                If  ListViewGadget(3006, 0, 20, 150, 80)
       SetGadgetColor(3006, #PB_Gadget_BackColor, $F3C8F3) 
       DatabaseQuery (#mysql, "SELECT * FROM note WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(3006, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend       
                 FinishDatabaseQuery(#mysql)
                 EndIf
       ButtonGadget(3007, 0, 110, 150, 20, "Sauvegarder note")
       ButtonGadget(3008, 0, 140, 150, 20, "Supprimer note")
       ButtonGadget(3009, 0, 170, 150, 20,"Nouvelle note")
       
       
       TextGadget(#_wo12, 150, 0, 500, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 150, 20, 500, 170)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
       
       CloseGadgetList()
       
       OpenGadgetList(10, 0)
       
       ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
        TextGadget(#PB_wo5, 0, 0, 150, 20, "bon travail", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo5, #PB_Gadget_BackColor, $A7E3EF)
       TextGadget(6052, 0, 20, 150, 20, GetGadgetText(#_WO1202), #PB_Text_Border | #PB_Text_Center)
      ; SetGadgetColor(6052, #PB_Gadget_BackColor, $F3C8F3)
            
       
       
   
        TextGadget(6050, 150, 0, 150, 20, "# série", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(6050, #PB_Gadget_BackColor, $A7E3EF)
      DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo='"+GetGadgetText(#_WO1202)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6054, 150, 20, 150, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6054, #PB_Gadget_BackColor, $F3C8F3)   
             FinishDatabaseQuery(#mysql)
       
       
       
       
          
        TextGadget(2020, 300, 0, 150, 20, "Année", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(2020, #PB_Gadget_BackColor, $A7E3EF)
        DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6055, 300, 20, 150, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(2500, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
         
         ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
         TextGadget(2120, 450, 0, 150, 20, "Unitée", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(2120, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
      TextGadget(#PB_ll1, 450, 20, 150, 20, GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(#PB_ll1, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
             
              TextGadget(#PB_wo9, 0, 40, 150, 20, "Make", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo9, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
      TextGadget(6056, 0, 60, 150, 20, GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6056, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
         
         
          TextGadget(#PB_w10, 150, 40, 150, 20, "Model", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w10, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
       TextGadget(6057, 150, 60, 150, 20, GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6057, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql) 
           
           
           
           TextGadget(#PB_w11, 300, 40, 150, 20, "KM", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w11, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql) 
       TextGadget(6058, 300, 60, 150, 20, GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6058, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(1220, 450, 40, 150, 20, "HRS", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(1220, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql) 
      TextGadget(6059, 450, 60, 150, 20, GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6059, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
         TextGadget(1320, 0, 80, 150, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(1320, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6060, 0, 100, 150, 20, GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6060, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
            TextGadget(#PB_w14, 150, 80, 150, 20, "Prochaine maintenance", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w14, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6061, 150, 100, 150, 20, GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6061, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w15, 300, 80, 150, 20, "Prochaine Insp.", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w15, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6062, 300, 100, 150, 20, GetDatabaseString(#mysql, 11), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6062, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w16, 450, 80, 150, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w16, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql)  
      TextGadget(6063, 450, 100, 150, 20, GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6063, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
            TextGadget(#PB_w17, 0, 120, 150, 20, "Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w17, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
      FirstDatabaseRow(#mysql)  
       TextGadget(6064, 0, 140, 150, 20, GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6064, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w18, 150, 120, 150, 20, "Liscence", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w18, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
        FirstDatabaseRow(#mysql) 
       TextGadget(6065, 150, 140, 150, 20, GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6065, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w19, 300, 120, 300, 20, "Noms entreprise", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w19, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'", #PB_Database_DynamicCursor)
       FirstDatabaseRow(#mysql)  
       TextGadget(6066, 300, 140, 300, 20, GetDatabaseString(#mysql, 13), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6066, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           ;///////////////////////////////////////////////////////////////////////////////////////////////////////////
           
           
           TextGadget(6067, 0, 160, 600, 20, "Modification table Bon de travail", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6067, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#PB_w20, 0, 180, 100, 30, "KM")
          ButtonGadget(#PB_w21, 100, 180, 100, 30, "HRS")
          ButtonGadget(#PB_w22, 200, 180, 100, 30, "Date")
          ButtonGadget(#PB_w23, 300, 180, 150, 30, "Prochaine maintenance")
          ButtonGadget(#PB_w24, 450, 180, 150, 30, "Prochaine Inspection")
          
         
          CloseGadgetList()
          ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          OpenGadgetList(10, 4)
          
          
          
          
               TextGadget(6068, 0, 20, 250, 20, "Feuillet inv. WO",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6068, #PB_Gadget_BackColor, $A7E3EF)
      
       TextGadget(6070, 270, 20, 250, 20, "Stock Inventaire",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6070, #PB_Gadget_BackColor, $A7E3EF)
           
             
               
           If      ListIconGadget(#PB_w26, 0, 40, 250, 150, "# pièce", 100, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w26, #PB_Gadget_BackColor, $00FFFF)
                 
                 AddGadgetColumn(#PB_w26, 1, "Quantité", 50)
             AddGadgetColumn(#PB_w26, 2, "Description", 100)
           
          DatabaseQuery (#mysql, "SELECT * FROM invwo WHERE wo='"+GetGadgetText(6052)+"' ORDER BY descp ASC", #PB_Database_DynamicCursor)
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w26, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 3))
              Wend  
                FinishDatabaseQuery(#mysql)
              EndIf
              
              
               TextGadget(3223, 0, 190, 250, 20, "#facture WO",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(3223, #PB_Gadget_BackColor, $A7E3EF)
               If      ListIconGadget(3220, 0, 210, 250, 110, "#Facture", 100, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(3220, #PB_Gadget_BackColor, $00FFFF)
                 
                 AddGadgetColumn(3220, 1, "$Montant", 50)
             AddGadgetColumn(3220, 2, "Description", 100)
           
          DatabaseQuery (#mysql, "SELECT * FROM invwo WHERE wo='"+GetGadgetText(6052)+"' ORDER BY descp ASC", #PB_Database_DynamicCursor)
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(3220, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 3))
              Wend  
                FinishDatabaseQuery(#mysql)
              EndIf
              
                TextGadget(#PB_Any, 250, 100, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                TextGadget(#PB_Any, 250, 140, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                TextGadget(#PB_Any, 250, 180, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
TextGadget(#PB_Any, 250, 220, 20, 20, "<",  #PB_Text_Border | #PB_Text_Center)
                            If  ListIconGadget(#PB_w32, 270, 40, 250, 280, "# Pièce", 100, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w32, #PB_Gadget_BackColor, $00FFFF)
                 
                 AddGadgetColumn(#PB_w32, 1, "Quantité", 50)
             AddGadgetColumn(#PB_w32, 2, "Description", 100)
            
           DatabaseQuery (#mysql, "SELECT * FROM inventaire ORDER BY description ASC")
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w32, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 2))
              Wend  
                FinishDatabaseQuery(#mysql)
               EndIf 
           TextGadget(6069, 0, 320, 650, 20, "Modification table inventaire des pièces", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6069, #PB_Gadget_BackColor, $A7E3EF)
 
 
         
          
  ButtonGadget(#PB_w27, 0, 340, 100, 30, "Quantitée")
          ButtonGadget(#PB_w28, 110, 340, 100, 30, "# Pièces")
          ButtonGadget(2002, 220, 340, 100, 30, "Desc.")
          ButtonGadget(#PB_w30, 0, 380, 100, 30, "Ajouter une pièce")
          ButtonGadget(2010, 110, 380, 100, 30, "Ajouter une facture")
          ButtonGadget(#PB_w31, 220, 380, 100, 30, "Suprrimer une pièce")
          
          
          CloseGadgetList()
          
          
          Case  3003 : ;joblist
             OpenGadgetList(10, 3)
    
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, wo) = ('"+GetGadgetText(3003)+"', '"+GetGadgetText(#_WO1202)+"')")
      
     
     TextGadget(1204, 150, 0, 500, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     SetGadgetColor(1204, #PB_Gadget_BackColor, $A7E3EF)
    ListViewGadget(1206, 150, 20, 500, 65)
   SetGadgetColor(1206, #PB_Gadget_BackColor, $9280EE)
        
  While NextDatabaseRow(#mysql)
  
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
   
   Wend
     FinishDatabaseQuery(#mysql)
     EndIf
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, pstatus) = ('"+GetGadgetText(3003)+"', '1')")
      
      
 ListViewGadget(1207, 150, 85, 500, 85)
     ; EditorGadget(1207, 200, 405, 320, 85) 
      SetGadgetColor(1207, #PB_Gadget_BackColor, $F3D2A8)
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, ""+GetDatabaseString(#mysql, 1)+" : " + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   EndIf
   
punch()
    
   CloseGadgetList()
   
   
   Case 3004 : ;newjobbuttonhandler
   
   OpenGadgetList(10, 3)
   
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
          
          ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
   Case 3009 :  ;new note         ;a modifier #serie identifier
    OpenGadgetList(10, 1)
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
If  ListViewGadget(3006, 0, 20, 150, 85)
              DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(#_WO1202)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(3006, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
              FinishDatabaseQuery(#mySql)
            EndIf
           

     
      
     
            CloseGadgetList()
            
  
   Case 3006 : ;open note
            OpenGadgetList(10, 1)
           
       If     DatabaseQuery (#mysql, "SELECT * FROM note WHERE notename='"+GetGadgetText(3006)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
       TextGadget(#_wo12, 150, 0, 500, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 150, 20, 500, 170)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
     While  NextDatabaseRow(#mysql) 
         AddGadgetItem(#_wo13, -1, GetDatabaseString(#mysql, 3))
         Wend
         FinishDatabaseQuery(#mysql)
         EndIf
         CloseGadgetList()
  
         
         
       Case 3008 : ;supp note
         
          Query.s = "DELETE FROM note WHERE notename = '"+GetGadgetText(3006)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimé!", "Note supprimé!",  #PB_MessageRequester_Info)
  

 If ListViewGadget(3006, 0, 20, 150, 85)
             DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(3006, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   FinishDatabaseQuery(#mysql)
             
 EndIf
 
 
 
 
 
         
   ;ButtonGadget(#_402, 530, 620, 740, 40, "Fermer WO >> Facturation !")
                
             
       
       ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
       ;punch()
      
; IDE Options = PureBasic 5.73 LTS (Windows - x86)
; CursorPosition = 232
; FirstLine = 220
; EnableXP