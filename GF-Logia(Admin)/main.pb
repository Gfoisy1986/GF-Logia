﻿UsePostgreSQLDatabase()

#mysql =  1
  
  If OpenDatabase(1, "host=localhost port=5432 dbname=gf-logia", "postgres", "!@Athene")
    Debug "Connected to PostgreSQL"
  Else
    Debug "Connection failed: "+DatabaseError()
  EndIf

Enumeration
      #PageWO
      #_INSP0
      #_INSPW
      #_listuserBG
      #_INSP1
      #_INSP2
      #_INSP3
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
    #BG_0
    #BG_1
    #BG_2
    #BG_3
    #BG_4
    #BG_5
    #BG_6
    #BG_7
    #BG_8
    #BG_9
    #BG_10
    #BG_11
    #BG_12
    #BG_13
    #BG_14
    #BG_15
    #BG_16
    #BG_17
    #BG_18
      #jobsave
      #_2000
      #frame1
      #_2002
      #punchout
      #_0
      #_p20
      #_JK
      #_020
EndEnumeration

  
 
 
Icone$ = "icon.ico"


  

Procedure GFoisyWEBSITE()
  OpenGadgetList(1, 0)
       URL$ = "https://www.google.ca"
       WebGadget(#PB_Any,25, 25, 800, 600, URL$)
       
  
  CloseGadgetList()
EndProcedure




Procedure employer()
  OpenGadgetList(1, 1)
  TextGadget(859, 0, 400, 1280, 20, "Menu employé", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(850, 0, 420, 200, 20, "Ajouté un employé")
 
  ButtonGadget(852, 250, 420, 200, 20, "Supprimé un employé")
  
  
  
   TextGadget(#PB_Any, 0, 450, 1280, 20, "Modification table des employés", #PB_Text_Border | #PB_Text_Center)
         ButtonGadget(#BG_0, 0, 470, 120, 20, "Username")
         ButtonGadget(#BG_1, 120, 470, 120, 20, "Nom propre")
         ButtonGadget(#BG_2, 240, 470, 120, 20, "Prénom")
         ButtonGadget(#BG_3, 360, 470, 60, 20, "Age")
         ButtonGadget(#BG_4, 420, 470, 120, 20, "# Téléphone")
         ButtonGadget(#BG_5, 540, 470, 120, 20, "# Cell")
         ButtonGadget(#BG_6, 660, 470, 120, 20, "Addresse")
         ButtonGadget(#BG_7, 780, 470, 120, 20, "# Permis Conduire")
         ButtonGadget(#BG_8, 900, 470, 120, 20, "# Liscence Méca")
         ButtonGadget(#BG_9, 1020, 470, 120, 20, "# Liscence P.E.P")
         ButtonGadget(#BG_10, 1140, 470, 120, 20, "# Liscence S.A.A.Q")
         ButtonGadget(#BG_11, 0, 490, 120, 20, "Date Naissance")
         ButtonGadget(#BG_12, 0, 490, 120, 20, "Date Embauche")
         ButtonGadget(#BG_13, 120, 490, 120, 20, "Ville")
         ButtonGadget(#BG_14, 240, 490, 120, 20, "Province")
         ButtonGadget(#BG_15, 360, 490, 120, 20, "Pays")
         ButtonGadget(#BG_16, 480, 490, 120, 20, "Code Postal")
         ButtonGadget(#BG_17, 600, 490, 120, 20, "E-mail Personel")
         ButtonGadget(#BG_18, 720, 490, 120, 20, "E-mail Job")
         
         
         
         TextGadget(#_p20, 0, 0, 1280, 20, "Feuillet employé",  #PB_Text_Border | #PB_Text_Center)
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM username")
             
               
              ListIconGadget(#_020, 0, 20, 1280, 380, "username", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
          
             AddGadgetColumn(#_020, 1, "Nom", 120)
             AddGadgetColumn(#_020, 2, "Prenom", 120)
             AddGadgetColumn(#_020, 3, "Age", 60)
             AddGadgetColumn(#_020, 4, "# Téléphone", 120)
             AddGadgetColumn(#_020, 5, "# Cell", 120)
             AddGadgetColumn(#_020, 6, "Addresse", 120)
             AddGadgetColumn(#_020, 7, "# Permis Conduire", 120)
             AddGadgetColumn(#_020, 8, "# Liscence Méca", 120)
             AddGadgetColumn(#_020, 9, "# Liscence P.E.P", 120)
             AddGadgetColumn(#_020, 10, "# Liscence S.A.A.Q", 120)
             AddGadgetColumn(#_020, 11, "Date Naissance", 120)
             AddGadgetColumn(#_020, 12, "Date Embauche", 120)
             AddGadgetColumn(#_020, 13, "Ville", 120)
             AddGadgetColumn(#_020, 14, "Province", 120)
             AddGadgetColumn(#_020, 15, "Pays", 120)
             AddGadgetColumn(#_020, 16, "Code Postal", 120)
             AddGadgetColumn(#_020, 17, "E-mail Personel", 120)
             AddGadgetColumn(#_020, 18, "E-mail Job", 120)
  
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_020, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18))
      
      
      
      
      
               Wend  
               EndIf
               FinishDatabaseQuery(#mysql)
         
         

 CloseGadgetList()
       
EndProcedure

Procedure Client()
  OpenGadgetList(1, 2)
  
   TextGadget(860, 220, 0, 200, 20, "Menu Client", #PB_Text_Border | #PB_Text_Center)
  ButtonGadget(853, 220, 20, 200, 20, "add client")
 ; ButtonGadget(854, 220, 40, 200, 20, "mod client")
  ButtonGadget(855, 220, 70, 200, 20, "del client")
  
  
  
  CloseGadgetList()
EndProcedure

Procedure Flotte()
  OpenGadgetList(1, 3)
    TextGadget(861, 440, 0, 200, 20, "Menu Vehicule par client", #PB_Text_Border | #PB_Text_Center)
    ButtonGadget(856, 440, 20, 200, 20, "add vehicule")
    ; ButtonGadget(857, 440, 40, 200, 20, "mod vehicule")
    ButtonGadget(858, 440, 70, 200, 20, "del vehicule")
  CloseGadgetList()
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
      
      TextGadget(#p12, 0, 160, 420, 20, "Punch par Job",  #PB_Text_Border | #PB_Text_Center)
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM punch WHERE jobname='"+GetGadgetText(#_1208)+"'")
             
               
              ListIconGadget(#_0, 0, 180, 420, 245, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
          
             AddGadgetColumn(#_0, 1, "jobname", 120)
             AddGadgetColumn(#_0, 2, "Punch in", 120)
             AddGadgetColumn(#_0, 3, "Punch out", 120)
  ; AddGadgetItem(0, -1, ""+GetDatabaseString(#mysql, 2), ImageID(100))
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_0, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4))
      
      
      
      
      
               Wend  
               EndIf
               FinishDatabaseQuery(#mysql)
               TextGadget(#PB_Any, 0, 485, 420, 20, "liste utilisateur", #PB_Text_Border | #PB_Text_Center)
      
               If DatabaseQuery (#mysql, "SELECT * FROM username")
                 ListViewGadget(#_2000, 0, 505, 420, 150)
                While NextDatabaseRow(#mysql) 
               
               
                   AddGadgetItem(#_2000, -1, ""+GetDatabaseString(#mysql, 0))
               
                  
                   
                Wend 
             
   
             
              EndIf
              
             
            ButtonGadget(#_2001, 0, 425, 420, 30,"Punch IN")
            ButtonGadget(#_2002, 0, 455, 420, 30,"Punch OUT")
               
               
          
 
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
        
     
      TextGadget(200, 480 , 0, 200, 20, "Bon de Travail #", #PB_Text_Border | #PB_Text_Center)
      TextGadget(100, 480, 20, 200, 30, ""+GetGadgetText(1202), #PB_Text_Border | #PB_Text_Center)
      
      
      
     
      DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo = '"+GetGadgetText(100)+"'")
      TextGadget(201, 680 , 0, 200, 20, "# Série (VIN)", #PB_Text_Border | #PB_Text_Center)
     While NextDatabaseRow(#mysql)
      TextGadget(101, 680, 20, 200, 30, "" + GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      Wend
     
 
  
      ; TextGadget(101, 425, 20, 200, 30, ana$, #PB_Text_Border | #PB_Text_Center)
   
   
   
   
      
      TextGadget(202, 880 , 0, 200, 20, "Année", #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(102, 880, 20, 200, 30, "" + GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
     
     

      
      TextGadget(203, 1080 , 0, 200, 20, "Model", #PB_Text_Border | #PB_Text_Center)
      TextGadget(103, 1080, 20, 200, 30, "" + GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
      
      
      
      TextGadget(204, 480 , 50, 200, 20, "# Unité", #PB_Text_Border | #PB_Text_Center)
      TextGadget(104, 480, 70, 200, 30, "" + GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
      
      
      TextGadget(205, 680 , 50, 200, 20, "Kilométrages", #PB_Text_Border | #PB_Text_Center)
       TextGadget(105, 680, 70, 200, 30, "" + GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(206, 880 ,50, 200, 20, "Heures", #PB_Text_Border | #PB_Text_Center)
       TextGadget(106, 880, 70, 200, 30, "" + GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(207, 1080 , 50, 200, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       TextGadget(107, 1080, 70, 200, 30, "" + GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(208, 480 , 100, 200, 20, "Prochaine Maintenance", #PB_Text_Border | #PB_Text_Center)
       TextGadget(108, 480, 120, 200, 30, "" + GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(209, 680 , 100, 200, 20, "Date Prochaine INSP...", #PB_Text_Border | #PB_Text_Center)
       TextGadget(109, 680, 120, 200, 30, "" + GetDatabaseString(#mysql, 11), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(210, 880 , 100, 200, 20, "Date Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       TextGadget(110, 880, 120, 200, 30, "" + GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(211, 1080 , 100, 200, 20, "Imatriculation", #PB_Text_Border | #PB_Text_Center)
       TextGadget(111, 1080, 120, 200, 30, "" + GetDatabaseString(#mysql, 13), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(212, 480 , 150, 200, 20, "Nom Propriétaire", #PB_Text_Border | #PB_Text_Center)
       TextGadget(112, 480, 170, 200, 30, "" + GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(213, 680 , 150, 200, 20, "Addresse Propriétaire", #PB_Text_Border | #PB_Text_Center)
       TextGadget(113, 680, 170, 200, 30, "" + GetDatabaseString(#mysql, 15), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(214, 880 , 150, 200, 20, "Addresse du Vehicule (Home)", #PB_Text_Border | #PB_Text_Center)
       TextGadget(114, 880, 170, 200, 30, "" + GetDatabaseString(#mysql, 16), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(215, 1080, 150, 200, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       TextGadget(115, 1080, 170, 200, 30, "" + GetDatabaseString(#mysql, 17), #PB_Text_Border | #PB_Text_Center)
      
      TextGadget(218, 480, 200, 200, 20, "Menu de Notes", #PB_Text_Border | #PB_Text_Center)
      ButtonGadget(220, 480, 220, 200, 20,"Nouvelle note")
     
       ButtonGadget(#_221, 480, 245, 200, 20,"Sauvegardé")
       ButtonGadget(223, 480, 270, 200, 20,"Supprimé")
       
       FinishDatabaseQuery(#mysql)
       
       DatabaseQuery (#mysql, "SELECT * FROM job WHERE wo="+GetGadgetText(100)+" LIMIT 1")
       
      TextGadget(#PB_Any, 220, 0, 225, 20, "Feuillet inspection", #PB_Text_Border | #PB_Text_Center)
     ; ButtonGadget(#_INSP1, 220, 20, 225, 20, "Vehicule light-duty")
    ;  ButtonGadget(#_INSP2, 220, 40, 225, 20, "Vehicule Medium-duty")
    ; ButtonGadget(#_INSP3, 220, 60, 225, 20, "Vehicule Heavy-duty")
      
      
      ListViewGadget(#_INSPW, 220, 20, 225, 30)
      
      
              NextDatabaseRow(#mysql) 
               
               
              AddGadgetItem(#_INSPW, -1, ""+GetDatabaseString(#mysql, 8))
               
                  
     
    FinishDatabaseQuery(#mysql)
    
    TextGadget(#PB_Any, 220, 70, 225, 20, "** ! Ne pas oubliée ! **", #PB_Text_Center)
    TextGadget(#PB_Any, 220, 90, 225, 20, "Select > Travaux > Utilisateur + Punch", #PB_Text_Border | #PB_Text_Center)

    TextGadget(224, 480, 300, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
      
      
       ListViewGadget(#_1203, 480, 320, 200, 150)
            DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo="+GetGadgetText(100))
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_1203, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend 
             
 
             
            
   TextGadget(217, 680, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
    EditorGadget(117, 680, 220, 600, 250)
                    
               
             
           
      DatabaseQuery (1, "SELECT * FROM job WHERE (username, wo)=('Garage', '"+GetGadgetText(100)+"')")
	

 
     TextGadget(1204, 680, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
   
      
     
               ButtonGadget(1210, 480, 630, 200, 30, "Nouvelle Job")
    ; ButtonGadget(#jobsave, 0, 595, 215, 30, "Sauvegarder Job")
     
    ; ButtonGadget(1209, 0, 635, 215, 30, "Supprimer Job")
     
   
   
     
     TextGadget(1205, 480, 490, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
     
     If  ListViewGadget(#_1208, 480, 510, 200, 120)
             
           While  NextDatabaseRow(#mysql) 
               
               IDJOB$ = GetDatabaseString(#mysql, 2)
               AddGadgetItem(#_1208, -1, ""+IDJOB$)
                 Wend  
             Debug ("joblist on")
           Else
             Debug ("not working") 
            EndIf
           
            
    FinishDatabaseQuery(#mysql)
      
    
   
    
    
     CloseGadgetList()
     
      BindGadgetEvent(#_221, @savenotebuttonHandler(), #PB_EventType_LeftClick)
       BindGadgetEvent(223, @deletenote(), #PB_EventType_LeftClick)
       BindGadgetEvent(220, @newnotebuttonHandler(), #PB_EventType_LeftClick)
       
       
     
     EndProcedure
     
     
  Procedure main()
    
 
   
#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1280, 720, "GF-Logia",  #PB_Window_ScreenCentered)
   
    panel1 = PanelGadget(1, 0, 10, 1280, 720)
    
    ;///////////////////////////////////////////
    
    
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "GuillaumeFoisy.ca")
    GFoisyWEBSITE()
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Employées")
employer()
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Clients")
Client()
CloseGadgetList()

OpenGadgetList(1)
AddGadgetItem(1, -1, "Flottes")
Flotte()
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
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Support Technique")
     TextGadget(726, 100, 0, 100, 20, "heya")
    CloseGadgetList()
    
      ;/////////////////////////////////////////////////////////////////////////////////////////////////////////menu/////////////////////////menu///////////////////////////////////menu///////////////////////////////
   
    
      CreateMenu(0, WindowID(0))  ; la création du menu commence ici....
      MenuTitle("  Menu  ")
     
      
      MenuItem(1, "Fermer")
        
      
     
      BindMenuEvent(0, 1, @QuitHandler())
       
      EndIf
    EndProcedure
    
    
    ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    main()
   

      ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
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
   EditorGadget(117, 680, 220, 600, 250)
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
          
          punch()
          
          
          
     CloseGadgetList()
           
 EndIf
 
 
 If EventGadget = #_INSPW
   
   OpenWindow(1, 0, 0, 800, 600, "GF-Logia_Insp-Sheet", #PB_Window_TitleBar |  #PB_Window_MinimizeGadget | #PB_Window_SizeGadget | #PB_Window_ScreenCentered)
   
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
    
    
   
     
               
       query3$ = InputRequester(GetDatabaseString(#mysql, 6), ""+GetGadgetText(#_2000)+" : Veuillez écrire le nouveau rapport", "")
      ; query2.s = "UPDATE job SET jobrepport='"+query3+"' WHERE jobname='"+GetGadgetText(#_1208)+"'"
       query2.s = "INSERT INTO job (id, wo, username, jobname, jobinfo, jobrepport ) VALUES ('"+GetGadgetText(100)+"', '"+GetGadgetText(100)+"', '"+GetGadgetText(#_2000)+"', '"+GetGadgetText(#_1208)+"', '"+GetGadgetText(1206)+"', '"+"("+GetGadgetText(#_2000)+") : "+query3$+"')"
          
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
  aWOordertHandler()
EndIf      
       
        
        
       
        
        
     

        
        
        
        
  ;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
        If EventGadget = 852
          OpenGadgetList(1, 1)
                         querydelemployer.s = "DELETE FROM username WHERE username='"+GetGadgetText(#_020)+"'"
  
                         DatabaseUpdate(#mysql, querydelemployer) 
                           
                         employer()
                         
                 CloseGadgetList()
        EndIf

        If EventGadget = 850
          OpenGadgetList(1, 1)
          Textemployer100$ = InputRequester("ajoutez un employer", "Veuillez entrer le username du nouveau", "")
        Textemployer101$ = InputRequester("ajoutez un employer", "Veuillez entrer le Nom propre du nouveau", "")
        Textemployer102$ = InputRequester("ajoutez un employer", "Veuillez entrer le Prenom du nouveau", "")
  
             queryemployer.s = "INSERT INTO username (username, nom, prenom) " + "VALUES ('"+Textemployer100$+"', '"+Textemployer101$+"', '"+Textemployer102$+"')"
  
  
         DatabaseUpdate(#mysql, queryemployer)
         employer()
       CloseGadgetList()
        EndIf
        
        
        
  If EventGadget = #_1208 ;joblist
             OpenGadgetList(1, 4)
    
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE wo='"+GetGadgetText(100)+"'")
      
     
     TextGadget(1204, 680, 490, 600, 20, "Editeur de Travaux", #PB_Text_Border | #PB_Text_Center)
     
    ListViewGadget(1206, 680, 510, 600, 65)
   
        
        NextDatabaseRow(#mysql)       
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
       
   
     FinishDatabaseQuery(#mysql)
     
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE jobname='"+GetGadgetText(#_1208)+"'")
      
      
 
    EditorGadget(1207, 680, 575, 600, 85) 
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, "" + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   
   

    
    CloseGadgetList()
   punch()
 EndIf
 
 If EventGadget = #BG_0
   texteuser0.s = InputRequester("Modification du username de l'employé.", "Veuillez entrer le nouveau username.", "")
   queryuser0.s = "UPDATE username SET username='"+texteuser0+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser0)
   employer()
EndIf
 
 If EventGadget = #BG_1
   texteuser1.s = InputRequester("Modification du nom de l'employé.", "Veuillez entrer le nouveau nom propre.", "")
   queryuser1.s = "UPDATE username SET nom='"+texteuser1+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser1)
   employer()
EndIf
 
  If EventGadget = #BG_2
   texteuser2.s = InputRequester("Modification du prenom de l'employé.", "Veuillez entrer le nouveau prenom.", "")
   queryuser2.s = "UPDATE username SET prenom='"+texteuser2+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser2)
   employer()
  EndIf
  
   If EventGadget = #BG_3
   texteuser3.s = InputRequester("Modification de age de l'employé.", "Veuillez entrer la nouvelle age.", "")
   queryuser3.s = "UPDATE username SET age='"+texteuser3+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser3)
   employer()
 EndIf
 
    If EventGadget = #BG_4
     texteuser4.s = InputRequester("Modification du # téléphone de l'employé.", "Veuillez entrer le nouveau # téléphone.", "")
   queryuser4.s = "UPDATE username SET tel='"+texteuser4+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser4)
   employer()
 EndIf
 
     If EventGadget = #BG_5
   texteuser5.s = InputRequester("Modification du # cellulaire de l'employé.", "Veuillez entrer le nouveau # cellulaire.", "")
   queryuser5.s = "UPDATE username SET cell='"+texteuser5+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser5)
   employer()
 EndIf
 
      If EventGadget = #BG_6
   texteuser6.s = InputRequester("Modification de l'addresse de l'employé.", "Veuillez entrer la nouvelle addresse.", "")
   queryuser6.s = "UPDATE username SET add='"+texteuser6+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser6)
   employer()
 EndIf
 
       If EventGadget = #BG_7
   texteuser7.s = InputRequester("Modification du # permis conduire de l'employé.", "Veuillez entrer le nouveau # permis.", "")
   queryuser7.s = "UPDATE username SET permis='"+texteuser7+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser7)
   employer()
       EndIf
       
        If EventGadget = #BG_8
   texteuser8.s = InputRequester("Modification de la liscence de mécanique de l'employé.", "Veuillez entrer le nouveau # liscence.", "")
   queryuser8.s = "UPDATE username SET liscence='"+texteuser8+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser8)
   employer()
        EndIf
        
         If EventGadget = #BG_9
   texteuser9.s = InputRequester("Modification du # p.e.p de l'employé.", "Veuillez entrer le nouveau # p.e.p.", "")
   queryuser9.s = "UPDATE username SET pep='"+texteuser9+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser9)
   employer()
         EndIf
         
          If EventGadget = #BG_10
   texteuser10.s = InputRequester("Modification du # liscence inspection SAAQ de l'employé.", "Veuillez entrer le nouveau # liscence.", "")
   queryuser10.s = "UPDATE username SET saaq='"+texteuser10+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser10)
   employer()
          EndIf
          
           If EventGadget = #BG_11
   texteuser11.s = InputRequester("Modification de la date de naissance de l'employé.", "Veuillez entrer la nouvelle date de naissance.", "")
   queryuser11.s = "UPDATE username SET date='"+texteuser11+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser11)
   employer()
           EndIf
           
            If EventGadget = #BG_12
   texteuser12.s = InputRequester("Modification de la date embauche de l'employé.", "Veuillez entrer la nouvelle date", "")
   queryuser12.s = "UPDATE username SET embauche='"+texteuser12+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser12)
   employer()
            EndIf
            
             If EventGadget = #BG_13
   texteuser13.s = InputRequester("Modification du nom de ville de l'employé.", "Veuillez entrer le nom de la nouvelle ville.", "")
   queryuser13.s = "UPDATE username SET city='"+texteuser13+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser13)
   employer()
             EndIf
             
              If EventGadget = #BG_14
   texteuser14.s = InputRequester("Modification de la province de l'employé.", "Veuillez entrer la nouvelle province", "")
   queryuser14.s = "UPDATE username SET province='"+texteuser14+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser14)
   employer()
              EndIf
              
               If EventGadget = #BG_15
   texteuser15.s = InputRequester("Modification du pays de l'employé.", "Veuillez entrer le nouveau pays.", "")
   queryuser15.s = "UPDATE username SET pays='"+texteuser15+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser15)
   employer()
               EndIf
               
                If EventGadget = #BG_16
   texteuser16.s = InputRequester("Modification du Code Postal de l'employé.", "Veuillez entrer le nouveau Code Postal.", "")
   queryuser16.s = "UPDATE username SET zip='"+texteuser16+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser16)
   employer()
                EndIf
                
                 If EventGadget = #BG_17
   texteuser17.s = InputRequester("Modification du email personel de l'employé.", "Veuillez entrer le nouveau e-mail.", "")
   queryuser17.s = "UPDATE username SET email1='"+texteuser17+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser17)
   employer()
                 EndIf
                 
                  If EventGadget = #BG_18
   texteuser18.s = InputRequester("Modification du e-mail job de l'employé.", "Veuillez entrer le nouveau e-mail.", "")
   queryuser18.s = "UPDATE username SET email2='"+texteuser18+"' WHERE username='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser18)
   employer()
                  EndIf
                  
                
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
      Case #PB_Event_CloseWindow
        ; The window was closed.
             CloseWindow(1)
         ; End
      
    EndSelect
  ForEver
      


; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; FirstLine = 594
; Folding = ---
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)