    
UseSQLiteDatabase()


Enumeration
      #PageWO
      
     
      
      
      #job
      
      #mysql = 0
      #close
      #File
     #_1
      #WO
    #_1208
    #_221
#_1203
      #jobsave
     
      #frame1
    
      #punchout
     

EndEnumeration

  
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    Debug "Connecté à Mech-Logia.sqlite"
   EndIf
 
Icone$ = "icon.ico"


  

Procedure Administration()
  
 
       
       
       
  TextGadget(860, 220, 0, 200, 20, "Menu Client", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(853, 220, 20, 200, 20, "add client")
 ; ButtonGadget(854, 220, 40, 200, 20, "mod client")
  ButtonGadget(855, 220, 70, 200, 20, "del client")
  
  
  
  TextGadget(861, 440, 0, 200, 20, "Menu Vehicule par client", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(856, 440, 20, 200, 20, "add vehicule")
 ; ButtonGadget(857, 440, 40, 200, 20, "mod vehicule")
  ButtonGadget(858, 440, 70, 200, 20, "del vehicule")
  
  
  
  TextGadget(863, 660, 0, 200, 20, "Menu Bon de travail par vehicule", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(864, 660, 20, 200, 20, "add Bon de travail")
  ButtonGadget(865, 660, 40, 200, 20, "archivé Bon de travail")
  ButtonGadget(866, 660, 70, 200, 20, "del Bon de travail")
  
  
  
  TextGadget(867, 880, 0, 300, 20, "Menu historique Bon de travail par vehicule", #PB_Text_Border | #PB_Text_Center)
  
  
  ButtonGadget(870, 880, 70, 300, 20, "del H-Bon de travail")
EndProcedure




Procedure employer()
  
  TextGadget(859, 0, 0, 200, 20, "Menu employer", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(850, 0, 25, 200, 20, "add employer")
 
  ButtonGadget(852, 0, 50, 200, 20, "del employer")
   TextGadget(862, 0, 80, 200, 20, " Liste employer", #PB_Text_Border | #PB_Text_Center)
        ListViewGadget(1200, 0, 100, 200, 300) 
        If DatabaseQuery (0, "SELECT * FROM User")
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(1200, -1, "" + GetDatabaseString(#mySql, 1))
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
       
        
       
EndProcedure




  Procedure QuitHandler()
    
    End
  EndProcedure
  
  
  Procedure deletenote()
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM Note WHERE Notename = '"+GetGadgetText(#_1203)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimé!", "Note supprimé!",  #PB_MessageRequester_Info)
  
EndIf
ListViewGadget(#_1203, 225, 320, 200, 150)
             If DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
             
            EndIf
    EndProcedure
  
  

  



  

  
  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Procedure savenotebuttonHandler()
      Debug "editor window saved"
    
    
    
    
   
     
             ;  query11.s = "UPDATE punch SET punchout=('"+time+"') WHERE (WO, USER, nomtravaux)=('"+GetGadgetText(100)+"', '"+GetGadgetText(1200)+"', '"+GetGadgetText(#_1208)+"')"
    query4.s = "UPDATE Note SET Content=('"+GetGadgetText(117)+"') WHERE (Notename)=('"+GetGadgetText(#_1203)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(0, query4)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note "+GetGadgetText(#_1203)+" Sauvegardée", "Note "+GetGadgetText(#_1203)+" Sauvegardée",  #PB_MessageRequester_Info)
  
EndProcedure

  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
     OpenGadgetList(1, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
     DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
   query.s = "INSERT INTO Note (Notename, Wo, Content, serie) " + "VALUES ('"+Text100$+"', '"+GetGadgetText(100)+"', '', '"+GetGadgetText(100)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(0, query)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
  ListViewGadget(#_1203, 225, 320, 200, 150)
             If DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
             
            EndIf
            TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
                     FinishDatabaseQuery(#mySql)
                 success = #True

     
      
     
      CloseGadgetList()
      
     ; BindGadgetEvent(#_221, @savenotebuttonHandler())
       BindGadgetEvent(220, @newnotebuttonHandler())
             ; BindGadgetEvent(#_1203, @opennoteHandler(), #PB_EventType_LeftClick)
 EndProcedure
 
 
 
 Procedure newjobentry()
   
   
 OpenGadgetList(1, 4)
 Text200$ = InputRequester("nouvelle job", "Veuillez entrer le nom de la nouvelle job", "")
          Text201$ = InputRequester("Info job", "Veuillez entrer les information sur les travaux", "")
          
          
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
     DatabaseQuery (0, "SELECT * FROM Job")
   query.s = "INSERT INTO Job (Jobname, jobinfo, WO)" + "VALUES ('"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(100)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(0, query)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf

ListViewGadget(#_1208, 225, 510, 200, 170)
            If DatabaseQuery (0, "SELECT * FROM Job WHERE WO='"+GetGadgetText(100)+"'")
            While NextDatabaseRow(#mySql) 
               
              IDJOB$ = GetDatabaseString(#mySql, 1)
              AddGadgetItem(#_1208, -1, "" + IDJOB$)
               
                  
                   
             Wend 
             
   
             
           EndIf
           CloseGadgetList()
 EndProcedure
          
 
 
 Procedure deljobentry()
    OpenGadgetList(1, 4)
   
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM Job WHERE Jobname = '"+GetGadgetText(#_1208)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("job supprimé!", "job supprimé!",  #PB_MessageRequester_Info)
 
 ListViewGadget(#_1208, 225, 510, 200, 170)
             If DatabaseQuery (0, "SELECT * FROM Job WHERE WO='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               IDJOB$ = GetDatabaseString(#mySql, 1)
               AddGadgetItem(#_1208, -1, "" + IDJOB$)
               
                  
                   
              Wend 
             
   
             
            EndIf
            
 
          EndIf
          CloseGadgetList()
          
 EndProcedure 
 
 
 Procedure savejobentry()
   
   
   
    OpenGadgetList(1, 4)
          result10 = GetGadgetState(#_1208)
          
    If result10 = 0
    Debug "editor window saved"
      OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   
     
               
       query3.s = "UPDATE Job SET jobinfo='"+GetGadgetText(1206)+"' WHERE Jobname='"+GetGadgetText(#_1208)+"'"
       query2.s = "UPDATE Job SET jobrepport='"+GetGadgetText(1207)+"' WHERE Jobname='"+GetGadgetText(#_1208)+"'"
  
  ; update the database with the literal prepared query and confirm the write
       DatabaseUpdate(0, query3)
       DatabaseUpdate(0, query2)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("job "+GetGadgetText(1205)+" Sauvegardée", "job "+GetGadgetText(1205)+" Sauvegardée",  #PB_MessageRequester_Info)
 CloseGadgetList()

ElseIf result10 = -1 
  
  
  Debug "Cant save job no job selected !"
         
       
    
           
  EndIf 

    
 EndProcedure
 
 
 

Procedure closewindowHandler()
    Debug "End program WO"
    
      End
    EndProcedure
    
    
  
   
    Procedure listuser()
      
      
 OpenGadgetList(1, 4)
  

 
 
  ButtonGadget(950, 0, 140, 215, 20," Liste Employer")
   ListViewGadget(1200, 0, 160, 215, 100) 
    
  If DatabaseQuery (0, "SELECT * FROM User")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(1200, -1, "" + GetDatabaseString(#mysql, 1))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True

  EndIf
  
  
  TextGadget(224, 225, 300, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
      
      
       ListViewGadget(#_1203, 225, 320, 200, 150)
            If  DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_1203, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend 
             
   EndIf
             
            
   TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
    EditorGadget(117, 425, 220, 600, 250)
                     FinishDatabaseQuery(#mysql)
                 success = #True
               
             
           
     
     CloseGadgetList()
    
     
       BindGadgetEvent(#_221, @savenotebuttonHandler(), #PB_EventType_LeftClick)
       BindGadgetEvent(223, @deletenote(), #PB_EventType_LeftClick)
       BindGadgetEvent(220, @newnotebuttonHandler(), #PB_EventType_LeftClick)
             
  
      
    
     
      
     
    EndProcedure
    
  
    Procedure punch()
      OpenGadgetList(1, 4)
      
 
 
  ButtonGadget(951, 0, 320, 215, 20," Liste des Punch par WO")
   ListViewGadget(1212, 0, 340, 215, 100) 
    
  If DatabaseQuery (0, "SELECT * FROM punch WHERE WO='"+GetGadgetText(100)+"'")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(1212, -1, "" + GetDatabaseString(#mysql, 0) + " - " + GetDatabaseString(#mysql, 2) + "   " + GetDatabaseString(#mysql, 5))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True

  EndIf
  
  
                 
                ;    BindGadgetEvent(1210, @newjobentry(), #PB_EventType_LeftClick)
      ; BindGadgetEvent(1209, @deljobentry(), #PB_EventType_LeftClick)
      ; BindGadgetEvent(#jobsave, @savejobentry(), #PB_EventType_LeftClick)
    EndProcedure
    
  
  
    Procedure work()
      OpenGadgetList(1, 4)
               ButtonGadget(1210, 0, 565, 215, 30, "Nouvelle Job")
     ButtonGadget(#jobsave, 0, 595, 215, 30, "Sauvegarder Job")
     
     ButtonGadget(1209, 0, 635, 215, 30, "Supprimer Job")
     
     ButtonGadget(1211, 0, 445, 215, 25, "punch-in")
     ButtonGadget(#punchout, 0, 475, 215, 25, "punch-out")
     
     
     TextGadget(1205, 225, 490, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
      ListViewGadget(#_1208, 225, 510, 200, 170)
             If DatabaseQuery (0, "SELECT * FROM Job WHERE WO='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mysql) 
               
               IDJOB$ = GetDatabaseString(#mysql, 1)
               AddGadgetItem(#_1208, -1, ""+IDJOB$)
               
                  
                   
              Wend 
              EndIf
    FinishDatabaseQuery(#mysql)
    success = #True
    
    ;punch()
    CloseGadgetList()
    
              BindGadgetEvent(1210, @newjobentry(), #PB_EventType_LeftClick)
       BindGadgetEvent(1209, @deljobentry(), #PB_EventType_LeftClick)
       BindGadgetEvent(#jobsave, @savejobentry(), #PB_EventType_LeftClick)
                 
      EndProcedure
   


  
  

  
Procedure mainwo()
  OpenGadgetList(1, 4)
  ButtonGadget(402, 0, 0, 215, 40," Liste Bon de travail")
  
   ListViewGadget(1202, 0, 40, 215, 100) 
    
   DatabaseQuery (0, "SELECT * FROM Workorder")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(1202, -1, "WO No: " + GetDatabaseString(#mysql, 0))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True
  
  
   
  
 
  
 
 CloseGadgetList()

  
EndProcedure


  Procedure aWOordertHandler()
    ;//////////////////////<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
   OpenGadgetList(1, 4)


 
 

 
 
  
 
    

      


    
      ;DatabaseQuery (0, "SELECT * FROM Workorder")
   ; For i = 0 To 65000
      ;AddGadgetItem(#list, i, "Ancien élément "+Str(i))
     ; SetGadgetItemData(#list, i, i)
     ;Next i

      Debug ("Ouverture du work order " + GetGadgetText(1202))
       
  
         

  
      
    
      
                                
      
      
      TextGadget(200, 225 , 0, 200, 20, "Bon de Travail #", #PB_Text_Border | #PB_Text_Center)
      TextGadget(100, 225   , 20, 200, 30, "" + GetGadgetText(1202), #PB_Text_Border | #PB_Text_Center)
      
       TextGadget(201, 425 , 0, 200, 20, "# Série (VIN)", #PB_Text_Border | #PB_Text_Center)
      StringGadget(101, 425 , 20, 200, 30, "")
      
      TextGadget(202, 625 , 0, 200, 20, "Année", #PB_Text_Border | #PB_Text_Center)
      StringGadget(102, 625 , 20, 200, 30, "")
      
      TextGadget(203, 825 , 0, 200, 20, "Model", #PB_Text_Border | #PB_Text_Center)
      StringGadget(103, 825 , 20, 200, 30, "")
      
      TextGadget(204, 225 , 50, 200, 20, "# Unité", #PB_Text_Border | #PB_Text_Center)
      StringGadget(104, 225   , 70, 200, 30, "")
      
      TextGadget(205, 425 , 50, 200, 20, "Kilométrages", #PB_Text_Border | #PB_Text_Center)
      StringGadget(105, 425 , 70, 200, 30, "")
      
      TextGadget(206, 625 ,50, 200, 20, "Heures", #PB_Text_Border | #PB_Text_Center)
      StringGadget(106, 625 , 70, 200, 30, "")
      
      TextGadget(207, 825 , 50, 200, 20, "Date", #PB_Text_Border | #PB_Text_Center)
      StringGadget(107, 825 , 70, 200, 30, "")
      
      TextGadget(208, 225 , 100, 200, 20, "Prochaine Maintenance", #PB_Text_Border | #PB_Text_Center)
      StringGadget(108, 225   , 120, 200, 30, "")
      
      TextGadget(209, 425 , 100, 200, 20, "Date Prochaine INSP. SAAQ // P.E.P", #PB_Text_Border | #PB_Text_Center)
      StringGadget(109, 425 , 120, 200, 30, "")
      
      TextGadget(210, 625 , 100, 200, 20, "Date Fin Garantie", #PB_Text_Border | #PB_Text_Center)
      StringGadget(110, 625 , 120, 200, 30, "")
      
      TextGadget(211, 825 , 100, 200, 20, "Imatriculation", #PB_Text_Border | #PB_Text_Center)
      StringGadget(111, 825 , 120, 200, 30, "")
      
      TextGadget(212, 225 , 150, 200, 20, "Nom Propriétaire", #PB_Text_Border | #PB_Text_Center)
      StringGadget(112, 225   , 170, 200, 30, "")
      
      TextGadget(213, 425 , 150, 200, 20, "Addresse Propriétaire", #PB_Text_Border | #PB_Text_Center)
      StringGadget(113, 425 , 170, 200, 30, "")
      
      TextGadget(214, 625 , 150, 200, 20, "Addresse du Vehicule (Home)", #PB_Text_Border | #PB_Text_Center)
      StringGadget(114, 625 , 170, 200, 30, "")
      
      TextGadget(215, 825, 150, 200, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
      StringGadget(115, 825 , 170, 200, 30, "")
      
      TextGadget(218, 225, 200, 200, 20, "Menu de Notes", #PB_Text_Border | #PB_Text_Center)
      ButtonGadget(220, 225, 220, 200, 20,"Nouvelle note")
     
       ButtonGadget(#_221, 225, 245, 200, 20,"Sauvegardé")
      ButtonGadget(223, 225, 270, 200, 20,"Supprimé")
      
      FinishDatabaseQuery(#mysql)
                 success = #True

     
   
       ButtonGadget(#_1, 1050, 0, 800, 500, "M")      
           
     
     CloseGadgetList()
    
     
      ; BindGadgetEvent(#_221, @savenotebuttonHandler(), #PB_EventType_LeftClick)
       ;BindGadgetEvent(223, @deletenote(), #PB_EventType_LeftClick)
       ;BindGadgetEvent(220, @newnotebuttonHandler(), #PB_EventType_LeftClick)
             
  
      
     ;  BindGadgetEvent(1210, @newjobentry())
      ; BindGadgetEvent(1209, @deljobentry(), #PB_EventType_LeftClick)
      ; BindGadgetEvent(#jobsave, @savejobentry(), #PB_EventType_LeftClick)
     EndProcedure
     
     
  Procedure main()
    
 
   
#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1900, 1000, "Mech-Logia", #PB_Window_TitleBar |  #PB_Window_MinimizeGadget | #PB_Window_SystemMenu |  #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
   
    panel1 = PanelGadget(1, 0, 10, 1900, 980)
    
    ;///////////////////////////////////////////
    
    
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "Administration")
    Administration()
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Employées")
employer()
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Clients")
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Flottes")







   
  
  
  
  

  
  
CloseGadgetList()



OpenGadgetList(1)
AddGadgetItem(1, -1, "Bon de travail")
  mainwo()
CloseGadgetList()
    
   
  
 OpenGadgetList(1)
    AddGadgetItem(1, -1, "Historique -bon de travail")
     TextGadget(726, 100, 0, 100, 20, "heya")
                
  
    
    
    
    CloseGadgetList()
 
    
   OpenGadgetList(1)
AddGadgetItem(1, -1, "Calendar")
     ButtonGadget(659, 0, 0, 230, 20, "A Cross Window Test :P !")
     CloseGadgetList()
     
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "Calendrier des maintenances")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Les Stastistiques")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Facturation")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Carnet Comptabilité")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Catalogues des pieces")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Les liens et informations utiles")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
     OpenGadgetList(1)
    AddGadgetItem(1, -1, "Boite à outils")
     TextGadget(726, 100, 0, 100, 20, "heya")
    CloseGadgetList()
    
      ;/////////////////////////////////////////////////////////////////////////////////////////////////////////menu/////////////////////////menu///////////////////////////////////menu///////////////////////////////
   
    
      CreateMenu(0, WindowID(0))  ; la création du menu commence ici....
      MenuTitle("  Menu  ")
      MenuItem(1, "GuillaumeFoisy.ca")
     
    
      MenuBar()                 ; la barre de séparation sera insérée ici
      MenuBar()                 ; la barre de séparation sera insérée ici
      MenuBar()                 ; la barre de séparation sera insérée ici
      
        MenuItem(4, "Fermer")
        
      
        
      MenuTitle("  Support Technique  ")
      
     
      MenuItem(25, "Contact")
      MenuItem(26, "F.A.Q")
      
       MenuTitle(" $$ Donation $$ ")
      
      MenuItem(3, "$$ Donation $$")
     
      
      
      ;//////////////////////////////////////////
      ; WebGadget (100, 0, 0, 800, 600, "https://www.google.ca")
      ;//////////////////////////////////////////////
        ;BindMenuEvent(0, 1, @GfoisyHandler())
       ; BindMenuEvent(0, 2, @GitHandler())
       ; BindMenuEvent(0, 3, @DonateHandler())
        BindMenuEvent(0, 4, @QuitHandler())
       
       ; BindMenuEvent(0, 5, @GWOHandler())
      ;  BindMenuEvent(0, 8, @CGHNHandler())
       ; BindMenuEvent(0, 7, @CGWOHandler())
       ; BindMenuEvent(0, 9, @CGMHandler())
      ;  BindMenuEvent(0, 6, @HBTHandler())
       ; BindMenuEvent(0, 10, @IGPHandler())
      ;  BindMenuEvent(0, 11, @IGEHandler())
       ; BindMenuEvent(0, 12, @IGCHandler())
       ; BindMenuEvent(0, 13, @IGFHandler())
       ; BindMenuEvent(0, 14, @DGFHandler())
       ; BindMenuEvent(0, 15, @IGHandler())
       ; BindMenuEvent(0, 16, @EXFHandler())
        
       ; BindMenuEvent(0, 18, @BOSMHandler())
       ; BindMenuEvent(0, 17, @BOCOMPTAHandler())
       ; BindMenuEvent(0, 19, @BOCALCUHandler())
      ;  BindMenuEvent(0, 20, @BOCONVHandler())
       ; BindMenuEvent(0, 21, @BOEDITHandler())
       ; BindMenuEvent(0, 22, @BOGRIHandler())
       ; BindMenuEvent(0, 23, @BOTODOHandler())
       ; BindMenuEvent(0, 24, @BOCARNHandler())
       ; BindMenuEvent(0, 25, @CONTACTHandler())
       ; BindMenuEvent(0, 26, @FAQHandler())
       ; BindMenuEvent(0, 28, @NIHandler())
       ; BindMenuEvent(0, 29, @CFHandler())
      ;  BindMenuEvent(0, 30, @DLHandler())
       ; BindMenuEvent(0, 31, @freecadHandler())
        
        
        ;//////////////////////////////////////////////////////////////////////MEnu///////////////////////Menu////////////////////////////////Menu//////////////////////////////////
        
      
        
        
        
      
      EndIf
    EndProcedure
    main()
   ; Repeat : Until WaitWindowEvent()=#PB_Event_CloseWindow

      
      
 
        
    
    
    
    ;- Event Loop
  Repeat
    ; Wait until a new window or gadget event occurs.
    Event = WaitWindowEvent()
    EventWindow = EventWindow()
    EventGadget = EventGadget()
    EventType = EventType()
    
    ; Take some action.
    Select Event
      Case #PB_Event_Gadget
        ; A gadget event occurred.
      ;  If EventGadget = #FolderButton
          ; The folder button was clicked.
         ; Folder = FolderSelect(Folder)
         ; LabelUpdate(Folder)
         ; FilesExamine(Folder, Files())
         ; ListLoad(#FilesList, Files())
        If EventGadget = #_1203 ;open note
            OpenGadgetList(1, 4)
           
            DatabaseQuery (0, "SELECT * FROM Note WHERE Notename='"+GetGadgetText(#_1203)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       NextDatabaseRow(0) 
   EditorGadget(117, 425, 220, 600, 250)
   AddGadgetItem(117, -1, GetDatabaseString(0, 3))
   
  CloseGadgetList()
  EndIf
 ; If eventGadget = 1201
   ; loguserHandler()
   ; EndIf
  
  
  If EventGadget = 1202
     OpenGadgetList(1, 4)
   result5 = GetGadgetState(1200)
          
    If result5 = 0
          Debug "yes"
          mainwo()
          aWOordertHandler()
          ;punch()
          listuser()
          
         ElseIf result5 = -1
          ClearGadgetItems(1200)
         
             aWOordertHandler()
        ;  punch()
             listuser()
            
             
           
           
          
           EndIf
             CloseGadgetList()
           
         EndIf
        
         If EventGadget = 1200
  ;  ClearGadgetItems(#_1208)
           ;aWOordertHandler()
          ; work()
           
           punch()
           work()
          ;listuser()
           result6 = GetGadgetState(1202)
           ElseIf result6 = -1
             ;ClearGadgetItems(#_1208)
             ; work()
             punch()
             work()
             Debug "OMG NO!!!"
         EndIf
         
        ; If EventGadget = #_1208
           ;punch()
          ; work()
          ; EndIf
        
;         If EventGadget = 1211
       ; ------------------------------------------------------------
;
; PureBasic Win32 API - Get System Time & Date - Example File
;
; by MrVainSCL! aka Thorsten   26/Nov/2002    PB v3.40+
;
; ------------------------------------------------------------
;
   ; Info.SYSTEMTIME                           ; Init API Structure for _SYTEMTIME()
;
; -------- Win32 API Structure --------
;
;   typedef struct _SYSTEMTIME   
;     WORD wYear
;     WORD wMonth 
;     WORD wDayOfWeek 
;     WORD wDay 
;     WORD wHour 
;     WORD wMinute 
;     WORD wSecond 
;     WORD wMilliseconds 
;   SYSTEMTIME; 
;
; ------------------------------------------------------------
;
;     GetLocalTime_(Info)                       ; Get acutal LOCAL Time by System
    ;
    ; -------- Get actual Date --------
    ;
;     cday$       = Str((Info\wDay))
;     cmonth$     = Str((Info\wMonth))
;     cyear$      = Str((Info\wYear))
;     cwday$      = Str((Info\wDayOfWeek))
    ;
    ; -------- Get Actual Time --------
    ; 
;     chour$      = Str((Info\wHour)) 
;     cminute$    = Str((Info\wMinute))
;     csecond$    = Str((Info\wSecond))
;     cmillisec$  = Str((Info\wMilliseconds)) 
    ;
    ; -------- Select cwday$ num to get correct weekday --------
    ;
;     Select cwday$                           ; Same num handling like in Excel :wink:
;       Case "1" : cweekday$ = "Monday" 
;       Case "2" : cweekday$ = "Thursday"
 ;     Case "3" : cweekday$ = "Wednesday"
  ;    Case "4" : cweekday$ = "Thursday"
   ;   Case "5" : cweekday$ = "Friday"
    ;  Case "6" : cweekday$ = "Saturday"
     ; Case "0" : cweekday$ = "Sunday"       
;    EndSelect 
    ;
    ; -------- Write results into one string --------
    ;  
 ;   actdate$ = cweekday$ + ", " + cday$ + "-" + cmonth$ + "-" + cyear$ 
  ;  acttime$ = chour$ + ":" + cminute$ + ":" + csecond$ + " and " + cmillisec$ + " millisconds"
    ;
    ; -------- Print the result to the user --------
    ;    
   ; MessageRequester("Actual Date:",actdate$,0)
    ;MessageRequester("Actual Time:",acttime$,0)

;
; ------------------------------------------------------------
             
   ;If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   ;query10.s = "INSERT INTO punch (WO, USER, Punchin, nomtravaux) " + "VALUES ('"+GetGadgetText(100)+"', '"+GetGadgetText(1200)+"', '"+ actdate$ + acttime$ +"', '"+GetGadgetText(#_1208)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  ;If DatabaseUpdate(0, query10)
    
   ; Debug "data successfully inserted."

 ; Else
    
  ;  Debug "error inserting data! " + DatabaseError()
    
  ;EndIf

  ; close the database file
  
  
;Else
  
 ; Debug "error opening database! " + DatabaseError()
  
;EndIf
;       EndIf
        
        
        
        
        
        
       If EventGadget = #punchout
          
        

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
         If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
     
           query11.s = "UPDATE punch SET punchout=('"+time+"') WHERE (WO, USER, nomtravaux)=('"+GetGadgetText(100)+"', '"+GetGadgetText(1200)+"', '"+GetGadgetText(#_1208)+"')"
  
  ; update the database With the literal prepared query And confirm the write
  If DatabaseUpdate(0, query11)
    
    Debug "punch out "+time+" successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
       EndIf
         

        
         
        
       
        
        
       
        
        
     

        
        
        
        
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
        
        If EventGadget = 850
          OpenGadgetList(1, 1)
          Textemployer100$ = InputRequester("ajoutez un employer", "Veuillez entrer le username du nouveau", "")
        Textemployer101$ = InputRequester("ajoutez un employer", "Veuillez entrer le Nom propre du nouveau", "")
        Textemployer102$ = InputRequester("ajoutez un employer", "Veuillez entrer le Prenom du nouveau", "")
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
   ;  DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
   queryemployer.s = "INSERT INTO User (username, Nom, Prenom) " + "VALUES ('"+Textemployer100$+"', '"+Textemployer101$+"', '"+Textemployer102$+"')"
  
  ; update the database with the literal prepared query and confirm the write
 If DatabaseUpdate(0, queryemployer)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
TextGadget(862, 0, 80, 200, 20, " Liste employer", #PB_Text_Border | #PB_Text_Center)
 ListViewGadget(1200, 0, 100, 200, 300) 
        If DatabaseQuery (0, "SELECT * FROM User")
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(1200, -1, "" + GetDatabaseString(#mySql, 1))
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
       CloseGadgetList()
        EndIf
        
        
        
        If EventGadget = #_1208 ;joblist
             OpenGadgetList(1, 4)
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite Note DB"
      DatabaseQuery (0, "SELECT * FROM Job WHERE Jobname='"+GetGadgetText(#_1208)+"'")
      NextDatabaseRow(0) 
       EndIf
     TextGadget(1204, 425, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
     ;ScrollAreaGadget(1207, 425, 510, 600, 170, 600, 170, 800) 
    
   

    EditorGadget(1206, 425, 510, 600, 85, #PB_Gadget_BackColor)
    AddGadgetItem(1206, -1, GetDatabaseString(0, 2))
 
     EditorGadget(1207, 425, 595, 600, 85, #PB_Gadget_BackColor)
     
    AddGadgetItem(1207, -1, GetDatabaseString(0, 3))
    
    
   CloseGadgetList()
 EndIf
 

 ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        If EventGadget = 852
          
          OpenGadgetList(1, 1)
          
         If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Querydelemployer.s = "DELETE FROM User WHERE username = '"+GetGadgetText(1200)+"'"
      DatabaseUpdate(0, querydelemployer)
    
   

  FinishDatabaseQuery(0)
  
  MessageRequester("employer à supprimé!", "Employer " +GetGadgetText(1200)+ " supprimé!",  #PB_MessageRequester_Info)
  
EndIf

TextGadget(862, 0, 80, 200, 20, " Liste employer", #PB_Text_Border | #PB_Text_Center)
 ListViewGadget(1200, 0, 100, 200, 300) 
        If DatabaseQuery (0, "SELECT * FROM User")
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(1200, -1, "" + GetDatabaseString(#mySql, 1))
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
       CloseGadgetList()
       
EndIf

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
 ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
     ; Case #PB_Event_SizeWindow
        ; The window was moved or resized.
      ;  If EventWindow = #WindowFiles
       ;   WindowResize()  
       ; EndIf
        
      Case #PB_Event_CloseWindow
        ; The window was closed.
        
          End
          
          
        
    EndSelect
  ForEver
      


;main()
; IDE Options = PureBasic 6.03 LTS (Linux - x64)
; CursorPosition = 627
; FirstLine = 612
; Folding = ---
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)