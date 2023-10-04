    
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
      #WO

EndEnumeration

  
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    Debug "Connecté à Mech-Logia.sqlite"
   EndIf
 
Icone$ = "icon.ico"




  
 

  Procedure QuitHandler()
    
    End
  EndProcedure
  
  
  Procedure deletenote()
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM Note WHERE Notename = '"+GetGadgetText(#listNote3)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimer", "note supprimé!",  #PB_MessageRequester_Info)
  
EndIf

    EndProcedure
  
  

   Procedure savenotebuttonHandler()
    Debug "editor window saved"
    
    
     If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
    
   
     
               
    query.s = "UPDATE Note SET Content='"+GetGadgetText(117)+"' WHERE Notename='"+GetGadgetText(#listNote3)+"'"
  
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Job # A Sauvegardée", "Les entrée 'Job # A' sont sauvegardée",  #PB_MessageRequester_Info)
  
  EndIf
  
 
  
EndProcedure


  Procedure opennoteHandler()
    ButtonGadget(221, 225, 240, 200, 20,"Sauvegardé")
     If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite Note DB"
      DatabaseQuery (0, "SELECT * FROM Note WHERE Notename='"+GetGadgetText(#listNote3)+"'")
       NextDatabaseRow(0) 
    EditorGadget(117, 425, 220, 600, 300)
    AddGadgetItem(117, -1, GetDatabaseString(0, 3))
    CloseDatabase(0)
  EndIf
  BindGadgetEvent(221, @savenotebuttonHandler())
  EndProcedure
  
Procedure RELOADWOLIST()
    Debug "editor window saved"
   
 RunProgram("WO.exe")
  End
  EndProcedure
  
  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
   If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
     DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
   query.s = "INSERT INTO Note (Notename, Wo, Content) " + "VALUES ('"+Text100$+"', '"+GetGadgetText(100)+"', '')"
  
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
  ListViewGadget(#listNote3, 225, 320, 200, 200)
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
              BindGadgetEvent(#listNote3, @opennoteHandler(), #PB_EventType_LeftClick)
 EndProcedure
 
 Procedure GETDESCA()
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite"
   DatabaseQuery (0, "SELECT * FROM Workorder WHERE ID=1")
     
               
    Debug "editor gadget reload!"
 

 
  

    SetDatabaseString(0, 0, GetGadgetText(524))  
  While NextDatabaseRow(0) ; Enumération des enregistrements
    
      ; Mise à jour du champ 'checked'  pour chaque enregistrement, en assumant  que le champ 'id'
      ; est le premier de la table 'employee'
      ;
      DatabaseUpdate(0, "UPDATE Workorder SET JobAtext=? WHERE ID=1")
    Wend


  FinishDatabaseQuery(0)
  
 MessageRequester("Job # A Sauvegardée", "Les entrée 'Job # A' sont sauvegardée",  #PB_MessageRequester_Info)
  
  EndIf
  EndProcedure

Procedure closewindowHandler()
    Debug "End program WO"
    
      End
    EndProcedure
    
    
  
   
  
  Procedure aWOordertHandler()
    ;//////////////////////<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
    OpenGadgetList(1, 0)
   
    
     

    
    If OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite"
      


    
      DatabaseQuery (0, "SELECT * FROM Workorder")
   ; For i = 0 To 65000
      ;AddGadgetItem(#list, i, "Ancien élément "+Str(i))
     ; SetGadgetItemData(#list, i, i)
    ;Next i
      Debug ("Ouverture du work order " + GetGadgetText(#list))
       
  
         
        EndIf
  
      
    
      
                                
      
      
      TextGadget(200, 225 , 0, 200, 20, "Bon de Travail #", #PB_Text_Border | #PB_Text_Center)
      TextGadget(100, 225   , 20, 200, 30, "" + GetGadgetText(#list), #PB_Text_Border | #PB_Text_Center)
      
       TextGadget(201, 425 , 0, 200, 20, "# Série (VIN)", #PB_Text_Border | #PB_Text_Center)
      StringGadget(101, 425 , 20, 200, 30, "")
      
      TextGadget(202, 625 , 0, 200, 20, "Year", #PB_Text_Border | #PB_Text_Center)
      StringGadget(102, 625 , 20, 200, 30, "")
      
      TextGadget(203, 825 , 0, 200, 20, "Make", #PB_Text_Border | #PB_Text_Center)
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
      
      TextGadget(224, 225, 300, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
      ListViewGadget(#listNote3, 225, 320, 200, 200)
             If DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#listNote3, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
             
            EndIf
      
            If DatabaseQuery (0, "SELECT * FROM Note WHERE Wo='"+GetGadgetText(100)+"'")
              
      TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
     
     
                FinishDatabaseQuery(#mySql)
                 success = #True
     EndIf
     
     
    
      
      ;ResizeGadget(950, 225, 540, 800, 400)
     ; ResizeGadget(524, 0, 20, 780, 60)
     ;
     ; ResizeGadget(525, 0, 80, 780, 100)
     
     ; ResizeGadget(725, 0, 0, 550, 20)
      
       ; BindGadgetEvent(426, @logoutHandler())
       ; BindGadgetEvent(221, @savenotebuttonHandler())
     BindGadgetEvent(223, @deletenote())
       BindGadgetEvent(220, @newnotebuttonHandler())
              BindGadgetEvent(#listNote3, @opennoteHandler(), #PB_EventType_LeftClick)
   ; ///////////////////////
  EndProcedure
  
  Procedure listebon()
      ButtonGadget(402, 0, 220, 215, 20," Liste Bon de travail")
        ListViewGadget(#list, 0, 240, 215, 360) 
     
        If DatabaseQuery (0, "SELECT * FROM Workorder")
  
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(#list, -1, "" + GetDatabaseString(#mySql, 0))
         
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
        BindGadgetEvent(#list, @aWOordertHandler(), #PB_EventType_LeftClick)
       EndProcedure
  
  
  
   

  Procedure loguserHandler()
    OpenGadgetList(1, 0)
  TextGadget(427, 0, 40, 215, 20, "Logged in as : " + GetGadgetText(#listuser))
  
 HideGadget(425, #True)
 HideGadget(#listuser, #True)
 ButtonGadget(900, 0, 60, 215, 35, "Reload Main()")
 
  ButtonGadget(402, 0, 220, 215, 20," Liste Bon de travail")
   ListViewGadget(#list, 0, 240, 215, 360) 
     
  If DatabaseQuery (0, "SELECT * FROM Workorder")
  
    While NextDatabaseRow(#mySql)       
      AddGadgetItem(#list, -1, "WO No: " + GetDatabaseString(#mySql, 0))
      
    Wend 
   
    FinishDatabaseQuery(#mySql)
   
    success = #True

  EndIf
  
  
 BindGadgetEvent(#list, @aWOordertHandler(), #PB_EventType_LeftClick)
  EndProcedure

Procedure main()

#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1900, 1000, "Mech-Logia", #PB_Window_TitleBar |  #PB_Window_MinimizeGadget | #PB_Window_SystemMenu |  #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
   
    panel1 = PanelGadget(1, 0, 20, 1900, 980)
    
    ;///////////////////////////////////////////
            
    AddGadgetItem(1, -1, "Bon de travail")
   
   
  
  
  
   ButtonGadget(425, 0, 60, 215, 20, " Liste Users")
        ListViewGadget(#listuser, 0, 80, 215, 100) 
     
        If DatabaseQuery (0, "SELECT * FROM User")
  
         While NextDatabaseRow(#mySql)       
          AddGadgetItem(#listuser, -1, "" + GetDatabaseString(#mySql, 1))
         
         Wend 
   
         FinishDatabaseQuery(#mySql)
   
         success = #True

       EndIf
       BindGadgetEvent(#listuser, @loguserHandler(), #PB_EventType_LeftClick)
  
   
        BindGadgetEvent(#listuser, @loguserHandler(), #PB_EventType_LeftClick)
    ;///////////////////////////////////////////
      CloseGadgetList()
   
  

 OpenGadgetList(1)
AddGadgetItem(1, -1, "Calendar")
     ButtonGadget(659, 0, 0, 230, 20, "A Cross Window Test :P !")
      CloseGadgetList()
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "Historique -bon de travail")
     TextGadget(726, 100, 0, 100, 20, ""+GetGadgetText(659))
                
  
    
    
    
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
           EditorGadget(117, 425, 220, 600, 300)
            OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Debug "Connecté à Mech-Logia.sqlite Note DB"
      DatabaseQuery (0, "SELECT * FROM Note WHERE Notename='"+GetGadgetText(#listNote3)+"'")
       NextDatabaseRow(0) 
    EditorGadget(117, 425, 220, 600, 300)
    AddGadgetItem(117, -1, GetDatabaseString(0, 3))
    CloseDatabase(0)
  
          EndIf
        If EventGadget = 223
          aWOordertHandler()
          EndIf
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
; CursorPosition = 286
; FirstLine = 272
; Folding = ---
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)