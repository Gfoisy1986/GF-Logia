    
;UseSQLiteDatabase()

UsePostgreSQLDatabase()
; UseMySQLDatabase()
#mysql =  1
  ; You should have a server running on localhost
  ;
  If OpenDatabase(1, "host=localhost port=5432 dbname=gf-logia", "postgres", "!@Athene")
    Debug "Connected to PostgreSQL"
  Else
    Debug "Connection failed: "+DatabaseError()
  EndIf

Enumeration
      #PageWO
      
     
      #p14
      #p13
      #job
      #p12
      #_2001
      #close
      #File
      #_1
      #_2
      #_3
      #WO
    #_1208
    #_221
#_1203
      #jobsave
      #_2000
      #frame1
      #_2002
      #punchout
     #_0
   #_JK
EndEnumeration

  
 
 
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
        If DatabaseQuery (#mysql, "SELECT * FROM User")
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
     ;OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM note WHERE notename = '"+GetGadgetText(#_1203)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimé!", "Note supprimé!",  #PB_MessageRequester_Info)
  

ListViewGadget(#_1203, 225, 320, 200, 150)
             If DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
             
            EndIf
    EndProcedure
  
  

  



  

  
  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Procedure savenotebuttonHandler()
      Debug "editor window saved"
    
    
    
    
   
     
             ;  query11.s = "UPDATE punch SET punchout=('"+time+"') WHERE (WO, USER, nomtravaux)=('"+GetGadgetText(100)+"', '"+GetGadgetText(1200)+"', '"+GetGadgetText(#_1208)+"')"
    query4.s = "UPDATE note SET content=('"+GetGadgetText(117)+"') WHERE (notename)=('"+GetGadgetText(#_1203)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(0, query4)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note "+GetGadgetText(#_1203)+" Sauvegardée", "Note "+GetGadgetText(#_1203)+" Sauvegardée",  #PB_MessageRequester_Info)
  
EndProcedure

  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
     OpenGadgetList(1, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
    
   If  DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(100)+"'")
   query.s = "INSERT INTO note (notename, wo, content, serie) " + "VALUES ('"+Text100$+"', '"+GetGadgetText(100)+"', '', '"+GetGadgetText(100)+"')"
  
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
             If DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(100)+"'")
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
 
 
 

          
 
 

 
 

 
 
 

Procedure closewindowHandler()
    Debug "End program WO"
    
      End
    EndProcedure
    
    
  
   
   
    Procedure punch()
      OpenGadgetList(1, 4)
      
      TextGadget(#p12, 0, 160, 215, 20, "Punch par Job",  #PB_Text_Border | #PB_Text_Center)
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM punch WHERE jobname='"+GetGadgetText(#_1208)+"'")
             
               
              ListIconGadget(#_0, 0, 180, 215, 245, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
            pic1 = LoadImage(100, "punchin.bmp")     ; changez le chemin/fichier contenant votre image 32x32 pixel
            pic2 = LoadImage(101, "punchinred.bmp")     ; changez le chemin/fichier contenant votre image 32x32 pixel
            pic3 = LoadImage(200, "punchout.bmp")     ; changez le chemin/fichier contenant votre image 32x32 pixel
            pic4 = LoadImage(202, "punchoutred.bmp")  ; changez le chemin/fichier contenant votre image 32x32 pixel
              
             AddGadgetColumn(#_0, 1, "Punch in", 90)
             AddGadgetColumn(#_0, 2, "Punch out", 90)
  ; AddGadgetItem(0, -1, ""+GetDatabaseString(#mysql, 2), ImageID(100))
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_0, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4))
      
      
      
      
      
               Wend  
               EndIf
               FinishDatabaseQuery(#mysql)
               TextGadget(#PB_Any, 0, 425, 215, 20, "liste utilisateur", #PB_Text_Border | #PB_Text_Center)
      
               If DatabaseQuery (#mysql, "SELECT * FROM username")
                 ListViewGadget(#_2000, 0, 445, 215, 60)
                While NextDatabaseRow(#mysql) 
               
               
                   AddGadgetItem(#_2000, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
                Wend 
             
   
             
              EndIf
              
             
            ButtonGadget(#_2001, 0, 505, 215, 20,"Punch IN")
            ButtonGadget(#_2002, 0, 525, 215, 20,"Punch OUT")
               
               
          
 
   FinishDatabaseQuery(#mysql)
    
      CloseGadgetList()
    EndProcedure
  
   
    
  
  
   
   


  
  

  
Procedure mainwo()
  OpenGadgetList(1, 4)
  
  ButtonGadget(402, 0, 0, 215, 40," Liste Bon de travail")
  
   ListViewGadget(1202, 0, 40, 215, 100) 
    
 If  DatabaseQuery (#mysql, "SELECT * FROM workorder")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(1202, -1, "" + GetDatabaseString(#mysql, 1))
      
    Wend 
   
   EndIf
  
   

  
 FinishDatabaseQuery(#mysql)
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
      
      
      
     
     If DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo = '"+GetGadgetText(100)+"'")
      TextGadget(201, 425 , 0, 200, 20, "# Série (VIN)", #PB_Text_Border | #PB_Text_Center)
     While NextDatabaseRow(#mysql)
      TextGadget(101, 425, 20, 200, 30, "" + GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      Wend
     
 
  
      ; TextGadget(101, 425, 20, 200, 30, ana$, #PB_Text_Border | #PB_Text_Center)
   
   
   
   
      
      TextGadget(202, 625 , 0, 200, 20, "Année", #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(102, 625, 20, 200, 30, "" + GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
     
     

   
   
   
   
      
      TextGadget(203, 825 , 0, 200, 20, "Model", #PB_Text_Border | #PB_Text_Center)
      TextGadget(103, 825, 20, 200, 30, "" + GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
      
      
      
      TextGadget(204, 225 , 50, 200, 20, "# Unité", #PB_Text_Border | #PB_Text_Center)
      TextGadget(104, 225, 70, 200, 30, "" + GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
      
      
      TextGadget(205, 425 , 50, 200, 20, "Kilométrages", #PB_Text_Border | #PB_Text_Center)
       TextGadget(105, 425, 70, 200, 30, "" + GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(206, 625 ,50, 200, 20, "Heures", #PB_Text_Border | #PB_Text_Center)
       TextGadget(106, 625, 70, 200, 30, "" + GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(207, 825 , 50, 200, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       TextGadget(107, 825, 70, 200, 30, "" + GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(208, 225 , 100, 200, 20, "Prochaine Maintenance", #PB_Text_Border | #PB_Text_Center)
       TextGadget(108, 225, 120, 200, 30, "" + GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(209, 425 , 100, 200, 20, "Date Prochaine INSP...", #PB_Text_Border | #PB_Text_Center)
       TextGadget(109, 425, 120, 200, 30, "" + GetDatabaseString(#mysql, 11), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(210, 625 , 100, 200, 20, "Date Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       TextGadget(110, 625, 120, 200, 30, "" + GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(211, 825 , 100, 200, 20, "Imatriculation", #PB_Text_Border | #PB_Text_Center)
       TextGadget(111, 825, 120, 200, 30, "" + GetDatabaseString(#mysql, 13), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(212, 225 , 150, 200, 20, "Nom Propriétaire", #PB_Text_Border | #PB_Text_Center)
       TextGadget(112, 225, 170, 200, 30, "" + GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(213, 425 , 150, 200, 20, "Addresse Propriétaire", #PB_Text_Border | #PB_Text_Center)
       TextGadget(113, 425, 170, 200, 30, "" + GetDatabaseString(#mysql, 15), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(214, 625 , 150, 200, 20, "Addresse du Vehicule (Home)", #PB_Text_Border | #PB_Text_Center)
       TextGadget(114, 625, 170, 200, 30, "" + GetDatabaseString(#mysql, 16), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(215, 825, 150, 200, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       TextGadget(115, 825, 170, 200, 30, "" + GetDatabaseString(#mysql, 17), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(218, 225, 200, 200, 20, "Menu de Notes", #PB_Text_Border | #PB_Text_Center)
      ButtonGadget(220, 225, 220, 200, 20,"Nouvelle note")
     
       ButtonGadget(#_221, 225, 245, 200, 20,"Sauvegardé")
      ButtonGadget(223, 225, 270, 200, 20,"Supprimé")
      
     EndIf
    FinishDatabaseQuery(#mysql)
     

    TextGadget(224, 225, 300, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
      
      
       ListViewGadget(#_1203, 225, 320, 200, 150)
            If  DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(100)+"'")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_1203, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend 
             
   EndIf
             
            
   TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
    EditorGadget(117, 425, 220, 600, 250)
                    
               
             
           
      DatabaseQuery (1, "SELECT * FROM job WHERE wo="+GetGadgetText(100))
	

 
     TextGadget(1204, 425, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
   
   
 
        
      
   
    
      
    
        
         
   
        
   
  
      
      
     
               ButtonGadget(1210, 0, 565, 215, 30, "Nouvelle Job")
     ButtonGadget(#jobsave, 0, 595, 215, 30, "Sauvegarder Job")
     
     ButtonGadget(1209, 0, 635, 215, 30, "Supprimer Job")
     
   
   
     
     TextGadget(1205, 225, 490, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
     
     If  ListViewGadget(#_1208, 225, 510, 200, 150)
             
             While NextDatabaseRow(#mysql) 
               
               IDJOB$ = GetDatabaseString(#mysql, 2)
               AddGadgetItem(#_1208, -1, ""+IDJOB$)
               Debug ("joblist on")
                  Wend  
             
           Else
             Debug ("not working") 
            EndIf
           
            
    FinishDatabaseQuery(#mysql)
   
    
     
      
    punch()
    ClearGadgetItems(#p12)
    ClearGadgetItems(#_0)
    ClearGadgetItems(#_2000)
    
    
     CloseGadgetList()
     
      BindGadgetEvent(#_221, @savenotebuttonHandler(), #PB_EventType_LeftClick)
       BindGadgetEvent(223, @deletenote(), #PB_EventType_LeftClick)
       BindGadgetEvent(220, @newnotebuttonHandler(), #PB_EventType_LeftClick)
       
       
      ; BindGadgetEvent(#_221, @savenotebuttonHandler(), #PB_EventType_LeftClick)
       ;BindGadgetEvent(223, @deletenote(), #PB_EventType_LeftClick)
       ;BindGadgetEvent(220, @newnotebuttonHandler(), #PB_EventType_LeftClick)
             
  
      
     ;  BindGadgetEvent(1210, @newjobentry())
      ; BindGadgetEvent(1209, @deljobentry(), #PB_EventType_LeftClick)
      ; BindGadgetEvent(#jobsave, @savejobentry(), #PB_EventType_LeftClick)
     EndProcedure
     
     
  Procedure main()
    
 
   
#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1280, 720, "GF-Logia", #PB_Window_TitleBar |  #PB_Window_MinimizeGadget | #PB_Window_SystemMenu |  #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
   
    panel1 = PanelGadget(1, 0, 10, 1280, 720)
    
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
           
            DatabaseQuery (1, "SELECT * FROM note WHERE notename='"+GetGadgetText(#_1203)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       NextDatabaseRow(1) 
   EditorGadget(117, 425, 220, 600, 250)
   AddGadgetItem(117, -1, GetDatabaseString(1, 3))
   
  CloseGadgetList()
  EndIf
 ; If eventGadget = 1201
   ; loguserHandler()
   ; EndIf
  
  
  If EventGadget = 1202
     OpenGadgetList(1, 4)
   
          
    
          Debug "yes"
        
           aWOordertHandler()
          
         ; punch()
          
          
          
     CloseGadgetList()
           
 EndIf
 
 
 If EventGadget = #jobsave  ;jobsave
   
     OpenGadgetList(1, 4)
       
   
    Debug "editor window saved"
    
    
   
     
               
    
       query2.s = "UPDATE job SET jobrepport='"+GetGadgetText(1207)+"' WHERE jobname='"+GetGadgetText(#_1208)+"'"
  
  ; update the database with the literal prepared query and confirm the write
     
       DatabaseUpdate(#mysql, query2)
    
   

  FinishDatabaseQuery(#mysql)
  
 MessageRequester("job "+GetGadgetText(1205)+" Sauvegardée", "job "+GetGadgetText(1205)+" Sauvegardée",  #PB_MessageRequester_Info)
 CloseGadgetList()

aWOordertHandler()
         
       
    
   
 EndIf
 
 If EventGadget = 1209 ;job delete
   
    OpenGadgetList(1, 4)
   
  
      Query.s = "DELETE FROM job WHERE jobname = '"+GetGadgetText(#_1208)+"'"
      DatabaseUpdate(#mysql, query)
    
   

  FinishDatabaseQuery(#mysql)
  
 MessageRequester("job supprimé!", "job supprimé!",  #PB_MessageRequester_Info)
 

            
 
         FinishDatabaseQuery(#mySql)
          CloseGadgetList()
   aWOordertHandler()
 EndIf
 
 
 If EventGadget = 1210  ;newjobbuttonhandler
   
   OpenGadgetList(1, 4)
   
 Text200$ = InputRequester("nouvelle job", "Veuillez entrer le nom de la nouvelle job", "")
          Text201$ = InputRequester("Info job", "Veuillez entrer les information sur les travaux", "")
          
   
     DatabaseQuery (#mysql, "SELECT * FROM job")
   query.s = "INSERT INTO job (id, jobname, jobinfo, wo) VALUES ('"+GetGadgetText(100)+"', '"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(100)+"')"
   
  ; update the database with the literal prepared query and confirm the write
  If DatabaseUpdate(#mysql, query)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

 



           
            

 
            FinishDatabaseQuery(#mysql)
            CloseGadgetList()
            
            
    aWOordertHandler()
   
 EndIf
        
        
        
        
        
        
        
       If EventGadget = #_2002 ;punchout
          
         
         
          OpenGadgetList(1, 4)
       
   
    Debug "editor window saved"
    
    
   
     
               
       query3$ = InputRequester(GetDatabaseString(#mysql, 6), ""+GetGadgetText(#_2000)+"Veuillez écrire le nouveau rapport", ""+" ("+GetGadgetText(#_2000)+")")
      ; query2.s = "UPDATE job SET jobrepport='"+query3+"' WHERE jobname='"+GetGadgetText(#_1208)+"'"
       query2.s = "INSERT INTO job (id, wo, username, jobname, jobinfo, jobrepport ) VALUES ('"+GetGadgetText(100)+"', '"+GetGadgetText(100)+"', '"+GetGadgetText(#_2000)+"', '"+GetGadgetText(#_1208)+"', '"+GetGadgetText(1206)+"', '"+query3$+"')"
          
  ; update the database with the literal prepared query and confirm the write
     
       DatabaseUpdate(#mysql, query2)
    
   

  FinishDatabaseQuery(#mysql)
  
 MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)



         
       
         
         
         

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
     
           query12.s = "UPDATE punch SET (punchout, pstatus)=('"+time+"', '2') WHERE (wo, username, pstatus, jobname)=('"+GetGadgetText(100)+"', '"+GetGadgetText(#_2000)+"', '1', '"+GetGadgetText(#_1208)+"')"
  
  ; update the database With the literal prepared query And confirm the write
  If DatabaseUpdate(#mysql, query12)
    
    Debug "punch out "+time+" successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  CloseGadgetList()
  punch()
  aWOordertHandler()
EndIf

   

        
         
   If EventGadget = #_2001
          
        

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
     
           query11.s = "INSERT INTO punch (id, wo, username, punchin, pstatus, jobname) VALUES ('"+GetGadgetText(100)+"', '"+GetGadgetText(100)+"', '"+GetGadgetText(#_2000)+"', '"+time+"', '1', '"+GetGadgetText(#_1208)+"')"
          
  ; update the database With the literal prepared query And confirm the write
                  
            
           If DatabaseUpdate(#mysql, query11)
    
    Debug "punch out "+time+" successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  punch()
EndIf      
       
        
        
       
        
        
     

        
        
        
        
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
        
        If EventGadget = 850
          OpenGadgetList(1, 1)
          Textemployer100$ = InputRequester("ajoutez un employer", "Veuillez entrer le username du nouveau", "")
        Textemployer101$ = InputRequester("ajoutez un employer", "Veuillez entrer le Nom propre du nouveau", "")
        Textemployer102$ = InputRequester("ajoutez un employer", "Veuillez entrer le Prenom du nouveau", "")
  
  If  queryemployer.s = "INSERT INTO User (username, Nom, Prenom) " + "VALUES ('"+Textemployer100$+"', '"+Textemployer101$+"', '"+Textemployer102$+"')"
  
  
 If DatabaseUpdate(#mysql, queryemployer)
    
    Debug "data successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  
  
  
Else
  
  Debug "error opening database! " + DatabaseError()
  
EndIf
TextGadget(862, 0, 80, 200, 20, " Liste employer", #PB_Text_Border | #PB_Text_Center)
 ListViewGadget(1200, 0, 100, 200, 300) 
        If DatabaseQuery (#mysql, "SELECT * FROM User")
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
    
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE wo='"+GetGadgetText(100)+"'")
      
     
     TextGadget(1204, 425, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
     
    ListViewGadget(1206, 425, 510, 600, 65)
   
        
        NextDatabaseRow(#mysql)       
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
       
   
     FinishDatabaseQuery(#mysql)
     
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE jobname='"+GetGadgetText(#_1208)+"'")
      
      
 
    EditorGadget(1207, 425, 575, 600, 85) 
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, "" + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   
   

    
    CloseGadgetList()
   punch()
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
; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 275
; FirstLine = 256
; Folding = --
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)