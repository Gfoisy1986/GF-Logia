UseSQLiteDatabase()

  Filename$ = "myDatabase.sqlite3"
  If OpenDatabase(0, Filename$, "", "")
    Debug "Connected to myDatabase.sqlite3"
    
  EndIf




Enumeration
  #_60015
  #PB_l30
  #_w2
  
  #PB_w32
  #PB_w33
  #PB_ll1
  #_wo20
  #PB_wo1
  #PB_wo2
  #PB_wo3
  #PB_wo4
  #PB_wo5
  #PB_wo6
  #PB_6030
  #PB_wo7
  #PB_wo8
  #PB_wo9
  #PB_w10
  #PB_w11
  
  
  #PB_w14
  #PB_w15
  #PB_w16
  #PB_w17
  #PB_w18
  #PB_w19
  #PB_w20
  #PB_w21
  #PB_w22
  #PB_w23
  #PB_w24
  #PB_w25
  #PB_w26
  #Pw270
  #PB_w28
  #PB_b29
  #PB_w30
  #PB_w31
  #PageWO
  #mysql = 0
  #CP_0
  #_wo
  #_wo1
  #_wo2
  #_wo3
  #_w4
  #_wo5
  #_wo6
  #_wo7
  #_wo8
  #_wo9
  #_wo10
  #_wo11
  #_wo12
  #_wo13
  #PB_b14
  #_wo15
   #CP_1
  #_WO117
  #_BCC8501
  #_WO217
  #PB_210
  #PB_110
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
      #_pb04
      #_pb06
      #_pb12
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
    #BG_19
      #jobsave
      #_2000
      #frame1
      #_2002
      #_402
      #punchout
      #_punch
      #_p20
      #_JK
      #_020
      #cal
      #cal2
      #_F002
      #_001
      #_101
      #_201
      #_102
      #_202
      #_103
      #_203
      #_104
      #_204
      #_105
      #_205
      #_106
      #_206
      #_107
      #_207
      #_108
      #_208
      #_109
      #_209
      #_110
      #_210
      #_111
      #_211
      #_112
      #_212
      #_113
      #_213
      #_114
      #_214
      #_115
      #_215
      #_116
      #_216
      #_117
      #_217
      #_118
      #_218
      #_100
      #_200
      #_220
      #_223
      #_INSPW0
      #_224
      #_12030
      #_1204
      #_1210
      #_zz
      #_z0
      #_qq
      #_ww
      #_lt1205
      #_p50
      #_p51
      #_p52
      #_pc20
       #BC_0
    #BC_1
    #BC_2
     #_pc21
    #BC_3
    #BC_4
    #BC_5
    #BC_66
    #BC_7
    #BC_8
    #BC_9
    #BC_10
    #BC_11
    #BC_12
    #BC_13
    #BC_14
    #BC_15
    #BC_16
    #BC_17
    #BC_18
    #BC_19
    #BC_20
    #BC_21
    #BC_22
    #BC_23
    #BC_24
    #BC_25
    #PB_109
    #_BCC8521
    #_BCC20
    #_WO1202
    #PB_fa
    #PB_fb
    #PB_fc
    #PB_fd
    #PB_fe
    #PB_ff
    #PB_fg0
    #PB_fg1
    #PB_fg2
    #PB_fg3
    #PB_fg4
    #PB_fg5
    #PB_fg6
    #PB_fg7
    #PB_fg8
    #PB_w27

   
    #PB_fg9
    #PB_fg10
    #PB_fg11
    #PB_fg12
    #PB_fg13
    #_a0fl
    #BC_024
    #PB_111
    #PB_115
    #PB_112
    #PB_114
    #PB_2
    #PB_113
    #_compta2
    #_inv2
    #inv_0
    #inv_1
    #inv_2
    #inv_3
    #inv_4
    #inv_5
    #inv_6
    #inv_7
    #inv_8
    #inv_9
    #inv_10
    #inv_add
    #inv_del
    #PB_fh2
    #PB_fh1
    #PB_fh
    #inv_22
     #inv_33
   EndEnumeration
   
   
  
   

Procedure inventaire()
  OpenGadgetList(0, 0)
  
  ButtonGadget(#inv_22, 10, 365, 200, 20, "Ajouté une piece")
  
  ButtonGadget(#inv_33, 590, 365, 200, 20, "Supprimé une piece")
   
  TextGadget(6009, 0, 400, 800, 20, "Modification table inventaire", #PB_Text_Border | #PB_Text_Center)
   SetGadgetColor(6009, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#inv_0, 0, 425, 180, 20, "# no piece")
          ButtonGadget(#inv_1, 190, 425, 180, 20, "Description")
          ButtonGadget(#inv_2, 380, 425, 180, 20, "Quantité")
          ButtonGadget(#inv_3, 570, 425, 180, 20, "Quantité à stocké")
          ButtonGadget(#inv_4, 0, 460, 180, 20, "Prix achat #1")
          ButtonGadget(#inv_5, 190, 460, 180, 20, "Fournisseur #1")
          ButtonGadget(#inv_6, 380, 460, 180, 20, "Prix achat #2")
          ButtonGadget(#inv_7, 570, 460, 180, 20, "Fournisseur #2")
          ButtonGadget(#inv_8, 0, 495, 180, 20, "Prix vente")
          ButtonGadget(#inv_9, 190, 495, 180, 20, "# Location")
          
     
          TextGadget(6008, 0, 0, 800, 20, "Feuillet inventaire",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6008, #PB_Gadget_BackColor, $F7D686)
      
      
             
               
          If      ListIconGadget(#_inv2, 0, 20, 800, 340, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_inv2, #PB_Gadget_BackColor, $E2DDDC)
             AddGadgetColumn(#_inv2, 1, "# no piece", 120)
             AddGadgetColumn(#_inv2, 2, "Description", 120)
             AddGadgetColumn(#_inv2, 3, "Quantité", 120)
             AddGadgetColumn(#_inv2, 4, "Quantité à stoké", 220)
             AddGadgetColumn(#_inv2, 5, "Prix achat #1", 60)
             AddGadgetColumn(#_inv2, 6, "Fournisseur #1", 120)
             AddGadgetColumn(#_inv2, 7, "Prix achat #2", 120)
             AddGadgetColumn(#_inv2, 8, "Fournisseur #2", 200)
             AddGadgetColumn(#_inv2, 9, "Prix vente", 120)
             AddGadgetColumn(#_inv2, 10, "# Location", 120)
         
             DatabaseQuery (#mysql, "SELECT * FROM inventaire ORDER BY id ASC")
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_inv2, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10))
      
              Wend  
                FinishDatabaseQuery(#mysql)
          EndIf      
         

CloseGadgetList()
       
EndProcedure

Procedure Client()
 OpenGadgetList(0, 2)
  
  
  ButtonGadget(8501, 10, 230, 200, 20, "Ajouté un client")
 
  ButtonGadget(#_BCC8521, 580, 230, 200, 20, "Supprimé un client")
  
  TextGadget(#_pc21, 0, 260, 800, 20, "Modification feuillet client",  #PB_Text_Border | #PB_Text_Center)
         SetGadgetColor(#_pc21, #PB_Gadget_BackColor, $A7E3EF)
  
 
         ButtonGadget(#BC_024, 0, 310, 180, 20, "Noms entreprise")
         ButtonGadget(#BC_24, 185, 310, 180, 20, "Noms responsable")
         ButtonGadget(#BC_2, 370, 310, 180, 20, "E-mail propriétaire")
         ButtonGadget(#BC_3, 555, 310, 180, 20, "E-mail responsable")
         ButtonGadget(#BC_4, 0, 335, 180, 20, "# Fax responsable")
         ButtonGadget(#BC_5, 185, 335, 180, 20, "# Fax entreprise")
         ButtonGadget(#BC_66, 370, 335, 180, 20, "Prenoms propriétaire")
         ButtonGadget(#BC_7, 555, 335, 180, 20, "Noms propriétaire")
         ButtonGadget(#BC_8, 0, 360, 180, 20, "# Cellulaire propriétaire")
         ButtonGadget(#BC_9, 185, 360, 180, 20, "# Cellulaire responsable")
         ButtonGadget(#BC_10, 370, 360, 180, 20, "# Téléphone entreprise")
         ButtonGadget(#BC_11, 555, 360, 180, 20, "# Téléphone responsable")
         ButtonGadget(#BC_12, 0, 390, 180, 20, "Date création client")
         ButtonGadget(#BC_13, 185, 390, 180, 20, "Addresse entreprise")
         ButtonGadget(#BC_14, 370, 390, 180, 20, "Ville entreprise")
         ButtonGadget(#BC_15, 555, 390, 180, 20, "Province entreprise")
         ButtonGadget(#BC_16, 0, 420, 180, 20, "Pays entreprise")
         ButtonGadget(#BC_17, 185, 420, 180, 20, "Code Pastal entreprise")
         ButtonGadget(#BC_18, 370, 420, 180, 20, "Addresse propriétaire")
         ButtonGadget(#BC_19, 555, 420, 180, 20, "Ville propriétaire")
         ButtonGadget(#BC_20, 0, 450, 180, 20, "Province propriétaire")
         ButtonGadget(#BC_21, 185, 450, 180, 20, "Pays propriétaire")
         ButtonGadget(#BC_22, 370, 450, 180, 20, "Code Postal propriétaire")
         ButtonGadget(#BC_23, 555, 450, 180, 20, "Taux horraire")
       
   
         
         
         TextGadget(#_pc20, 0, 0, 800, 20, "Feuillet client",  #PB_Text_Border | #PB_Text_Center)
         SetGadgetColor(#_pc20, #PB_Gadget_BackColor, $F7D686)
      
      

             
               
             If   ListIconGadget(#_BCC20, 0, 20, 800, 200, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
          SetGadgetColor(#_BCC20, #PB_Gadget_BackColor, $E2DDDC)
             AddGadgetColumn(#_BCC20, 1, "Noms Entreprise", 220)
             AddGadgetColumn(#_BCC20, 2, "Noms du Responsable", 220)
             AddGadgetColumn(#_BCC20, 3, "Email Propriétaire", 220)
             AddGadgetColumn(#_BCC20, 4, "Email Responsable", 220)
             AddGadgetColumn(#_BCC20, 5, "Fax Responsable", 220)
             AddGadgetColumn(#_BCC20, 6, "Fax de l'entreprise", 220)
             AddGadgetColumn(#_BCC20, 7, "Prenom Propriétaire", 220)
             AddGadgetColumn(#_BCC20, 8, "Noms Propriétaire", 220)
             AddGadgetColumn(#_BCC20, 9, "# cell propriétaire", 220)
             AddGadgetColumn(#_BCC20, 10, "# cell responsable", 220)
             AddGadgetColumn(#_BCC20, 11, "# téléphone entreprise", 220)
             AddGadgetColumn(#_BCC20, 12, "# téléphone responsable", 220)
             AddGadgetColumn(#_BCC20, 13, "Date création client", 220)
             AddGadgetColumn(#_BCC20, 14, "Addresse entreprise", 220)
             AddGadgetColumn(#_BCC20, 15, "Ville entreprise", 220)
             AddGadgetColumn(#_BCC20, 16, "Province entreprise", 220)
             AddGadgetColumn(#_BCC20, 17, "Pays Entreprise", 220)
             AddGadgetColumn(#_BCC20, 18, "Code Postal entreprise", 220)
             AddGadgetColumn(#_BCC20, 19, "Addresse propriétaire", 220)
             AddGadgetColumn(#_BCC20, 20, "Ville propriétaire", 220)
             AddGadgetColumn(#_BCC20, 21, "Province propriétaire", 220)
             AddGadgetColumn(#_BCC20, 22, "Pays propriétaire", 220)
             AddGadgetColumn(#_BCC20, 23, "Code Postal propriétaire", 220)
             
           
              
             DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
            
    While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_BCC20, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18)+Chr(10)+GetDatabaseString(#mysql, 19)+Chr(10)+GetDatabaseString(#mysql, 20)+Chr(10)+GetDatabaseString(#mysql, 21)+Chr(10)+GetDatabaseString(#mysql, 22)+Chr(10)+GetDatabaseString(#mysql, 23))
      
     
    Wend  
    FinishDatabaseQuery(#mysql)
  EndIf
              
  
  CloseGadgetList()  
EndProcedure


Procedure employer()
  OpenGadgetList(0, 1)
  
  ButtonGadget(850, 0, 230, 200, 20, "Ajouté un employé")
 
  ButtonGadget(852, 580, 230, 200, 20, "Supprimé un employé")
  
  
  
  TextGadget(6007, 0, 270, 800, 20, "Modification table des employés", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(6007, #PB_Gadget_BackColor, $A7E3EF)
         ButtonGadget(#BG_0, 0, 310, 100, 20, "Username")
         ButtonGadget(#BG_1, 110, 310, 100, 20, "Nom propre")
         ButtonGadget(#BG_2, 220, 310, 100, 20, "Prénom")
         ButtonGadget(#BG_3, 330, 310, 100, 20, "Age")
         ButtonGadget(#BG_4, 440, 310, 100, 20, "# Téléphone")
         ButtonGadget(#BG_5, 550, 310, 100, 20, "# Cell")
         ButtonGadget(#BG_6, 0, 340, 100, 20, "Addresse")
         ButtonGadget(#BG_7, 110, 340, 100, 20, "# Permis Conduire")
         ButtonGadget(#BG_8, 220, 340, 100, 20, "# Liscence Méca")
         ButtonGadget(#BG_9, 330, 340, 100, 20, "# Liscence P.E.P")
         ButtonGadget(#BG_10, 440, 340, 100, 20, "# Liscence S.A.A.Q")
         ButtonGadget(#BG_11, 550, 340, 100, 20, "Date Naissance")
         ButtonGadget(#BG_12, 0, 370, 100, 20, "Date Embauche")
         ButtonGadget(#BG_13, 110, 370, 100, 20, "Ville")
         ButtonGadget(#BG_14, 220, 370, 100, 20, "Province")
         ButtonGadget(#BG_15, 330, 370, 100, 20, "Pays")
         ButtonGadget(#BG_16, 440, 370, 100, 20, "Code Postal")
         ButtonGadget(#BG_17, 550, 370, 100, 20, "E-mail Personel")
         ButtonGadget(#BG_18, 0, 400, 100, 20, "E-mail Job")
         ButtonGadget(#BG_19, 110, 400, 100, 20, "Taux horraire")
         
         
         
         TextGadget(#_p20, 0, 0, 800, 20, "Feuillet employé",  #PB_Text_Border | #PB_Text_Center)
         SetGadgetColor(#_p20, #PB_Gadget_BackColor, $F7D686)
      
      
             
             
               
           If     ListIconGadget(#_020, 0, 20, 800, 200, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_020, #PB_Gadget_BackColor, $E2DDDC)
             AddGadgetColumn(#_020, 1, "Username", 220)
             AddGadgetColumn(#_020, 2, "Nom", 220)
             AddGadgetColumn(#_020, 3, "Prenom", 220)
             AddGadgetColumn(#_020, 4, "Age", 60)
             AddGadgetColumn(#_020, 5, "# Téléphone", 220)
             AddGadgetColumn(#_020, 6, "# Cell", 220)
             AddGadgetColumn(#_020, 7, "Addresse", 220)
             AddGadgetColumn(#_020, 8, "# Permis Conduire", 220)
             AddGadgetColumn(#_020, 9, "# Liscence Méca", 220)
             AddGadgetColumn(#_020, 10, "# Liscence P.E.P", 220)
             AddGadgetColumn(#_020, 11, "# Liscence S.A.A.Q", 220)
             AddGadgetColumn(#_020, 12, "Date Naissance", 220)
             AddGadgetColumn(#_020, 13, "Date Embauche", 220)
             AddGadgetColumn(#_020, 14, "Ville", 220)
             AddGadgetColumn(#_020, 15, "Province", 220)
             AddGadgetColumn(#_020, 16, "Pays", 220)
             AddGadgetColumn(#_020, 17, "Code Postal", 220)
             AddGadgetColumn(#_020, 18, "E-mail Personel", 220)
             AddGadgetColumn(#_020, 19, "E-mail Job", 220)
             
  
              
            DatabaseQuery (#mysql, "SELECT * FROM utilizateur ORDER BY utilizateur ASC")
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_020, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18)+Chr(10)+GetDatabaseString(#mysql, 19))
      
      
      
      
      
    Wend  
    FinishDatabaseQuery(#mysql)
               EndIf
               
         
         

 CloseGadgetList()
       
EndProcedure

Procedure flotte()
  OpenGadgetList(0, 3)
 
  TextGadget(#PB_fa, 0, 230, 150, 20, "Menu Flotte", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(#PB_fa, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(#PB_fc, 0, 250, 150, 30, "Supprimé un vehicule")
  
  
  TextGadget(#PB_fh, 0, 290, 150, 20, "#série | noms entreprise | unit", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(#PB_fh, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(#PB_fh2, 0, 310, 150, 30, "Créer un Bon de travail")
 
 If ListViewGadget(#PB_fh1, 0, 340, 150, 140)
    SetGadgetColor(#PB_fh1, #PB_Gadget_BackColor, $F3C8F3)
              DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY noment ASC")
             While NextDatabaseRow(#mysql) 
               
               AddGadgetItem(#PB_fh1, -1, ""+GetDatabaseString(#mySql, 1))
               
              Wend 
             FinishDatabaseQuery(#mysql)
            EndIf
  
  
  
            TextGadget(#PB_ff, 170, 230, 150, 20, "Ajouté par entreprise", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#PB_ff, #PB_Gadget_BackColor, $A7E3EF)
            
  ButtonGadget(#PB_fb, 170, 250, 150, 30, "Ajouté un vehicule")
 
  
   If ListViewGadget(#PB_fe, 170, 290, 150, 200)
  SetGadgetColor(#PB_fe, #PB_Gadget_BackColor, $F3C8F3)
            DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
             While NextDatabaseRow(#mySql) 
               
               AddGadgetItem(#PB_fe, -1, "" + GetDatabaseString(#mySql, 1))
               
              Wend 
             FinishDatabaseQuery(#mysql)
            EndIf
  
  
            TextGadget(6005, 340, 230, 450, 20, "Modification table de la flotte", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(6005, #PB_Gadget_BackColor, $A7E3EF)
         ButtonGadget(#PB_fg0, 340, 250, 90, 20, "# Série")
         ButtonGadget(#PB_fg1, 340, 280, 90, 20, "# Unité")
         ButtonGadget(#PB_fg2, 340, 310, 90, 20, "Annéee Vehivule")
         ButtonGadget(#PB_fg3, 340, 340, 90, 20, "Marque Vehicule")
         ButtonGadget(#PB_fg4, 440, 250, 90, 20, "Model Vehicule")
         ButtonGadget(#PB_fg5, 440, 280, 90, 20, "Kilometrage")
         ButtonGadget(#PB_fg6, 440, 310, 90, 20, "heures")
         ButtonGadget(#PB_fg7, 440, 340, 90, 20, "Date Derniere maintenance")
         ButtonGadget(#PB_fg8, 540, 250, 90, 20, "Mot de passe 'ECM'")
         ButtonGadget(#PB_fg9, 540, 280, 90, 20, "Imatriculation")
         ButtonGadget(#PB_fg10, 540, 310, 90, 20, "Fin garantie")
         ButtonGadget(#PB_fg11, 1075, 510, 200, 30, "Proch.insp.Pep ou Saaq")
         ButtonGadget(#PB_fg12, 460, 550, 200, 30, "Prochaine Maintenance")
         ButtonGadget(#PB_fg13, 665, 550, 200, 30, "Nom Entreprise")

         
         
         
          TextGadget(#PB_fd, 0, 0, 800, 20, "Feuillet de la flotte",  #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_fd, #PB_Gadget_BackColor, $F7D686)
      
              
             
               
              
              

          If     ListIconGadget(#_a0fl, 0, 20, 800, 200, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
               SetGadgetColor(#_a0fl, #PB_Gadget_BackColor, $E2DDDC)
               AddGadgetColumn(#_a0fl, 1, "# Série", 220)
               AddGadgetColumn(#_a0fl, 2, "Noms Entreprise", 220)
              AddGadgetColumn(#_a0fl, 3, "# unité", 220)
              AddGadgetColumn(#_a0fl, 4, "Année vehicule", 120)
              AddGadgetColumn(#_a0fl, 5, "Marque vehicule", 220)
              AddGadgetColumn(#_a0fl, 6, "Model vehicule", 220)
              AddGadgetColumn(#_a0fl, 7, "kilometrage", 220)
              AddGadgetColumn(#_a0fl, 8, "heure", 220)
              AddGadgetColumn(#_a0fl, 9, "Date derniere maintenance", 220)
              AddGadgetColumn(#_a0fl, 10, "Mot de passe 'ECM'", 220)
              AddGadgetColumn(#_a0fl, 11, "Imatriculation", 220)
              AddGadgetColumn(#_a0fl, 12, "Fin garantie", 220)
              AddGadgetColumn(#_a0fl, 13, "prochaine inspection pep ou saaq", 220)
              AddGadgetColumn(#_a0fl, 14, "prochaine maintenance", 220)
          
   DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY serie ASC")
               While NextDatabaseRow(#mysql)
     
       AddGadgetItem(#_a0fl, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12))

     Wend  
     FinishDatabaseQuery(#mysql)
                EndIf
  
  
  
  CloseGadgetList()
EndProcedure


 Procedure punch()
      OpenGadgetList(10, 3)
      
      TextGadget(#PB_6030, 0, 310, 650, 20, "Punch par travaux",  #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(#PB_6030, #PB_Gadget_BackColor, $A7E3EF)
      
           
               
           If     ListIconGadget(#_punch, 0, 330, 650, 150, "jobname", 150, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
              SetGadgetColor(#_punch, #PB_Gadget_BackColor, $00FFFF)

             AddGadgetColumn(#_punch, 1, "Punch in", 150)
             AddGadgetColumn(#_punch, 2, "Punch out", 150)
  
  
               DatabaseQuery(#mysql, "SELECT * FROM punch WHERE (wo, jobname) = ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(3003)+"')", #PB_Database_DynamicCursor)
             
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_punch, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5))
      
      
      
      
      
    Wend 
    
               
        FinishDatabaseQuery(#mysql)       
             
            EndIf  
             TextGadget(4009, 0, 190, 650, 40, "Sélectioner un travaux en premier lieu !",  #PB_Text_Border | #PB_Text_Center)
             SetGadgetColor(4009, #PB_Gadget_BackColor, $A7E3EF)
             ButtonGadget(#_2001, 0, 230, 650, 40,"Punch IN")
            ButtonGadget(#_2002, 0, 270, 650, 40,"Punch OUT")
               
               
          
 
   
    
      CloseGadgetList()
    EndProcedure
    
    
    
    
    Procedure maintravaux()
      
      
      OpenGadgetList(0, 4)
      TextGadget(490, 0, 0, 800, 20," Les Travaux", #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(490, #PB_Gadget_BackColor, $F7D686)
 TextGadget(402, 0, 20, 150, 20," Liste Bon de travail", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(402, #PB_Gadget_BackColor, $A7E3EF)
 If  ListViewGadget(#_WO1202, 0, 40, 150, 480) 
    SetGadgetColor(#_WO1202, #PB_Gadget_BackColor, $F3C8F3)
   DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#_WO1202, -1, GetDatabaseString(#mysql, 1))
      
    Wend 
   FinishDatabaseQuery(#mysql)
 EndIf

  PanelGadget     (10, 150, 20, 650, 500)
      AddGadgetItem (10, -1, "Bon de travail")
      AddGadgetItem (10, -1, "Les notes")
      AddGadgetItem (10, -1, "Les feuille inspection")
      AddGadgetItem (10, -1, "Les travaux")
      AddGadgetItem (10, -1, "Inventaire 'WO'")
     
      
      
      CloseGadgetList()
      
    EndProcedure
    
  
Procedure mainwo()
  OpenGadgetList(0, 4)
  
 
  
  
  
  TextGadget(402, 0, 0, 200, 20," Liste Bon de travail", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(402, #PB_Gadget_BackColor, $A7E3EF)
 If  ListViewGadget(#_WO1202, 0, 20, 200, 300) 
    SetGadgetColor(#_WO1202, #PB_Gadget_BackColor, $F3C8F3)
   DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#_WO1202, -1, GetDatabaseString(#mysql, 1))
      
    Wend 
   FinishDatabaseQuery(#mysql)
 EndIf
 
 
 
    
               
               
               
               
 
   
   
   
  
 CloseGadgetList()

  
EndProcedure

If OpenWindow(0, 0, 0, 800, 560, "GF_Logia", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
 

    
    ;///////////////////////////////////////////
    
    
  PanelGadget     (0, 0, 0, 800, 560)
      AddGadgetItem (0, -1, "Inventaire")
      inventaire()
      AddGadgetItem (0, -1, "Info Personel")
      employer()
      AddGadgetItem (0, -1, "Info Clients")
      Client()
      AddGadgetItem (0, -1, "Info Vehicules")
      flotte()
      AddGadgetItem (0, -1, "Travaux")
      ;mainwo()
      maintravaux()
      CloseGadgetList()
      OpenGadgetList(0)
      AddGadgetItem (0, -1, "Hist. Travaux")
      AddGadgetItem (0, -1, "Facturation")
      AddGadgetItem (0, -1, "Hist. Facturation")
      AddGadgetItem (0, -1, "Compte Comptable")
      AddGadgetItem (0, -1, "Agenda")
      AddGadgetItem (0, -1, "Info Techniques")
      AddGadgetItem (0, -1, "Boite a Outils")
      AddGadgetItem (0, -1, "Support Technique")
        CloseGadgetList()
      
        
   
     
   If CreateMenu(0, WindowID(0))
     MenuTitle("Menu")
     MenuItem(1, "Item 1")
     MenuItem(2, "Item 2")
     MenuItem(3, "Item 3")
   EndIf
    
  Repeat
     Event = WaitWindowEvent()
     
     Select Event
     
       Case #PB_Event_Gadget
         Select EventGadget()
             IncludeFile "caseinventaire.pb"
             IncludeFile "caseclient.pb"
             IncludeFile "caseemployer.pb"
             IncludeFile "caseflotte.pb"
             ;IncludeFile "casewo.pb"
             IncludeFile "newwocase.pb"
             
             
           Case #inv_22 : Debug "Button 1 clicked!"
           Case #inv_33 : Debug "Button 2 clicked!"
         EndSelect
       
       Case #PB_Event_Menu
         Select EventMenu()
           Case 1 : Debug "Menu item 1 clicked!"
           Case 2 : Debug "Menu item 2 clicked!"
           Case 3 : Debug "Menu item 3 clicked!"
         EndSelect
     
     EndSelect
   Until Event = #PB_Event_CloseWindow
 EndIf
; IDE Options = PureBasic 5.73 LTS (Windows - x86)
; CursorPosition = 300
; FirstLine = 276
; Folding = --
; EnableXP
; DPIAware