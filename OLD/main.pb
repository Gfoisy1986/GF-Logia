UseMySQLDatabase()

;Windows using MariaDB -->   UseMySQLDatabase("libMariaDB.dll")


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
  #PB_w12
  #PB_w13
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
  #PB_w27
  #PB_w28
  #PB_w29
  #PB_w30
  #PB_w31
  #PageWO
  #mysql
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
  #_wo14
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
EndEnumeration

 
file = ReadFile(#PB_Any, "connection.cfg")
file1 = ReadFile(#PB_Any, "user.cfg")
file2 = ReadFile(#PB_Any, "pass.cfg")
connection$ = ReadString(file)
user$ = ReadString(file1)
pass$ = ReadString(file2)


If OpenDatabase(#mysql, connection$, user$, pass$)
 
Debug "Connection MySQL active"
Else
  Debug "Connection fail:"+DatabaseError()
  EndIf


  
  
Icone$ = "icon.ico"

Procedure inventaire()
  OpenGadgetList(1, 0)
  
  ButtonGadget(#inv_add, 0, 375, 200, 30, "Ajouté une piece")
  
  ButtonGadget(#inv_del, 250, 375, 200, 30, "Supprimé une piece")
   
  TextGadget(6009, 0, 420, 1280, 20, "Modification table inventaire", #PB_Text_Border | #PB_Text_Center)
   SetGadgetColor(6009, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#inv_0, 0, 450, 200, 30, "# no piece")
          ButtonGadget(#inv_1, 210, 450, 200, 30, "Description")
          ButtonGadget(#inv_2, 420, 450, 200, 30, "Quantité")
          ButtonGadget(#inv_3, 630, 450, 200, 30, "Quantité à stocké")
          ButtonGadget(#inv_4, 840, 450, 200, 30, "Prix achat #1")
          ButtonGadget(#inv_5, 1050, 450, 200, 30, "Fournisseur #1")
          ButtonGadget(#inv_6, 0, 490, 200, 30, "Prix achat #2")
          ButtonGadget(#inv_7, 210, 490, 200, 30, "Fournisseur #2")
          ButtonGadget(#inv_8, 420, 490, 200, 30, "Prix vente")
          ButtonGadget(#inv_9, 630, 490, 200, 30, "# Location")
          
     
          TextGadget(6008, 0, 0, 1280, 20, "Feuillet inventaire",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6008, #PB_Gadget_BackColor, $A7E3EF)
      
      
             
               
          If      ListIconGadget(#_inv2, 0, 20, 1280, 340, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_inv2, #PB_Gadget_BackColor, $00FFFF)
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


Procedure boite()
  OpenGadgetList(1, 12)
       
  
 

  
 
   
  
        
        ButtonGadget(#PB_Any, 0, 0, 640, 660, "GF-Calc")
        ButtonGadget(#PB_Any, 640, 0, 640, 660, "GF-Conv")
  CloseGadgetList()
EndProcedure


Procedure facturation()
  OpenGadgetList(1, 9)
       
  
 

  
 
   
        ButtonGadget(#PB_Any, 0, 0, 100, 630, "Liste Facture")
        ButtonGadget(#PB_Any, 640, 0, 100, 630, "Liste hist. Facture")
        
        ButtonGadget(#PB_Any, 100, 0, 540, 630, "Facture")
        ButtonGadget(#PB_Any, 740, 0, 540, 630, "Historique Facture")
        
        ButtonGadget(#PB_Any, 0, 630, 640, 30, "Archiver facture")
        ButtonGadget(#PB_Any, 640, 630, 640, 30, "Supprimer facture")
       
  CloseGadgetList()
EndProcedure


Procedure histwo()
  OpenGadgetList(1, 5)
       
 TextGadget(#_001, 0, 0, 200, 20," Liste Bon de travail Archivé", #PB_Text_Border | #PB_Text_Center)
 SetGadgetColor(#_001, #PB_Gadget_BackColor, $A7E3EF)
 
  If  ListViewGadget(#_F002, 0, 20, 200, 90) 
    
  DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='2' OR status='3'")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#_F002, -1, "" + GetDatabaseString(#mysql, 1))
      
    Wend 
   FinishDatabaseQuery(#mysql)
 EndIf
 
 
   
    
    
     CloseGadgetList()
     
     
       
       
       
  
EndProcedure

Procedure note()
  OpenGadgetList(1, 6)
       
       CalendarGadget(#cal, 0, 0, 210, 330)
  
  CloseGadgetList()
EndProcedure


Procedure agenda()
  OpenGadgetList(1, 7)
       
       CalendarGadget(#cal2, 0, 0, 650, 650)
  
  CloseGadgetList()
EndProcedure


Procedure result()
  OpenGadgetList(#PB_2, 1)
  
  
  
         

 CloseGadgetList()
       
EndProcedure



Procedure compta()
  OpenGadgetList(#PB_2, 0)


  
 LLS.s = "Update comptavariable SET totaltpspaye=(SELECT SUM(tpspaye) FROM comptable) WHERE id='1'"

 DatabaseUpdate(#mysql, LLS)
 FinishDatabaseQuery(#mysql)
   
  
   
 If  DatabaseQuery (#mysql, "SELECT * FROM comptavariable WHERE id='1'")
    FirstDatabaseRow(#mysql) 
          
      
      ; ButtonGadget(4020, 0, 420, 215, 30,""+GetDatabaseQuad(#mysql, 4))
     
   FinishDatabaseQuery(#mysql)
   EndIf
   
  
   TextGadget(#PB_Any, 0, 450, 1280, 20, "Modification table des employés", #PB_Text_Border | #PB_Text_Center)
 
 
  
        ; ButtonGadget(#BG_1, 210, 470, 200, 30, "Nom propre")
        ; ButtonGadget(#BG_2, 420, 470, 200, 30, "Prénom")
;          ButtonGadget(#BG_3, 630, 470, 200, 30, "Age")
;          ButtonGadget(#BG_4, 840, 470, 200, 30, "# Téléphone")
;          ButtonGadget(#BG_5, 1050, 470, 200, 30, "# Cell")
;          ButtonGadget(#BG_6, 0, 510, 200, 30, "Addresse")
;          ButtonGadget(#BG_7, 210, 510, 200, 30, "# Permis Conduire")
;          ButtonGadget(#BG_8, 420, 510, 200, 30, "# Liscence Méca")
;          ButtonGadget(#BG_9, 630, 510, 200, 30, "# Liscence P.E.P")
;          ButtonGadget(#BG_10, 840, 510, 200, 30, "# Liscence S.A.A.Q")
;          ButtonGadget(#BG_11, 1050, 510, 200, 30, "Date Naissance")
;          ButtonGadget(#BG_12, 0, 550, 200, 30, "Date Embauche")
;          ButtonGadget(#BG_13, 210, 550, 200, 30, "Ville")
;          ButtonGadget(#BG_14, 420, 550, 200, 30, "Province")
;          ButtonGadget(#BG_15, 630, 550, 200, 30, "Pays")
;          ButtonGadget(#BG_16, 840, 550, 200, 30, "Code Postal")
;          ButtonGadget(#BG_17, 1050, 550, 200, 30, "E-mail Personel")
;          ButtonGadget(#BG_18, 0, 590, 200, 30, "E-mail Job")
;          ButtonGadget(#BG_19, 210, 590, 200, 30, "Taux horraire")
        
        
         
         TextGadget(#PB_Any, 0, 0, 1280, 20, "Feuillet employé",  #PB_Text_Border | #PB_Text_Center)
      
      
            
             
               
         If    ListIconGadget(#_compta2, 0, 20, 1280, 160, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
             AddGadgetColumn(#_compta2, 1, "Date", 120)
             AddGadgetColumn(#_compta2, 2, "Description", 120)
             AddGadgetColumn(#_compta2, 3, "NO #", 120)
             AddGadgetColumn(#_compta2, 4, "Dépôt", 60)
             AddGadgetColumn(#_compta2, 5, "émission", 120)
             AddGadgetColumn(#_compta2, 6, "Montant à repporté", 120)
             AddGadgetColumn(#_compta2, 7, "Différence Débit/Crédit", 200)
             AddGadgetColumn(#_compta2, 8, "Compte à recevoir", 120)
             AddGadgetColumn(#_compta2, 9, "Compte à payé", 120)
             AddGadgetColumn(#_compta2, 10, "TPS recu", 120)
             AddGadgetColumn(#_compta2, 11, "TVQ recu", 120)
             AddGadgetColumn(#_compta2, 12, "TPS à payé", 120)
             AddGadgetColumn(#_compta2, 13, "TVQ à payé", 120)
             AddGadgetColumn(#_compta2, 14, "Revenue", 120)
             AddGadgetColumn(#_compta2, 15, "Dépense", 120)
             AddGadgetColumn(#_compta2, 16, "Total + taxe", 200)
             AddGadgetColumn(#_compta2, 17, "Total compte en banque", 200)
             
  
              
             DatabaseQuery (#mysql, "SELECT * FROM comptable ORDER BY timestamp ASC")
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_compta2, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 17))
      
      
      
      
      
    Wend  
    FinishDatabaseQuery(#mysql)
               EndIf
               
         
         

 CloseGadgetList()
       
EndProcedure




Procedure employer()
  OpenGadgetList(1, 1)
  TextGadget(859, 0, 400, 1280, 20, "Menu employé", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(859, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(850, 0, 420, 200, 20, "Ajouté un employé")
 
  ButtonGadget(852, 250, 420, 200, 20, "Supprimé un employé")
  
  
  
  TextGadget(6007, 0, 450, 1280, 20, "Modification table des employés", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(6007, #PB_Gadget_BackColor, $A7E3EF)
         ButtonGadget(#BG_0, 0, 470, 200, 30, "Username")
         ButtonGadget(#BG_1, 210, 470, 200, 30, "Nom propre")
         ButtonGadget(#BG_2, 420, 470, 200, 30, "Prénom")
         ButtonGadget(#BG_3, 630, 470, 200, 30, "Age")
         ButtonGadget(#BG_4, 840, 470, 200, 30, "# Téléphone")
         ButtonGadget(#BG_5, 1050, 470, 200, 30, "# Cell")
         ButtonGadget(#BG_6, 0, 510, 200, 30, "Addresse")
         ButtonGadget(#BG_7, 210, 510, 200, 30, "# Permis Conduire")
         ButtonGadget(#BG_8, 420, 510, 200, 30, "# Liscence Méca")
         ButtonGadget(#BG_9, 630, 510, 200, 30, "# Liscence P.E.P")
         ButtonGadget(#BG_10, 840, 510, 200, 30, "# Liscence S.A.A.Q")
         ButtonGadget(#BG_11, 1050, 510, 200, 30, "Date Naissance")
         ButtonGadget(#BG_12, 0, 550, 200, 30, "Date Embauche")
         ButtonGadget(#BG_13, 210, 550, 200, 30, "Ville")
         ButtonGadget(#BG_14, 420, 550, 200, 30, "Province")
         ButtonGadget(#BG_15, 630, 550, 200, 30, "Pays")
         ButtonGadget(#BG_16, 840, 550, 200, 30, "Code Postal")
         ButtonGadget(#BG_17, 1050, 550, 200, 30, "E-mail Personel")
         ButtonGadget(#BG_18, 0, 590, 200, 30, "E-mail Job")
         ButtonGadget(#BG_19, 210, 590, 200, 30, "Taux horraire")
         
         
         
         TextGadget(#_p20, 0, 0, 1280, 20, "Feuillet employé",  #PB_Text_Border | #PB_Text_Center)
         SetGadgetColor(#_p20, #PB_Gadget_BackColor, $A7E3EF)
      
      
             
             
               
           If     ListIconGadget(#_020, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_020, #PB_Gadget_BackColor, $00FFFF)
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
             
  
              
            DatabaseQuery (#mysql, "SELECT * FROM username ORDER BY username ASC")
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_020, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18)+Chr(10)+GetDatabaseString(#mysql, 19))
      
      
      
      
      
    Wend  
    FinishDatabaseQuery(#mysql)
               EndIf
               
         
         

 CloseGadgetList()
       
EndProcedure

Procedure Client()
  OpenGadgetList(1, 2)
  
  TextGadget(8591, 0, 400, 1280, 20, "Menu Client", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(8591, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(#_BCC8501, 0, 420, 200, 20, "Ajouté un client")
 
  ButtonGadget(#_BCC8521, 250, 420, 200, 20, "Supprimé un client")
  
  
  
  TextGadget(6006, 0, 450, 1280, 20, "Modification table des Clients", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(6006, #PB_Gadget_BackColor, $A7E3EF)
         ButtonGadget(#BC_024, 0, 470, 200, 30, "Noms entreprise")
         ButtonGadget(#BC_24, 210, 470, 200, 30, "Noms responsable")
         ButtonGadget(#BC_2, 420, 470, 200, 30, "E-mail propriétaire")
         ButtonGadget(#BC_3, 630, 470, 200, 30, "E-mail responsable")
         ButtonGadget(#BC_4, 840, 470, 200, 30, "# Fax responsable")
         ButtonGadget(#BC_5, 1050, 470, 200, 30, "# Fax entreprise")
         ButtonGadget(#BC_66, 0, 510, 200, 30, "Prenoms propriétaire")
         ButtonGadget(#BC_7, 210, 510, 200, 30, "Noms propriétaire")
         ButtonGadget(#BC_8, 420, 510, 200, 30, "# Cellulaire propriétaire")
         ButtonGadget(#BC_9, 630, 510, 200, 30, "# Cellulaire responsable")
         ButtonGadget(#BC_10, 840, 510, 200, 30, "# Téléphone entreprise")
         ButtonGadget(#BC_11, 1050, 510, 200, 30, "# Téléphone responsable")
         ButtonGadget(#BC_12, 0, 550, 200, 30, "Date création client")
         ButtonGadget(#BC_13, 210, 550, 200, 30, "Addresse entreprise")
         ButtonGadget(#BC_14, 420, 550, 200, 30, "Ville entreprise")
         ButtonGadget(#BC_15, 630, 550, 200, 30, "Province entreprise")
         ButtonGadget(#BC_16, 840, 550, 200, 30, "Pays entreprise")
         ButtonGadget(#BC_17, 1050, 550, 200, 30, "Code Pastal entreprise")
         ButtonGadget(#BC_18, 0, 590, 200, 30, "Addresse propriétaire")
         ButtonGadget(#BC_19, 210, 590, 200, 30, "Ville propriétaire")
         ButtonGadget(#BC_20, 420, 590, 200, 30, "Province propriétaire")
         ButtonGadget(#BC_21, 630, 590, 200, 30, "Pays propriétaire")
         ButtonGadget(#BC_22, 840, 590, 200, 30, "Code Postal propriétaire")
         ButtonGadget(#BC_23, 1050, 590, 200, 30, "Taux horraire")
       
   
         
         
         TextGadget(#_pc20, 0, 0, 1280, 20, "Feuillet client",  #PB_Text_Border | #PB_Text_Center)
         SetGadgetColor(#_pc20, #PB_Gadget_BackColor, $A7E3EF)
      
      

             
               
             If   ListIconGadget(#_BCC20, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
          SetGadgetColor(#_BCC20, #PB_Gadget_BackColor, $00FFFF)
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

Procedure flotte()
  OpenGadgetList(1, 3)
 
  TextGadget(#PB_fa, 0, 400, 200, 20, "Menu Flotte", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(#PB_fa, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(#PB_fc, 0, 420, 200, 30, "Supprimé un vehicule")
  
  
  TextGadget(#PB_fh, 0, 460, 200, 20, "#série | noms entreprise | unit", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(#PB_fh, #PB_Gadget_BackColor, $A7E3EF)
  ButtonGadget(#PB_fh2, 0, 480, 200, 30, "Créer un Bon de travail")
 
 If ListViewGadget(#PB_fh1, 0, 510, 200, 140)
    SetGadgetColor(#PB_fh1, #PB_Gadget_BackColor, $F3C8F3)
              DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY noment ASC")
             While NextDatabaseRow(#mysql) 
               
               AddGadgetItem(#PB_fh1, -1, ""+GetDatabaseString(#mySql, 1))
               
              Wend 
             FinishDatabaseQuery(#mysql)
            EndIf
  
  
  
            TextGadget(#PB_ff, 220, 400, 200, 20, "Ajouté par entreprise", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#PB_ff, #PB_Gadget_BackColor, $A7E3EF)
            
  ButtonGadget(#PB_fb, 220, 420, 200, 30, "Ajouté un vehicule")
 
  
   If ListViewGadget(#PB_fe, 220, 450, 200, 200)
  SetGadgetColor(#PB_fe, #PB_Gadget_BackColor, $F3C8F3)
            DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
             While NextDatabaseRow(#mySql) 
               
               AddGadgetItem(#PB_fe, -1, "" + GetDatabaseString(#mySql, 1))
               
              Wend 
             FinishDatabaseQuery(#mysql)
            EndIf
  
  
            TextGadget(6005, 460, 400, 820, 20, "Modification table de la flotte", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(6005, #PB_Gadget_BackColor, $A7E3EF)
         ButtonGadget(#PB_fg0, 460, 430, 200, 30, "# Série")
         ButtonGadget(#PB_fg1, 665, 430, 200, 30, "# Unité")
         ButtonGadget(#PB_fg2, 870, 430, 200, 30, "Annéee Vehivule")
         ButtonGadget(#PB_fg3, 1075, 430, 200, 30, "Marque Vehicule")
         ButtonGadget(#PB_fg4, 460, 470, 200, 30, "Model Vehicule")
         ButtonGadget(#PB_fg5, 665, 470, 200, 30, "Kilometrage")
         ButtonGadget(#PB_fg6, 870, 470, 200, 30, "heures")
         ButtonGadget(#PB_fg7, 1075, 470, 200, 30, "Date Derniere maintenance")
         ButtonGadget(#PB_fg8, 460, 510, 200, 30, "Mot de passe 'ECM'")
         ButtonGadget(#PB_fg9, 665, 510, 200, 30, "Imatriculation")
         ButtonGadget(#PB_fg10, 870, 510, 200, 30, "Fin garantie")
         ButtonGadget(#PB_fg11, 1075, 510, 200, 30, "Prochaine insnp. Pep ou Saaq")
         ButtonGadget(#PB_fg12, 460, 550, 200, 30, "Prochaine Maintenance")
         ButtonGadget(#PB_fg13, 665, 550, 200, 30, "Nom Entreprise")

         
         
         
          TextGadget(#PB_fd, 0, 0, 1280, 20, "Feuillet de la flotte",  #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_fd, #PB_Gadget_BackColor, $A7E3EF)
      
              
             
               
              
              

          If     ListIconGadget(#_a0fl, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
               SetGadgetColor(#_a0fl, #PB_Gadget_BackColor, $00FFFF)
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



  Procedure QuitHandler()
    
    End
  EndProcedure
  
  
  Procedure deletenote()
     ;OpenDatabase(0, "Mech-Logia.sqlite", "", "")
      Query.s = "DELETE FROM note WHERE notename = '"+GetGadgetText(#_1203)+"'"
      DatabaseUpdate(0, query)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note supprimé!", "Note supprimé!",  #PB_MessageRequester_Info)
  

 If ListViewGadget(#_1203, 225, 320, 200, 150)
             DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   FinishDatabaseQuery(#mysql)
             
            EndIf
    EndProcedure
  
  
  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Procedure savenotebuttonHandler()
      Debug "editor window saved"
    
    
     
             ;  query11.s = "UPDATE punch SET punchout=('"+time+"') WHERE (WO, USER, nomtravaux)=('"+GetGadgetText(4500)+"', '"+GetGadgetText(1200)+"', '"+GetGadgetText(#_1208)+"')"
    query4.s = "UPDATE note SET content=('"+GetGadgetText(#_WO117)+"') WHERE (notename)=('"+GetGadgetText(#_1203)+"')"
  
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(#mysql, query4)
    
   

  FinishDatabaseQuery(#mysql)
  
 MessageRequester("Note "+GetGadgetText(#_1203)+" Sauvegardée", "Note "+GetGadgetText(#_1203)+" Sauvegardée",  #PB_MessageRequester_Info)
  
EndProcedure

  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
     OpenGadgetList(1, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
    
   If  DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
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
              DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
              FinishDatabaseQuery(#mySql)
            EndIf
            TextGadget(217, 425, 200, 600, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
                    
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
    
     Procedure punchhist()
      OpenGadgetList(1, 5)
      
      TextGadget(6030, 200, 130, 320, 20, "Punch par travaux",  #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(6030, #PB_Gadget_BackColor, $A7E3EF)
      
         
               
           If      ListIconGadget(#_punch, 200, 150, 320, 150, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
              SetGadgetColor(#_punch, #PB_Gadget_BackColor, $00FFFF)

             AddGadgetColumn(#_punch, 1, "jobname", 65)
             AddGadgetColumn(#_punch, 2, "Punch in", 100)
             AddGadgetColumn(#_punch, 3, "Punch out", 100)
  
  
              
              DatabaseQuery(#mysql, "SELECT * FROM job WHERE (jobname) = ('"+GetGadgetText(#_w4)+"')")
             
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_punch, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6))
      
      
      
      
      
    Wend 
    
               
        FinishDatabaseQuery(#mysql)       
             
          EndIf    
             
          
               
               
          
 
   
    
      CloseGadgetList()
    EndProcedure
   
    Procedure punch()
      OpenGadgetList(1, 4)
      
      TextGadget(#PB_6030, 200, 130, 320, 20, "Punch par travaux",  #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(#PB_6030, #PB_Gadget_BackColor, $A7E3EF)
      
           
               
           If     ListIconGadget(#_punch, 200, 150, 320, 150, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
              SetGadgetColor(#_punch, #PB_Gadget_BackColor, $00FFFF)

             AddGadgetColumn(#_punch, 1, "jobname", 150)
             AddGadgetColumn(#_punch, 2, "Punch in", 150)
             AddGadgetColumn(#_punch, 3, "Punch out", 150)
  
  
               DatabaseQuery(#mysql, "SELECT * FROM punch WHERE (jobname) = ('"+GetGadgetText(#_w4)+"')", #PB_Database_DynamicCursor)
             
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_punch, -1, GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5))
      
      
      
      
      
    Wend 
    
               
        FinishDatabaseQuery(#mysql)       
             
            EndIf  
             
            ButtonGadget(#_2001, 200, 40, 320, 40,"Punch IN")
            ButtonGadget(#_2002, 200, 80, 320, 40,"Punch OUT")
               
               
          
 
   
    
      CloseGadgetList()
    EndProcedure
  
   
  
Procedure mainwo()
  OpenGadgetList(1, 4)
  
  TextGadget(402, 0, 0, 200, 20," Liste Bon de travail", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(402, #PB_Gadget_BackColor, $A7E3EF)
 If  ListViewGadget(#_WO1202, 0, 20, 200, 100) 
    SetGadgetColor(#_WO1202, #PB_Gadget_BackColor, $F3C8F3)
   DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#_WO1202, -1, GetDatabaseString(#mysql, 1))
      
    Wend 
   FinishDatabaseQuery(#mysql)
   EndIf
   
   
   
  
 CloseGadgetList()

  
EndProcedure



  Procedure aWOordertHandler()
    
          IncludeFile("wohandler.pb")


  EndProcedure
     
     
     
     
     
     ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     
  Procedure aWOordertHistHandler()
    
   ; IncludeFile("wohisthandler.pb")

  EndProcedure
     
     ;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     
  Procedure main()
    
 
   
#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1280, 720, "GF-Logia",  #PB_Window_ScreenCentered)
    
    AddWindowTimer(0, 250,60000)
    
  
    panel1 = PanelGadget(1, 0, 0, 1280, 720)
    
    ;///////////////////////////////////////////
    
    
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "Inventaire")
   inventaire()
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
    AddGadgetItem(1, -1, "Historique bon de travail")
     histwo()
    CloseGadgetList()
 
    
   OpenGadgetList(1)
AddGadgetItem(1, -1, "Les Notes")
     note()
     CloseGadgetList()
     
    OpenGadgetList(1)
    AddGadgetItem(1, -1, "Agenda")
     agenda()
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Stastistiques")
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
      OpenGadgetList(1)
    AddGadgetItem(1, -1, "Facturation")
     facturation()
     CloseGadgetList()
     
     
     
     OpenGadgetList(1)
    AddGadgetItem(1, -1, "Carnet Comptabilité")

    PanelGadget(#PB_2, 0, 30, 1280, 720)
       
    OpenGadgetList(#PB_2)
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Tenue de livre")
                        compta()
                        CloseGadgetList()
                        
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "État des résultats")
                        result()
                        CloseGadgetList()
 
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Bilan")
                        CloseGadgetList()
 
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Rapport de taxe")
                        CloseGadgetList()
 
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Dépense payé Perssonellement")
                        CloseGadgetList()
 
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Kilometrage")
                        CloseGadgetList()
  
                        OpenGadgetList(#PB_2)
                        AddGadgetItem(#PB_2, -1, "Frais bureau à domicile")
                        CloseGadgetList()
     CloseGadgetList()
     
      OpenGadgetList(1)
      AddGadgetItem(1, -1, "Catalogues des pieces")
     
       
       
       
       
     TextGadget(726, 100, 0, 100, 20, "heya")
     CloseGadgetList()
     
     OpenGadgetList(1)
    AddGadgetItem(1, -1, "Boite à outils")
     boite()
     CloseGadgetList()
     
     OpenGadgetList(1)
    AddGadgetItem(1, -1, "GuillaumeFoisy.ca")
     TextGadget(#PB_Any, 100, 0, 100, 20, "heya")
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
  
    ; Wait until a new window or gadget event occurs.
     
    
      Repeat
     Event = WaitWindowEvent()
     
   
     
     
     If Event = #PB_Event_Timer And EventTimer(); timer on data table
       
       
       inventaire()
       employer()
       client()
       flotte()
       
   
    
       
  
  EndIf ;// End Case event timer
        
          
  
      
     
     
     
     Select Event
       Case #PB_Event_Gadget 
        Select EventGadget()
            
           
       
        
        
       
        
        
  IncludeFile("caseinventaire.pb")
  IncludeFile("caseemployer.pb")
  IncludeFile("caseclient.pb")
  IncludeFile("caseflotte.pb")
  IncludeFile("casewo.pb")
  
  
  
 
 Case #_F002 :
    
   
          
    
         Debug "yes"
        
          aWOordertHistHandler()
           
          punchhist()

 
     
 
    
       Case  #_z0 : ;joblist historique
          
            OpenGadgetList(1, 5)
    
     
    
      
     
     TextGadget(#_pb04, 680, 490, 600, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     
   If  ListViewGadget(#_pb06, 680, 510, 600, 65)
   
         DatabaseQuery (#mysql, "SELECT * FROM job WHERE wo='"+GetGadgetText(#_F002)+"'")
     While   NextDatabaseRow(#mysql)       
        AddGadgetItem(#_pb06, -1, "" + GetDatabaseString(#mysql, 3))
       Wend
   
     FinishDatabaseQuery(#mysql)
     EndIf
     
   
      
      
  If   ListViewGadget(#_pb12, 680, 575, 600, 85)
   ; EditorGadget(#_pb12, 680, 575, 600, 85) 
          DatabaseQuery (#mysql, "SELECT * FROM job WHERE jobname='"+GetGadgetText(#_z0)+"'")
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(#_pb12, -1, "" + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   EndIf
   

     punchhist()
    CloseGadgetList()
  
          
        
          
        
               
               
            
        EndSelect       
               
; ///////////////////////////////////////////////////////////////////////
    EndSelect
   ForEver
 
; IDE Options = PureBasic 6.10 LTS (Linux - x64)
; CursorPosition = 4
; Folding = ----
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)