    
UseSQLiteDatabase()


Enumeration
      #PageWO
      #listWOARCH
      #listNote2
      #listNote3
      #listNote4
      #job
      #listNote
      #list
      #mysql = 0
      #close
      #File
      #listuser
      #listuseradmin
      #WO
      #jobscroll
      #jobscrollname
      #jobscrolllist
      #jobscroll1
      #jobscroll2
      #listjob1
      #jobdel
      #jobsave
      #jobnew
      #frame1
      #punchin
      #punchout
      #punchlist

EndEnumeration

  
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    Debug "Connecté à Mech-Logia.sqlite"
   EndIf
 
Icone$ = "icon.ico"


  

Procedure Administration()
  
  TextGadget(859, 0, 0, 200, 20, "Menu employer", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(850, 0, 20, 200, 20, "add employer")
  ButtonGadget(851, 0, 40, 200, 20, "mod employer")
  ButtonGadget(852, 0, 70, 200, 20, "del employer")
   TextGadget(862, 0, 100, 200, 20, " Liste employer", #PB_Text_Border | #PB_Text_Center)
        ListViewGadget(1200, 0, 120, 200, 300) 
        If DatabaseQuery (0, "SELECT * FROM User")
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(1200, -1, "" + GetDatabaseString(#mySql, 1))
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
       
       
       
  TextGadget(860, 220, 0, 200, 20, "Menu Client", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(853, 220, 20, 200, 20, "add client")
  ButtonGadget(854, 220, 40, 200, 20, "mod client")
  ButtonGadget(855, 220, 70, 200, 20, "del client")
  
  
  
  TextGadget(861, 440, 0, 200, 20, "Menu Vehicule par client", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(856, 440, 20, 200, 20, "add vehicule")
  ButtonGadget(857, 440, 40, 200, 20, "mod vehicule")
  ButtonGadget(858, 440, 70, 200, 20, "del vehicule")
  
  
  
  TextGadget(863, 660, 0, 200, 20, "Menu Bon de travail par vehicule", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(864, 660, 20, 200, 20, "add Bon de travail")
  ButtonGadget(865, 660, 40, 200, 20, "archivé Bon de travail")
  ButtonGadget(866, 660, 70, 200, 20, "del Bon de travail")
  
  
  
  TextGadget(867, 880, 0, 300, 20, "Menu historique Bon de travail par vehicule", #PB_Text_Border | #PB_Text_Center)
  
  
  ButtonGadget(870, 880, 70, 300, 20, "del H-Bon de travail")
EndProcedure

 

  Procedure QuitHandler()
    
    End
  EndProcedure
  
  
  Procedure deletenote()
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM Note WHERE Notename = '"+GetGadgetText(#listNote3)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimé!", "Note supprimé!",  #PB_MessageRequester_Info)
  
EndIf

    EndProcedure
  
  

   Procedure savenotebuttonHandler()
    Debug "editor window saved"
    
    
     If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   
     
               
    query.s = "UPDATE Note SET Content='"+GetGadgetText(117)+"' WHERE Notename='"+GetGadgetText(#listNote3)+"'"
  
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note "+GetGadgetText(#listNote3)+" Sauvegardée", "Note "+GetGadgetText(#listNote3)+" Sauvegardée",  #PB_MessageRequester_Info)
  
  EndIf
  
 
  
EndProcedure



  

  
  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  Procedure OpenJob()
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite Note DB"
      DatabaseQuery (0, "SELECT * FROM Job WHERE Jobname='"+GetGadgetText(#listjob1)+"'")
       NextDatabaseRow(0) 
     TextGadget(#jobscrollname, 425, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
     ScrollAreaGadget(#jobscroll, 425, 510, 600, 170, 580, 170, 800) 
    
   
    
    EditorGadget(#jobscroll1, 0, 0, 580, 85)
    AddGadgetItem(#jobscroll1, -1, GetDatabaseString(0, 2))
    

     EditorGadget(#jobscroll2, 0, 85, 580, 85)
     
    AddGadgetItem(#jobscroll2, -1, GetDatabaseString(0, 3))
    
    CloseGadgetList()
   
 EndIf
  EndProcedure  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
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
  ListViewGadget(#listNote3, 225, 320, 200, 150)
             If DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#listNote3, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
             
            EndIf
            TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
                     FinishDatabaseQuery(#mySql)
                 success = #True

     
      
     
      
      
     ; BindGadgetEvent(221, @savenotebuttonHandler())
       BindGadgetEvent(220, @newnotebuttonHandler())
             ; BindGadgetEvent(#listNote3, @opennoteHandler(), #PB_EventType_LeftClick)
 EndProcedure
 
 

Procedure closewindowHandler()
    Debug "End program WO"
    
      End
    EndProcedure
    
    
  
   
    Procedure listuser()
      
      
 
  

 
 
  ButtonGadget(950, 0, 60, 215, 20," Liste Employer")
   ListViewGadget(#listuseradmin, 0, 80, 215, 160) 
    
  If DatabaseQuery (0, "SELECT * FROM User")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#listuseradmin, -1, "" + GetDatabaseString(#mysql, 1))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True

  EndIf
  
      
      
      
    EndProcedure
    
  
    Procedure punch()
      
      ;HideGadget(425, #True)
 ;HideGadget(#listuser, #True)
 
 
  ButtonGadget(951, 0, 260, 215, 20," Liste des Punch par WO")
   ListViewGadget(#punchlist, 0, 280, 215, 160) 
    
  If DatabaseQuery (0, "SELECT * FROM punch WHERE WO='"+GetGadgetText(100)+"'")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#punchlist, -1, "" + GetDatabaseString(#mysql, 0) + " - " + GetDatabaseString(#mysql, 2) + "   " + GetDatabaseString(#mysql, 5))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True

  EndIf
      
    EndProcedure
    
  
  
  
   

  Procedure loguserHandler()
    OpenGadgetList(1, 3)
 
  
 ;HideGadget(425, #True)
 ;HideGadget(#listuser, #True)
 
 
  ButtonGadget(402, 0, 220, 215, 20," Liste Bon de travail")
   ListViewGadget(#list, 0, 240, 215, 360) 
    
  If DatabaseQuery (0, "SELECT * FROM Workorder")
  
    While NextDatabaseRow(#mySql)       
      AddGadgetItem(#list, -1, "WO No: " + GetDatabaseString(#mySql, 0))
      
    Wend 
   
    FinishDatabaseQuery(#mySql)
   
    success = #True

  EndIf
  CloseGadgetList()
  
 ;BindGadgetEvent(#list, @aWOordertHandler(), #PB_EventType_LeftClick)
  EndProcedure
  
  

  
Procedure mainwo()
  OpenGadgetList(1, 3)
  ButtonGadget(402, 0, 0, 215, 40," Liste Bon de travail")
  
   ListViewGadget(#list, 0, 40, 215, 450) 
    
   DatabaseQuery (0, "SELECT * FROM Workorder")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#list, -1, "WO No: " + GetDatabaseString(#mysql, 0))
      
    Wend 
   
    FinishDatabaseQuery(#mysql)
   
    success = #True
  
  
   
  
 
  
 
 CloseGadgetList()

  
EndProcedure


  Procedure aWOordertHandler()
    ;//////////////////////<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
   OpenGadgetList(1, 3)

 ;HideGadget(425, #True)
 ;HideGadget(#listuser, #True)
 
 

 
 
  
 
    

      


    
      ;DatabaseQuery (0, "SELECT * FROM Workorder")
   ; For i = 0 To 65000
      ;AddGadgetItem(#list, i, "Ancien élément "+Str(i))
     ; SetGadgetItemData(#list, i, i)
     ;Next i

      Debug ("Ouverture du work order " + GetGadgetText(#list))
       
  
         

  
      
    
      
                                
      
      
      TextGadget(200, 225 , 0, 200, 20, "Bon de Travail #", #PB_Text_Border | #PB_Text_Center)
      TextGadget(100, 225   , 20, 200, 30, "" + GetGadgetText(#list), #PB_Text_Border | #PB_Text_Center)
      
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
     ; ButtonGadget(221, 225, 240, 200, 20,"Sauvegardé")
      
      ButtonGadget(223, 225, 280, 200, 20,"Supprimé")
      
      FinishDatabaseQuery(#mysql)
                 success = #True
      
      TextGadget(224, 225, 300, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
      
       ListViewGadget(#listNote3, 225, 320, 200, 150)
              DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#listNote3, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend 
             
   
             
            
            TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
                     FinishDatabaseQuery(#mysql)
                 success = #True
               
               ButtonGadget(#jobnew, 0, 565, 215, 30, "Nouvelle Job")
     ButtonGadget(#jobsave, 0, 595, 215, 30, "Sauvegarder Job")
     
     ButtonGadget(#jobdel, 0, 635, 215, 30, "Supprimer Job")
     
     ButtonGadget(#punchin, 0, 445, 215, 25, "punch-in")
     ButtonGadget(#punchout, 0, 475, 215, 25, "punch-out")
     
     
     TextGadget(#jobscrolllist, 225, 490, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
      ListViewGadget(#listjob1, 225, 510, 200, 170)
             If DatabaseQuery (0, "SELECT * FROM Job WHERE WO='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mysql) 
               
               IDJOB$ = GetDatabaseString(#mysql, 1)
               AddGadgetItem(#listjob1, -1, "" + IDJOB$)
               
                  
                   
              Wend 
              EndIf
    FinishDatabaseQuery(#mysql)
                 success = #True
             
           
     TextGadget(#jobscrollname, 425, 490, 600, 20, "Éditeur de Travaux", #PB_Text_Border | #PB_Text_Center)
     ScrollAreaGadget(#jobscroll, 425, 510, 600, 170, 580, 170, 800) 
     EditorGadget(#jobscroll1, 0, 0, 580, 85)
     EditorGadget(#jobscroll2, 0, 85, 580, 85)
     
     
     ; ListViewGadget(#punchlist, 1025, 0, 400, 400)
           ;  If DatabaseQuery (0, "SELECT * FROM Job")
           ;  While NextDatabaseRow(#mySql) 
               
               
             ;  AddGadgetItem(#punchlist, -1, "- "+ GetDatabaseString(#mysql, 1))
               
           ;   Wend 
             
          ;  EndIf
            
  ;  FinishDatabaseQuery(#mysql)
   
   ; success = #True
   ; listuser()
     
     
     
     CloseGadgetList()
    
      ;ResizeGadget(950, 225, 540, 800, 400)
     ; ResizeGadget(524, 0, 20, 780, 60)
     ;
     ; ResizeGadget(525, 0, 80, 780, 100)
     
     ; ResizeGadget(725, 0, 0, 550, 20)
      
       ; BindGadgetEvent(426, @logoutHandler())
       ; BindGadgetEvent(221, @savenotebuttonHandler())
     BindGadgetEvent(#listjob1, @OpenJob())
     BindGadgetEvent(223, @deletenote())
       BindGadgetEvent(220, @newnotebuttonHandler())
              ;BindGadgetEvent(#listNote3, @opennoteHandler(), #PB_EventType_LeftClick)
  
 ;BindGadgetEvent(#list, @aWOordertHandler(), #PB_EventType_LeftClick)
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
AddGadgetItem(1, -1, "Clients")
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Flottes")
CloseGadgetList()

OpenGadgetList(1)
panel2 = AddGadgetItem(1, -1, "Bon de travail")
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
        If EventGadget = #listNote3
           
           
      DatabaseQuery (0, "SELECT * FROM Note WHERE Notename='"+GetGadgetText(#listNote3)+"'")
       NextDatabaseRow(0) 
   EditorGadget(117, 425, 220, 600, 250)
   AddGadgetItem(117, -1, GetDatabaseString(0, 3))
    ButtonGadget(221, 225, 240, 200, 20,"Sauvegardé")
  
  EndIf
 ; If eventGadget = #listuser
   ; loguserHandler()
   ; EndIf
  
  
    If EventGadget = #list
          
          aWOordertHandler()
          punch()
          listuser()
        EndIf
        
        If EventGadget = #punchin
       ; ------------------------------------------------------------
;
; PureBasic Win32 API - Get System Time & Date - Example File
;
; by MrVainSCL! aka Thorsten   26/Nov/2002    PB v3.40+
;
; ------------------------------------------------------------
;
    Info.SYSTEMTIME                           ; Init API Structure for _SYTEMTIME()
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
    GetLocalTime_(Info)                       ; Get acutal LOCAL Time by System
    ;
    ; -------- Get actual Date --------
    ;
    cday$       = Str((Info\wDay))
    cmonth$     = Str((Info\wMonth))
    cyear$      = Str((Info\wYear))
    cwday$      = Str((Info\wDayOfWeek))
    ;
    ; -------- Get Actual Time --------
    ; 
    chour$      = Str((Info\wHour)) 
    cminute$    = Str((Info\wMinute))
    csecond$    = Str((Info\wSecond))
    cmillisec$  = Str((Info\wMilliseconds)) 
    ;
    ; -------- Select cwday$ num to get correct weekday --------
    ;
    Select cwday$                           ; Same num handling like in Excel :wink:
      Case "1" : cweekday$ = "Monday" 
      Case "2" : cweekday$ = "Thursday"
      Case "3" : cweekday$ = "Wednesday"
      Case "4" : cweekday$ = "Thursday"
      Case "5" : cweekday$ = "Friday"
      Case "6" : cweekday$ = "Saturday"
      Case "0" : cweekday$ = "Sunday"       
    EndSelect 
    ;
    ; -------- Write results into one string --------
    ;  
    actdate$ = cweekday$ + ", " + cday$ + "-" + cmonth$ + "-" + cyear$ 
    acttime$ = chour$ + ":" + cminute$ + ":" + csecond$ + " and " + cmillisec$ + " millisconds"
    ;
    ; -------- Print the result to the user --------
    ;    
    MessageRequester("Actual Date:",actdate$,0)
    MessageRequester("Actual Time:",acttime$,0)

;
; ------------------------------------------------------------
             
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   query10.s = "INSERT INTO punch (WO, USER, Punchin, nomtravaux) " + "VALUES ('"+GetGadgetText(100)+"', '"+GetGadgetText(#listuseradmin)+"', '"+ actdate$ + acttime$ +"', '"+GetGadgetText(#listjob1)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(0, query10)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
        EndIf
        
        If EventGadget = #punchout
          
          
             ; ------------------------------------------------------------
;
; PureBasic Win32 API - Get System Time & Date - Example File
;
; by MrVainSCL! aka Thorsten   26/Nov/2002    PB v3.40+
;
; ------------------------------------------------------------
;
    Info.SYSTEMTIME                           ; Init API Structure for _SYTEMTIME()
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
    GetLocalTime_(Info)                       ; Get acutal LOCAL Time by System
    ;
    ; -------- Get actual Date --------
    ;
    cday$       = Str((Info\wDay))
    cmonth$     = Str((Info\wMonth))
    cyear$      = Str((Info\wYear))
    cwday$      = Str((Info\wDayOfWeek))
    ;
    ; -------- Get Actual Time --------
    ; 
    chour$      = Str((Info\wHour)) 
    cminute$    = Str((Info\wMinute))
    csecond$    = Str((Info\wSecond))
    cmillisec$  = Str((Info\wMilliseconds)) 
    ;
    ; -------- Select cwday$ num to get correct weekday --------
    ;
    Select cwday$                           ; Same num handling like in Excel :wink:
      Case "1" : cweekday$ = "Monday" 
      Case "2" : cweekday$ = "Thursday"
      Case "3" : cweekday$ = "Wednesday"
      Case "4" : cweekday$ = "Thursday"
      Case "5" : cweekday$ = "Friday"
      Case "6" : cweekday$ = "Saturday"
      Case "0" : cweekday$ = "Sunday"       
    EndSelect 
    ;
    ; -------- Write results into one string --------
    ;  
    actdate$ = cweekday$ + ", " + cday$ + "-" + cmonth$ + "-" + cyear$ 
    acttime$ = chour$ + ":" + cminute$ + ":" + csecond$ + " and " + cmillisec$ + " millisconds"
    ;
    ; -------- Print the result to the user --------
    ;    
    MessageRequester("Actual Date:",actdate$,0)
    MessageRequester("Actual Time:",acttime$,0)

;
; ------------------------------------------------------------
    
    
          If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
     
            query11.s = "UPDATE punch SET punchout=('"+actdate$+acttime$+"') WHERE (WO, USER, nomtravaux)=('"+GetGadgetText(100)+"', '"+GetGadgetText(#listuseradmin)+"', '"+GetGadgetText(#listjob1)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(0, query11)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
        EndIf
         

        
         If EventGadget = 402
          
           main()
           SetGadgetState(1, 3)
         
        EndIf
        
        If EventGadget = #jobdel
           
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM Job WHERE Jobname = '"+GetGadgetText(#listjob1)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("job supprimé!", "job supprimé!",  #PB_MessageRequester_Info)
 
 ListViewGadget(#listjob1, 225, 510, 200, 170)
             If DatabaseQuery (0, "SELECT * FROM Job WHERE WO='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               IDJOB$ = GetDatabaseString(#mySql, 1)
               AddGadgetItem(#listjob1, -1, "" + IDJOB$)
               
                  
                   
              Wend 
             
   
             
            EndIf
            BindGadgetEvent(#listjob1, @OpenJob())
 
EndIf

    
          EndIf
        
        
        If EventGadget = #jobsave
          
          Debug "editor window saved"
    
    
     If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   
     
               
       query3.s = "UPDATE Job SET jobinfo='"+GetGadgetText(#jobscroll1)+"' WHERE Jobname='"+GetGadgetText(#listjob1)+"'"
       query2.s = "UPDATE Job SET jobrepport='"+GetGadgetText(#jobscroll2)+"' WHERE Jobname='"+GetGadgetText(#listjob1)+"'"
  
  ; update the database with the literal prepared query and confirm the write
       DatabaseUpdate(0, query3)
       DatabaseUpdate(0, query2)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("job "+GetGadgetText(#jobscrolllist)+" Sauvegardée", "job "+GetGadgetText(#jobscrolllist)+" Sauvegardée",  #PB_MessageRequester_Info)
  
  EndIf
         
        EndIf
        
        
        
        If EventGadget = #jobnew
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

ListViewGadget(#listjob1, 225, 510, 200, 170)
             If DatabaseQuery (0, "SELECT * FROM Job")
             While NextDatabaseRow(#mySql) 
               
               IDJOB$ = GetDatabaseString(#mySql, 1)
               AddGadgetItem(#listjob1, -1, "" + IDJOB$)
               
                  
                   
              Wend 
             
   
             
            EndIf
            BindGadgetEvent(#listjob1, @OpenJob())
        EndIf
        
        
        
        
        
        
       ; If EventGadget = 223
         ; aWOordertHandler()
         ; EndIf
        If EventGadget = 900
          main()
          
           
          ; RELOADWOLIST()
          ; The update button was clicked.
         ;;;;;;;;;;;;;;;;;;;;; FilesExamine(Folder, Files())
       ;;;;;;;;;;;;;;;;;;;;;;;   ListLoad(#FilesList, Files())
          
       ; ElseIf EventGadget = #FolderText
          ; Do nothing here.
          
       ; ElseIf EventGadget = #FilesList
          ; Do nothing here.
          
        EndIf
        
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
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 228
; FirstLine = 224
; Folding = ---
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)