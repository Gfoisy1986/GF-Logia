UseMySQLDatabase()

;"libMariaDB.dll"


Enumeration
  #_60015
  #_w2
  #PB_ll1
  #_wo20
  #PB_wo1
  #PB_wo2
  #PB_wo3
  #PB_wo4
  #PB_wo5
  #PB_wo6
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

connection$ = ReadString(file)
user$ = ReadString(file1)


If OpenDatabase(#mysql, connection$, user$, "")
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
      
      
              DatabaseQuery (#mysql, "SELECT * FROM inventaire ORDER BY id ASC")
             
               
               ListIconGadget(#_inv2, 0, 20, 1280, 340, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_inv2, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#_inv2, 1, "# no piece", 120)
             AddGadgetColumn(#_inv2, 2, "Description", 120)
             AddGadgetColumn(#_inv2, 3, "Quantité", 120)
             AddGadgetColumn(#_inv2, 4, "Quantité à stoké", 120)
             AddGadgetColumn(#_inv2, 5, "Prix achat #1", 60)
             AddGadgetColumn(#_inv2, 6, "Fournisseur #1", 120)
             AddGadgetColumn(#_inv2, 7, "Prix achat #2", 120)
             AddGadgetColumn(#_inv2, 8, "Fournisseur #2", 200)
             AddGadgetColumn(#_inv2, 9, "Prix vente", 120)
             AddGadgetColumn(#_inv2, 10, "# Location", 120)
         
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_inv2, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10))
      
              Wend  
                FinishDatabaseQuery(#mysql)
                
         

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
       
 ButtonGadget(#_001, 0, 0, 215, 30," Liste Bon de travail Archivé")
  
   ListViewGadget(#_F002, 0, 30, 215, 90) 
    
 If  DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='2'")
  
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
  
    While NextDatabaseRow(#mysql)       
      
       ButtonGadget(4020, 0, 420, 215, 30,""+ GetDatabaseString(#mysql, 4))
    Wend 
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
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM comptable ORDER BY timestamp ASC")
             
               
            ListIconGadget(#_compta2, 0, 20, 1280, 160, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
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
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM username ORDER BY username ASC")
             
               
               ListIconGadget(#_020, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_020, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#_020, 1, "Username", 120)
             AddGadgetColumn(#_020, 2, "Nom", 120)
             AddGadgetColumn(#_020, 3, "Prenom", 120)
             AddGadgetColumn(#_020, 4, "Age", 60)
             AddGadgetColumn(#_020, 5, "# Téléphone", 120)
             AddGadgetColumn(#_020, 6, "# Cell", 120)
             AddGadgetColumn(#_020, 7, "Addresse", 120)
             AddGadgetColumn(#_020, 8, "# Permis Conduire", 120)
             AddGadgetColumn(#_020, 9, "# Liscence Méca", 120)
             AddGadgetColumn(#_020, 10, "# Liscence P.E.P", 120)
             AddGadgetColumn(#_020, 11, "# Liscence S.A.A.Q", 120)
             AddGadgetColumn(#_020, 12, "Date Naissance", 120)
             AddGadgetColumn(#_020, 13, "Date Embauche", 120)
             AddGadgetColumn(#_020, 14, "Ville", 120)
             AddGadgetColumn(#_020, 15, "Province", 120)
             AddGadgetColumn(#_020, 16, "Pays", 120)
             AddGadgetColumn(#_020, 17, "Code Postal", 120)
             AddGadgetColumn(#_020, 18, "E-mail Personel", 120)
             AddGadgetColumn(#_020, 19, "E-mail Job", 120)
             
  
              
            
            
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
      
      
       If DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
             
               
         ListIconGadget(#_BCC20, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
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
 
  ListViewGadget(#PB_fh1, 0, 510, 200, 140)
    SetGadgetColor(#PB_fh1, #PB_Gadget_BackColor, $F3C8F3)
             If DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY noment ASC")
             While NextDatabaseRow(#mySql) 
               
               AddGadgetItem(#PB_fh1, -1, ""+GetDatabaseString(#mySql, 1))
               
              Wend 
             FinishDatabaseQuery(#mysql)
            EndIf
  
  
  
            TextGadget(#PB_ff, 220, 400, 200, 20, "Ajouté par entreprise", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#PB_ff, #PB_Gadget_BackColor, $A7E3EF)
            
  ButtonGadget(#PB_fb, 220, 420, 200, 30, "Ajouté un vehicule")
 
  
  ListViewGadget(#PB_fe, 220, 450, 200, 200)
  SetGadgetColor(#PB_fe, #PB_Gadget_BackColor, $F3C8F3)
             If DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
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
      
             If DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY serie ASC")
             
               
              
              

               ListIconGadget(#_a0fl, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
               SetGadgetColor(#_a0fl, #PB_Gadget_BackColor, $00FFFF)
               AddGadgetColumn(#_a0fl, 1, "# Série", 120)
               AddGadgetColumn(#_a0fl, 2, "Noms Entreprise", 120)
              AddGadgetColumn(#_a0fl, 3, "# unité", 120)
              AddGadgetColumn(#_a0fl, 4, "Année vehicule", 60)
              AddGadgetColumn(#_a0fl, 5, "Marque vehicule", 120)
              AddGadgetColumn(#_a0fl, 6, "Model vehicule", 120)
              AddGadgetColumn(#_a0fl, 7, "kilometrage", 120)
              AddGadgetColumn(#_a0fl, 8, "heure", 120)
              AddGadgetColumn(#_a0fl, 9, "Date derniere maintenance", 120)
              AddGadgetColumn(#_a0fl, 10, "Mot de passe 'ECM'", 120)
              AddGadgetColumn(#_a0fl, 11, "Imatriculation", 120)
              AddGadgetColumn(#_a0fl, 12, "Fin garantie", 120)
              AddGadgetColumn(#_a0fl, 13, "prochaine inspection pep ou saaq", 120)
              AddGadgetColumn(#_a0fl, 14, "prochaine maintenance", 120)
          
   
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
  

ListViewGadget(#_1203, 225, 320, 200, 150)
             If DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
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
  DatabaseUpdate(0, query4)
    
   

  FinishDatabaseQuery(0)
  
 MessageRequester("Note "+GetGadgetText(#_1203)+" Sauvegardée", "Note "+GetGadgetText(#_1203)+" Sauvegardée",  #PB_MessageRequester_Info)
  
EndProcedure

  ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   
  Procedure newnotebuttonHandler()
     OpenGadgetList(1, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
    
   If  DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
   query.s = "INSERT INTO note (notename, wo, content, serie) " + "VALUES ('"+Text100$+"', '"+GetGadgetText(4500)+"', '', '"+GetGadgetText(4500)+"')"
  
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
             If DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(4500)+"'")
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
    
     Procedure punchhist()
      OpenGadgetList(1, 5)
      
      TextGadget(#_p50, 0, 160, 420, 20, "Punch par Job",  #PB_Text_Border | #PB_Text_Center)
      
      
             If DatabaseQuery (#mysql, "SELECT * FROM punch WHERE jobname='"+GetGadgetText(#_z0)+"'")
             
               
              ListIconGadget(#_p51, 0, 180, 420, 245, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
          
             AddGadgetColumn(#_p51, 1, "jobname", 120)
             AddGadgetColumn(#_p51, 2, "Punch in", 120)
             AddGadgetColumn(#_p51, 3, "Punch out", 120)
 
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_p51, -1, GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4))
      
      
      
      
      
               Wend  
               EndIf
               FinishDatabaseQuery(#mysql)
               
             
            
               
               
          
 
   FinishDatabaseQuery(#mysql)
    
      CloseGadgetList()
    EndProcedure
   
    Procedure punch()
      OpenGadgetList(1, 4)
      
      TextGadget(6030, 200, 130, 320, 20, "Punch par travaux",  #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(6030, #PB_Gadget_BackColor, $A7E3EF)
      
              DatabaseQuery(#mysql, "SELECT * FROM job WHERE (jobname) = ('"+GetGadgetText(#_w4)+"')")
             
               
              ListIconGadget(#_punch, 200, 150, 320, 150, "name", 65, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
              SetGadgetColor(#_punch, #PB_Gadget_BackColor, $00FFFF)

             AddGadgetColumn(#_punch, 1, "jobname", 65)
             AddGadgetColumn(#_punch, 2, "Punch in", 100)
             AddGadgetColumn(#_punch, 3, "Punch out", 100)
  
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_punch, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6))
      
      
      
      
      
    Wend 
    
               
        FinishDatabaseQuery(#mysql)       
             
              
             
            ButtonGadget(#_2001, 200, 40, 320, 40,"Punch IN")
            ButtonGadget(#_2002, 200, 80, 320, 40,"Punch OUT")
               
               
          
 
   FinishDatabaseQuery(#mysql)
    
      CloseGadgetList()
    EndProcedure
  
   
  
Procedure mainwo()
  OpenGadgetList(1, 4)
  
  TextGadget(402, 0, 0, 200, 20," Liste Bon de travail", #PB_Text_Border | #PB_Text_Center)
  SetGadgetColor(402, #PB_Gadget_BackColor, $A7E3EF)
   ListViewGadget(#_WO1202, 0, 20, 200, 100) 
    SetGadgetColor(#_WO1202, #PB_Gadget_BackColor, $F3C8F3)
 If  DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE status='1'")
  
    While NextDatabaseRow(#mysql)       
      AddGadgetItem(#_WO1202, -1, GetDatabaseString(#mysql, 1))
      
    Wend 
   FinishDatabaseQuery(#mysql)
   EndIf
   
   
   
  
 CloseGadgetList()

  
EndProcedure



  Procedure aWOordertHandler()
    OpenGadgetList(1, 4)
    
    Debug ("Ouverture du work order " + GetGadgetText(#_WO1202))
    
    TextGadget(6000, 200, 0, 320, 20, "** ! Ne pas oubliée ! **", #PB_Text_Border | #PB_Text_Center)
    TextGadget(6001, 200, 20, 320, 20, "Select > Utilisateur > Travaux + Punch", #PB_Text_Border | #PB_Text_Center)
    
    SetGadgetColor(6000, #PB_Gadget_BackColor, $B8F589)
   
    SetGadgetColor(6001, #PB_Gadget_BackColor, $B8F589)
    
          DatabaseQuery(#mysql, "SELECT * FROM username")
      TextGadget(#_wo1, 0, 130, 200, 20, "Liste des employés", #PB_Text_Border | #PB_Text_Center)
      SetGadgetColor(#_wo1, #PB_Gadget_BackColor, $A7E3EF)
     If  ListViewGadget(#_wo2, 0, 150, 200, 150)
       SetGadgetColor(#_wo2, #PB_Gadget_BackColor, $F3C8F3)
       
           While  NextDatabaseRow(#mysql) 
               
               IDuser1$ = GetDatabaseString(#mysql, 1)
               AddGadgetItem(#_wo2, -1, ""+IDuser1$)
             Wend  
             FinishDatabaseQuery(#mysql)
             Debug ("user list on")
           Else
             Debug ("user list not working") 
            EndIf
   
           
            

            TextGadget(#_wo3, 0, 320, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#_wo3, #PB_Gadget_BackColor, $A7E3EF)
            DatabaseQuery(#mysql, "SELECT * FROM job WHERE (wo, pstatus) = ('"+GetGadgetText(#_WO1202)+"', '0')")
      ListViewGadget(#_w4, 0, 340, 200, 120)
             SetGadgetColor(#_w4, #PB_Gadget_BackColor, $F3C8F3)
           While  NextDatabaseRow(#mysql) 
               
               JOB1$ = GetDatabaseString(#mysql, 2)
               AddGadgetItem(#_w4, -1, JOB1$)
                 Wend  
                 FinishDatabaseQuery(#mysql)
                 ButtonGadget(#_wo14, 0, 460, 200, 30, "Nouveau travaux")

                 TextGadget(#_wo5, 0, 500, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
                 SetGadgetColor(#_wo5, #PB_Gadget_BackColor, $A7E3EF)
       
       
       DatabaseQuery (#mysql, "SELECT * FROM note WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
       ListViewGadget(#_wo6, 0, 520, 200, 80)
           SetGadgetColor(#_wo6, #PB_Gadget_BackColor, $F3C8F3)
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_wo6, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend       
                 FinishDatabaseQuery(#mysql)
                 
       ButtonGadget(#_wo7, 0, 600, 200, 20, "Sauvegarder note")
       ButtonGadget(#_wo8, 0, 620, 200, 20, "Supprimer note")
       ButtonGadget(#_wo9, 0, 640, 200, 20,"Nouvelle note")
       
       
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
       
       
       
       ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
       TextGadget(#PB_wo5, 530, 0, 185, 20, "bon travail", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo5, #PB_Gadget_BackColor, $A7E3EF)
       TextGadget(6052, 530, 20, 185, 20, GetGadgetText(#_WO1202), #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(6052, #PB_Gadget_BackColor, $F3C8F3)
            
       
       
   
        TextGadget(6050, 715, 0, 185, 20, "# série", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(6050, #PB_Gadget_BackColor, $A7E3EF)
      DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo='"+GetGadgetText(#_WO1202)+"'")
        NextDatabaseRow(#mysql)
       dataserie.w = TextGadget(6054, 715, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6054, #PB_Gadget_BackColor, $F3C8F3)   
             FinishDatabaseQuery(#mysql)
       
       
       
       
          
        TextGadget(#PB_wo7, 900, 0, 185, 20, "Année", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo7, #PB_Gadget_BackColor, $A7E3EF)
        DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
       TextGadget(6055, 900, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(2500, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
         
         ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
         TextGadget(#PB_wo8, 1085, 0, 185, 20, "Unitée", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo8, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(#PB_ll1, 1085, 20, 185, 20, GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(#PB_ll1, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
             
              TextGadget(#PB_wo9, 530, 40, 185, 20, "Make", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo9, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6056, 530, 60, 185, 20, GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6056, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
         
         
          TextGadget(#PB_w10, 715, 40, 185, 20, "Model", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w10, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
       TextGadget(6057, 715, 60, 185, 20, GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6057, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql) 
           
           
           
           TextGadget(#PB_w11, 900, 40, 185, 20, "KM", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w11, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
       TextGadget(6058, 900, 60, 185, 20, GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6058, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w12, 1085, 40, 185, 20, "HRS", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w12, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6059, 1085, 60, 185, 20, GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6059, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
         TextGadget(#PB_w13, 530, 80, 185, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w13, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6060, 530, 100, 185, 20, GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6060, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
            TextGadget(#PB_w14, 715, 80, 185, 20, "Prochaine maintenance", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w14, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6061, 715, 100, 185, 20, GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6061, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w15, 900, 80, 185, 20, "Prochaine Insp.", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w15, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6062, 900, 100, 185, 20, GetDatabaseString(#mysql, 11))
       ;    SetGadgetColor(6062, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w16, 1085, 80, 185, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w16, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
      TextGadget(6063, 1085, 100, 185, 20, GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6063, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
            TextGadget(#PB_w17, 530, 120, 185, 20, "Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w17, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
       TextGadget(6064, 530, 140, 185, 20, GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6064, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w18, 715, 120, 185, 20, "Liscence", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w18, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
       TextGadget(6065, 715, 140, 185, 20, GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6065, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w19, 900, 120, 370, 20, "Noms entreprise", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w19, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        NextDatabaseRow(#mysql) 
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
        
          
          
           TextGadget(6068, 530, 220, 750, 20, "Feuillet inventaire des pièces",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6068, #PB_Gadget_BackColor, $A7E3EF)
      
      
              DatabaseQuery (#mysql, "SELECT * FROM invwo WHERE wo='"+GetGadgetText(6052)+"' ORDER BY id ASC")
             
               
               ListIconGadget(#PB_w26, 530, 240, 1280, 280, "Quantitée", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w26, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#PB_w26, 1, "# Pièce", 120)
             AddGadgetColumn(#PB_w26, 2, "Description", 610)
            
         
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w26, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3))
              Wend  
                FinishDatabaseQuery(#mysql)
           
           TextGadget(6069, 530, 520, 750, 20, "Modification table inventaire des pièces", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6069, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#PB_w27, 530, 540, 100, 30, "Quantitée")
          ButtonGadget(#PB_w28, 630, 540, 100, 30, "# Pièces")
          ButtonGadget(#PB_w29, 730, 540, 100, 30, "Descriptiion")
          ButtonGadget(#PB_w30, 830, 540, 200, 30, "Ajouter une pièce")
          ButtonGadget(#PB_w31, 1030, 540, 240, 30, "Suprrimer une pièce")
           
                
                
                
          ButtonGadget(#PB_w25, 530, 620, 740, 40, "Fermeture Bon de travail")
           
          CloseGadgetList()
          
;While WindowEvent() : Wend

     EndProcedure
     
     
     
  Procedure main()
    
 
   
#FenetrePrincipale = 0

  If OpenWindow(#FenetrePrincipale, 0, 0, 1280, 720, "GF-Logia",  #PB_Window_ScreenCentered)
    
    AddWindowTimer(0, 250,10000)
    
  
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
       
       
       ;///Inventory datatable refresh/////////////////////////////////////////////////////////////////////////////
       
       OpenGadgetList(1, 0)
       If  DatabaseQuery (#mysql, "SELECT * FROM inventaire ORDER BY id ASC")
             
               
               ListIconGadget(#_inv2, 0, 20, 1280, 340, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_inv2, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#_inv2, 1, "# no piece", 120)
             AddGadgetColumn(#_inv2, 2, "Description", 120)
             AddGadgetColumn(#_inv2, 3, "Quantité", 120)
             AddGadgetColumn(#_inv2, 4, "Quantité à stoké", 120)
             AddGadgetColumn(#_inv2, 5, "Prix achat #1", 60)
             AddGadgetColumn(#_inv2, 6, "Fournisseur #1", 120)
             AddGadgetColumn(#_inv2, 7, "Prix achat #2", 120)
             AddGadgetColumn(#_inv2, 8, "Fournisseur #2", 200)
             AddGadgetColumn(#_inv2, 9, "Prix vente", 120)
             AddGadgetColumn(#_inv2, 10, "# Location", 120)
         
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_inv2, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10))
      
              Wend  
              FinishDatabaseQuery(#mysql)   
            EndIf  
              CloseGadgetList()
              
              ;//////Flotte datatable refresh///////////////////////////////////////////////////////////////////////
       
       OpenGadgetList(1, 3)
       If DatabaseQuery (#mysql, "SELECT * FROM flotte ORDER BY serie ASC")
             
               
              
              

               ListIconGadget(#_a0fl, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
               SetGadgetColor(#_a0fl, #PB_Gadget_BackColor, $00FFFF)
               AddGadgetColumn(#_a0fl, 1, "# Série", 120)
               AddGadgetColumn(#_a0fl, 2, "Noms Entreprise", 120)
              AddGadgetColumn(#_a0fl, 3, "# unité", 120)
              AddGadgetColumn(#_a0fl, 4, "Année vehicule", 60)
              AddGadgetColumn(#_a0fl, 5, "Marque vehicule", 120)
              AddGadgetColumn(#_a0fl, 6, "Model vehicule", 120)
              AddGadgetColumn(#_a0fl, 7, "kilometrage", 120)
              AddGadgetColumn(#_a0fl, 8, "heure", 120)
              AddGadgetColumn(#_a0fl, 9, "Date derniere maintenance", 120)
              AddGadgetColumn(#_a0fl, 10, "Mot de passe 'ECM'", 120)
              AddGadgetColumn(#_a0fl, 11, "Imatriculation", 120)
              AddGadgetColumn(#_a0fl, 12, "Fin garantie", 120)
              AddGadgetColumn(#_a0fl, 13, "prochaine inspection pep ou saaq", 120)
              AddGadgetColumn(#_a0fl, 14, "prochaine maintenance", 120)
          
   
               While NextDatabaseRow(#mysql)
     
       AddGadgetItem(#_a0fl, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12))

     Wend  
     FinishDatabaseQuery(#mysql)
   EndIf
   CloseGadgetList()
    
   
   ;//Client datatable refresh ///////////////////////////////////////////////////////////////////////////////////////
   OpenGadgetList(1, 2)
   
     If DatabaseQuery (#mysql, "SELECT * FROM client ORDER BY nomsent ASC")
             
    
                       
         ListIconGadget(#_BCC20, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
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
             
           
              
            
    While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_BCC20, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18)+Chr(10)+GetDatabaseString(#mysql, 19)+Chr(10)+GetDatabaseString(#mysql, 20)+Chr(10)+GetDatabaseString(#mysql, 21)+Chr(10)+GetDatabaseString(#mysql, 22)+Chr(10)+GetDatabaseString(#mysql, 23))
      
     
    Wend  
    FinishDatabaseQuery(#mysql)
  EndIf
              
  
  CloseGadgetList()
  
  ;///////empolyer datatable refresh ////////////////////////////////////////////////////////////////////
   
    OpenGadgetList(1, 1)
  
  
    If DatabaseQuery (#mysql, "SELECT * FROM username ORDER BY username ASC")
             
               
               ListIconGadget(#_020, 0, 20, 1280, 380, "# ID", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#_020, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#_020, 1, "Username", 120)
             AddGadgetColumn(#_020, 2, "Nom", 120)
             AddGadgetColumn(#_020, 3, "Prenom", 120)
             AddGadgetColumn(#_020, 4, "Age", 60)
             AddGadgetColumn(#_020, 5, "# Téléphone", 120)
             AddGadgetColumn(#_020, 6, "# Cell", 120)
             AddGadgetColumn(#_020, 7, "Addresse", 120)
             AddGadgetColumn(#_020, 8, "# Permis Conduire", 120)
             AddGadgetColumn(#_020, 9, "# Liscence Méca", 120)
             AddGadgetColumn(#_020, 10, "# Liscence P.E.P", 120)
             AddGadgetColumn(#_020, 11, "# Liscence S.A.A.Q", 120)
             AddGadgetColumn(#_020, 12, "Date Naissance", 120)
             AddGadgetColumn(#_020, 13, "Date Embauche", 120)
             AddGadgetColumn(#_020, 14, "Ville", 120)
             AddGadgetColumn(#_020, 15, "Province", 120)
             AddGadgetColumn(#_020, 16, "Pays", 120)
             AddGadgetColumn(#_020, 17, "Code Postal", 120)
             AddGadgetColumn(#_020, 18, "E-mail Personel", 120)
             AddGadgetColumn(#_020, 19, "E-mail Job", 120)
             
  
              
            
            
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#_020, -1, GetDatabaseString(#mysql, 0)+Chr(10)+GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3)+Chr(10)+GetDatabaseString(#mysql, 4)+Chr(10)+GetDatabaseString(#mysql, 5)+Chr(10)+GetDatabaseString(#mysql, 6)+Chr(10)+GetDatabaseString(#mysql, 7)+Chr(10)+GetDatabaseString(#mysql, 8)+Chr(10)+GetDatabaseString(#mysql, 9)+Chr(10)+GetDatabaseString(#mysql, 10)+Chr(10)+GetDatabaseString(#mysql, 11)+Chr(10)+GetDatabaseString(#mysql, 12)+Chr(10)+GetDatabaseString(#mysql, 13)+Chr(10)+GetDatabaseString(#mysql, 14)+Chr(10)+GetDatabaseString(#mysql, 15)+Chr(10)+GetDatabaseString(#mysql, 16)+Chr(10)+GetDatabaseString(#mysql, 17)+Chr(10)+GetDatabaseString(#mysql, 18)+Chr(10)+GetDatabaseString(#mysql, 19))
      
      
      
      
      
    Wend  
    FinishDatabaseQuery(#mysql)
               EndIf
  
  CloseGadgetList()
  
  
  
  
  
  
  
  
  
  ;// A faire plus tard
  
     compta()
     agenda()
     histwo()
     facturation()
     boite()
    
       
  
  EndIf ;// End Case event timer
        
          
  





          
          

        
             
     
      
     
     
     Select Event
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
          
  
  
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
           
            DatabaseQuery (#mysql, "SELECT * FROM note WHERE notename='"+GetGadgetText(#_wo6)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       NextDatabaseRow(#mysql) 
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
   AddGadgetItem(#_wo13, -1, GetDatabaseString(#mysql, 3))
   FinishDatabaseQuery(#mysql)
  CloseGadgetList()
 
 
  Case #PB_fh2 :
    
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
        
   
     DatabaseQuery (#mysql, "SELECT * FROM job")
   query67.s = "INSERT INTO job (jobname, jobinfo, wo, pstatus) VALUES ('"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(#_WO1202)+"', '0')"
   
  ; update the database with the literal prepared query and confirm the write
  DatabaseQuery(#mysql, query67)
    
    Debug "data successfully inserted."

 
  FinishDatabaseQuery(#mysql)
  aWOordertHandler()
  CloseGadgetList()

        
       
       Case #_2002 :;punchout
          
         
         
          OpenGadgetList(1, 4)
       
   
    Debug "editor window saved"
    
    
   
     
               
       query3$ = InputRequester("rapport job : "+GetGadgetText(#_w4), " Veuillez écrire le nouveau rapport", "")
      ; query2.s = "UPDATE job SET (jobrepport)  VALUES ('"+query3+"') WHERE (wo, username, jobname) = ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_wo2)+"', '"+GetGadgetText(#_wo4)+"')"
     ;  query2.s = "INSERT INTO job (wo, username, jobname, jobinfo, jobrepport ) VALUES ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_wo2)+"', '"+GetGadgetText(#_wo4)+"', '"+GetGadgetText(1206)+"', '"+GetGadgetText(#_wo2)+" : "+query3$+"')"
          
  ; update the database with the literal prepared query and confirm the write
     
      ; DatabaseUpdate(#mysql, query2)
    
   

 ; FinishDatabaseQuery(#mysql)
  
; 



         
       
         
         
         

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
                  query12.s = "UPDATE job SET jobrepport = '"+query3$+"', punchout = '"+time+"', pstatus = '2' WHERE (jobname, wo, pstatus) = ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_WO1202)+"', '1')"
         ;  query12.s = "UPDATE job SET (jobrepport, punchout) VALUES ('"+query3$+"', '"+time+"') WHERE (jobname, wo) = ('"+GetGadgetText(#_wo4)+"', '"+GetGadgetText(#_WO1202)+"')"
  
  ; update the database With the literal prepared query And confirm the write
  If DatabaseUpdate(#mysql, query12)
    MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)
    Debug "punch out "+time+" successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  punch()
  aWOordertHandler()
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
    
       
     
           query11.s = "INSERT INTO job (wo, username, punchin, jobname, pstatus) VALUES ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_wo2)+"', '"+time+"', '"+GetGadgetText(#_w4)+"', '1')"
          
  ; update the database With the literal prepared query And confirm the write
                  
            
           If DatabaseUpdate(#mysql, query11)
    
    Debug "punch out "+time+" successfully inserted."

  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  aWOordertHandler()
  punch()
  
  CloseGadgetList()

       
        
        
       
    
     
        
     

        
        
        
        
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
 Case  #inv_del : ; DEL inventaire
          OpenGadgetList(1, 0)
                         querydelinv.s = "DELETE FROM inventaire WHERE id='"+GetGadgetText(#_inv2)+"'"
  
                         DatabaseUpdate(#mysql, querydelinv) 
                           FinishDatabaseQuery(#mysql)
                        inventaire()
                         
                 CloseGadgetList()
               






        Case  852 : ; DEL employer
          OpenGadgetList(1, 1)
                         querydelemployer.s = "DELETE FROM username WHERE id='"+GetGadgetText(#_020)+"'"
  
                         DatabaseUpdate(#mysql, querydelemployer) 
                           FinishDatabaseQuery(#mysql)
                         employer()
                         
                 CloseGadgetList()
             
               
               
               Case  #_BCC8521 : ;DEL client
          OpenGadgetList(1, 2)
                         querydelclient2.s = "DELETE FROM client WHERE id='"+GetGadgetText(#_BCC20)+"'"
  
                         DatabaseUpdate(#mysql, querydelclient2) 
                           FinishDatabaseQuery(#mysql)
                        Client()
                         
                 CloseGadgetList()
               
               
               
                Case  #PB_fc  : ;DEL flotte
          OpenGadgetList(1, 3)
                         querydelflotte.s = "DELETE FROM flotte WHERE id='"+GetGadgetText(#_a0fl)+"'"
  
                         DatabaseUpdate(#mysql, querydelflotte) 
                           FinishDatabaseQuery(#mysql)
                        Flotte()
                         
                 CloseGadgetList()
               
               
               
               
               
        Case  #inv_add : ;Ajout inventaire      
            OpenGadgetList(1, 0)
          Textinv100$ = InputRequester("ajoutez une piece", "Veuillez entrer le nouveau # piece.", "")
        Textinv101$ = InputRequester("ajoutez une piece", "Veuillez entrer la nouvelle description.", "")
        Textinv102$ = InputRequester("ajoutez une piece", "Veuillez entrer la quantité.", "")
  
             queryinv.s = "INSERT INTO inventaire (nopiece, description, quantiter) " + "VALUES ('"+Textinv100$+"', '"+Textinv101$+"', '"+Textinv102$+"')"
  
  
             DatabaseUpdate(#mysql, queryinv)
             FinishDatabaseQuery(#mysql)
         inventaire()
       CloseGadgetList()
          
               

       Case  850 : ;  add employer
          OpenGadgetList(1, 1)
          Textemployer100$ = InputRequester("ajoutez un employer", "Veuillez entrer le username du nouveau", "")
        Textemployer101$ = InputRequester("ajoutez un employer", "Veuillez entrer le Nom propre du nouveau", "")
        Textemployer102$ = InputRequester("ajoutez un employer", "Veuillez entrer le Prenom du nouveau", "")
  
             queryemployer.s = "INSERT INTO username (username, nom, prenom) " + "VALUES ('"+Textemployer100$+"', '"+Textemployer101$+"', '"+Textemployer102$+"')"
  
  
             DatabaseUpdate(#mysql, queryemployer)
             FinishDatabaseQuery(#mysql)
         employer()
       CloseGadgetList()
       
        
        Case  #_BCC8501 : ;add client
          OpenGadgetList(1, 2)
        
        wocli1$ = InputRequester("ajoutez un client", "Veuillez entrer le nom de l'entreprise.", "")
        wocli2$ = InputRequester("ajoutez un client", "Veuillez entrer le nom du responsable.", "")
        wocli3$ = InputRequester("ajoutez un client", "Veuillez entrer le email du propriétaire", "")
        wocli4$ = InputRequester("ajoutez un client", "Veuillez entrer le email du responsable", "")
        wocli5$ = InputRequester("ajoutez un client", "Veuillez entrer le # Fax du responsable", "")
        wocli6$ = InputRequester("ajoutez un client", "Veuillez entrer le # Fax de l'entreprise", "")
        wocli7$ = InputRequester("ajoutez un client", "Veuillez entrer le prenoms du propriétaire.", "")
        wocli8$ = InputRequester("ajoutez un client", "Veuillez entrer le noms du propriétaire.", "")
        wocli9$ = InputRequester("ajoutez un client", "Veuillez entrer le # cellulaire du propriétaire", "")
        cli_10$ = InputRequester("ajoutez un client", "Veuillez entrer le # cellulaire du responsable", "")
        cli_11$ = InputRequester("ajoutez un client", "Veuillez entrer le # téléphone propriétaire", "")
        cli_12$ = InputRequester("ajoutez un client", "Veuillez entrer le # téléphone du responsable", "")
        cli_13$ = InputRequester("ajoutez un client", "Veuillez entrer la date de création du client", "")
        cli_14$ = InputRequester("ajoutez un client", "Veuillez entrer l'addresse de l'entreprise", "")
        cli_15$ = InputRequester("ajoutez un client", "Veuillez entrer la ville de l'entreprise", "")
        cli_16$ = InputRequester("ajoutez un client", "Veuillez entrer la province de l'entreprise", "")
        cli_17$ = InputRequester("ajoutez un client", "Veuillez entrer le pays de l'entreprise", "")
        cli_18$ = InputRequester("ajoutez un client", "Veuillez entrer le Code Postal de l'entreprise", "")
        cli_19$ = InputRequester("ajoutez un client", "Veuillez entrer l'addresse du propriétaire", "")
        i_20$ = InputRequester("ajoutez un client", "Veuillez entrer la ville du propriétaire", "")
        i_21$ = InputRequester("ajoutez un client", "Veuillez entrer la province du propriétaire", "")
        i_22$ = InputRequester("ajoutez un client", "Veuillez entrer le pays du propriétaire", "")
        i_23$ = InputRequester("ajoutez un client", "Veuillez entrer le Code Postal du propriétaire", "")
        i_24$ = InputRequester("ajoutez un client", "Veuillez entrer le Taux horraire du client", "")
       
   
        
           qq.s = "INSERT INTO client (nomsent, nomres, emailp, emailres, faxres, faxent, _prenoms, _noms, cellp, cellresp, telent, telresp, datesc, addent, villeent, provent, paysent, zipent, addp, villep, provp, paysp, zipp, tauxhc) VALUES('"+wocli1$+"', '"+wocli2$+"', '"+wocli3$+"', '"+wocli4$+"', '"+wocli5$+"', '"+wocli6$+"', '"+wocli7$+"', '"+wocli8$+"', '"+wocli9$+"', '"+cli_10$+"', '"+cli_11$+"', '"+cli_12$+"', '"+cli_13$+"', '"+cli_14$+"', '"+cli_15$+"', '"+cli_16$+"', '"+cli_17$+"', '"+cli_18$+"', '"+cli_19$+"', '"+i_20$+"', '"+i_21$+"', '"+i_22$+"', '"+i_23$+"', '"+i_24$+"')" 
          
           
           DatabaseUpdate(#mysql, qq)
           
              FinishDatabaseQuery(#mysql)
             
              Client()
              Flotte()
       CloseGadgetList()
        
        
        
        
  Case  #PB_fb : ; add flotte vehicule
    
    OpenGadgetList(1, 3)
        
        cli1$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le # serie du vehicule.", "")
        cli2$ = InputRequester("ajoutez un vehicule", "Veuillez entrer l'année du vehicule.", "")
        cli3$ = InputRequester("ajoutez un vehicule", "Veuillez entrer la marque du vehicule.", "")
        cli4$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le model du vehicule.", "")
        cli5$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le kilometrage du vehicule.", "")
        cli6$ = InputRequester("ajoutez un vehicule", "Veuillez entrer les heures du vehicule.", "")
        cli7$ = InputRequester("ajoutez un vehicule", "Veuillez entrer la date de la derniere maintenance du vehicule.", "")
        cli8$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le nouveau mot de passe ecm du vehicule.", "")
        cli9$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le nouveau # liscense du vehicule.", "")
        cli10$ = InputRequester("ajoutez un vehicule", "Veuillez entrer la date fin garantie du vehicule.", "")
        cli11$ = InputRequester("ajoutez un vehicule", "Veuillez entrer la date prochaine inspection pep ou saaq du vehicule.", "")
        cli12$ = InputRequester("ajoutez un vehicule", "Veuillez entrer la date prochaine maintenance du vehicule.", "")
        
        cli14$ = InputRequester("ajoutez un vehicule", "Veuillez entrer le nouveau # unité du vehicule.", "")
        
   
        
          kk.s = "INSERT INTO flotte (serie, annee, make, model, km, hrs, date, ecm, imatri, fing, nexinspq, nexmai, noment, unit) VALUES('"+cli1$+"', '"+cli2$+"', '"+cli3$+"', '"+cli4$+"', '"+cli5$+"', '"+cli6$+"', '"+cli7$+"', '"+cli8$+"', '"+cli9$+"', '"+cli10$+"', '"+cli11$+"', '"+cli12$+"', '"+GetGadgetText(#PB_fe)+"', '"+cli14$+"')" 
         
           
           DatabaseUpdate(#mysql, kk)
           
             FinishDatabaseQuery(#mysql)
             
        Flotte()
       CloseGadgetList()
    
    
    
    
    
 
    
    
    
    
       Case  #_z0 : ;joblist historique
          
            OpenGadgetList(1, 5)
    
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE wo='"+GetGadgetText(#_F002)+"'")
      
     
     TextGadget(#_pb04, 680, 490, 600, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     
    ListViewGadget(#_pb06, 680, 510, 600, 65)
   
        
        NextDatabaseRow(#mysql)       
        AddGadgetItem(#_pb06, -1, "" + GetDatabaseString(#mysql, 3))
       
   
     FinishDatabaseQuery(#mysql)
     
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE jobname='"+GetGadgetText(#_z0)+"'")
      
      
 
    EditorGadget(#_pb12, 680, 575, 600, 85) 
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(#_pb12, -1, "" + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   
   

     punchhist()
    CloseGadgetList()
  
          
        
          
          
  Case  #_w4 : ;joblist
             OpenGadgetList(1, 4)
    
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
      
     
     TextGadget(1204, 200, 320, 320, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     SetGadgetColor(1204, #PB_Gadget_BackColor, $A7E3EF)
    ListViewGadget(1206, 200, 340, 320, 65)
   SetGadgetColor(1206, #PB_Gadget_BackColor, $9280EE)
        
        NextDatabaseRow(#mysql)       
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
       
   
     FinishDatabaseQuery(#mysql)
     
     
      DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname) = ('"+GetGadgetText(#_w4)+"')")
      
      
 
      EditorGadget(1207, 200, 405, 320, 85) 
      SetGadgetColor(1207, #PB_Gadget_BackColor, $F3D2A8)
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, ""+GetDatabaseString(#mysql, 1)+" : " + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   
   
punch()
    
    CloseGadgetList()
   

 
 ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 ;////////////////////////////////////////
 ;// Table des employer ici bas  /////////
 ;////////////////////////////////////////
 
 Case #BG_0 :
    OpenGadgetList(1, 1)
   texteuser0.s = InputRequester("Modification du username de l'employé.", "Veuillez entrer le nouveau username.", "")
   queryuser0.s = "UPDATE username SET username='"+texteuser0+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser0)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()

 
Case  #BG_1 :
  OpenGadgetList(1, 1)
   texteuser1.s = InputRequester("Modification du nom de l'employé.", "Veuillez entrer le nouveau nom propre.", "")
   queryuser1.s = "UPDATE username SET nom='"+texteuser1+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser1)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()

 
Case  #BG_2 :
  OpenGadgetList(1, 1)
   texteuser2.s = InputRequester("Modification du prenom de l'employé.", "Veuillez entrer le nouveau prenom.", "")
   queryuser2.s = "UPDATE username SET prenom='"+texteuser2+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser2)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
  
  
 Case  #BG_3 :
    OpenGadgetList(1, 1)
   texteuser3.s = InputRequester("Modification de age de l'employé.", "Veuillez entrer la nouvelle age.", "")
   queryuser3.s = "UPDATE username SET age='"+texteuser3+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser3)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
 
 
 Case  #BG_4 :
   OpenGadgetList(1, 1)
     texteuser4.s = InputRequester("Modification du # téléphone de l'employé.", "Veuillez entrer le nouveau # téléphone.", "")
   queryuser4.s = "UPDATE username SET tel='"+texteuser4+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser4)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
 
 
 Case #BG_5 :
   OpenGadgetList(1, 1)
   texteuser5.s = InputRequester("Modification du # cellulaire de l'employé.", "Veuillez entrer le nouveau # cellulaire.", "")
   queryuser5.s = "UPDATE username SET cell='"+texteuser5+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser5)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()

 
Case #BG_6 :
   OpenGadgetList(1, 1)
   pbuser6.s = InputRequester("Modification de l'addresse de l'employé.", "Veuillez entrer la nouvelle addresse.", "")
   pbuserqury.s = "UPDATE username SET add='"+pbuser6+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, pbuserqury)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()

 
 Case #BG_7 :
   OpenGadgetList(1, 1)
   texteuser7.s = InputRequester("Modification du # permis conduire de l'employé.", "Veuillez entrer le nouveau # permis.", "")
   queryuser7.s = "UPDATE username SET permis='"+texteuser7+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser7)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
       
       
      Case #BG_8 :
         OpenGadgetList(1, 1)
   texteuser8.s = InputRequester("Modification de la liscence de mécanique de l'employé.", "Veuillez entrer le nouveau # liscence.", "")
   queryuser8.s = "UPDATE username SET liscence='"+texteuser8+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser8)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
       
        
        Case #BG_9 :
          OpenGadgetList(1, 1)
   texteuser9.s = InputRequester("Modification du # p.e.p de l'employé.", "Veuillez entrer le nouveau # p.e.p.", "")
   queryuser9.s = "UPDATE username SET pep='"+texteuser9+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser9)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
        
         
        Case #BG_10 :
           OpenGadgetList(1, 1)
   texteuser10.s = InputRequester("Modification du # liscence inspection SAAQ de l'employé.", "Veuillez entrer le nouveau # liscence.", "")
   queryuser10.s = "UPDATE username SET saaq='"+texteuser10+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser10)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
         
          
          Case #BG_11 :
            OpenGadgetList(1, 1)
   texteuser11.s = InputRequester("Modification de la date de naissance de l'employé.", "Veuillez entrer la nouvelle date de naissance.", "")
   queryuser11.s = "UPDATE username SET date='"+texteuser11+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser11)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
        
           
           Case #BG_12 :
             OpenGadgetList(1, 1)
   texteuser12.s = InputRequester("Modification de la date embauche de l'employé.", "Veuillez entrer la nouvelle date", "")
   queryuser12.s = "UPDATE username SET embauche='"+texteuser12+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser12)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
         
            
            Case #BG_13 :
              OpenGadgetList(1, 1)
   texteuser13.s = InputRequester("Modification du nom de ville de l'employé.", "Veuillez entrer le nom de la nouvelle ville.", "")
   queryuser13.s = "UPDATE username SET city='"+texteuser13+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser13)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
   
   
             Case #BG_14 :
               OpenGadgetList(1, 1)
   texteuser14.s = InputRequester("Modification de la province de l'employé.", "Veuillez entrer la nouvelle province", "")
   queryuser14.s = "UPDATE username SET province='"+texteuser14+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser14)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
             
              
             Case #BG_15 :
                OpenGadgetList(1, 1)
   texteuser15.s = InputRequester("Modification du pays de l'employé.", "Veuillez entrer le nouveau pays.", "")
   queryuser15.s = "UPDATE username SET pays='"+texteuser15+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser15)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
               
               
               Case #BG_16 :
                 OpenGadgetList(1, 1)
   texteuser16.s = InputRequester("Modification du Code Postal de l'employé.", "Veuillez entrer le nouveau Code Postal.", "")
   queryuser16.s = "UPDATE username SET zip='"+texteuser16+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser16)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
                
                
                Case #BG_17 :
                  OpenGadgetList(1, 1)
   texteuser17.s = InputRequester("Modification du email personel de l'employé.", "Veuillez entrer le nouveau e-mail.", "")
   queryuser17.s = "UPDATE username SET email1='"+texteuser17+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser17)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
                 
                 
                 Case #BG_18 :
                   OpenGadgetList(1, 1)
   texteuser18.s = InputRequester("Modification du e-mail job de l'employé.", "Veuillez entrer le nouveau e-mail.", "")
   queryuser18.s = "UPDATE username SET email2='"+texteuser18+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser18)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
  
 
   Case #BG_19 :
                   OpenGadgetList(1, 1)
   texteuser19.s = InputRequester("Modification du taux horraire.", "Veuillez entrer le nouveau taux horraire de l'employer.", "")
   queryuser19.s = "UPDATE username SET tauxhr='"+texteuser19+"' WHERE id='"+GetGadgetText(#_020)+"'"
   DatabaseUpdate(#mysql, queryuser19)
   FinishDatabaseQuery(#mysql)
   employer()
   CloseGadgetList()
 
 EndSelect
 ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 ;////////////////////////////////////////
 ;// Table des Client ici bas  /////////
 ;////////////////////////////////////////  
 
 
 If EventGadget = #BC_024
   OpenGadgetList(1, 2)
   texteclient0.s = InputRequester("Modification du nom de l'entreprise.", "Veuillez entrer le nouveau nom de l'entreprise.", "")
   queryclient0.s = "UPDATE client SET nomsent='"+texteclient0+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient0)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
EndIf
 
  If EventGadget = #BC_24
    OpenGadgetList(1, 2)
   texteclient3.s = InputRequester("Modification du nom du responsable.", "Veuillez entrer le nom du responsable.", "")
   queryclient3.s = "UPDATE client SET nomres='"+texteclient3+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient3)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_2
   OpenGadgetList(1, 2)
     texteclient4.s = InputRequester("Modification du email du propriétaire.", "Veuillez entrer le nouveau email du propriétaire.", "")
   queryclient4.s = "UPDATE client SET emailp='"+texteclient4+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient4)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_3
   OpenGadgetList(1, 2)
   texteclient5.s = InputRequester("Modification du email du responsable.", "Veuillez entrer le nouveau email du responsable.", "")
   queryclient5.s = "UPDATE client SET emailres='"+texteclient5+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient5)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_4
   OpenGadgetList(1, 2)
   client6.s = InputRequester("Modification du nouveau # FAX du responsable.", "Veuillez entrer le nouveau # FAX du responsable", "")
   client66.s = "UPDATE client SET faxres='"+client6+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, client66)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_5
   OpenGadgetList(1, 2)
   texteclient7.s = InputRequester("Modification du nouveau # FAX de l'entreprise.", "Veuillez entrer le nouveau # FAX de l'entreprise.", "")
   queryclient7.s = "UPDATE client SET faxent='"+texteclient7+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient7)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
       EndIf
       
       If EventGadget = #BC_66
         OpenGadgetList(1, 2)
   texteclient8.s = InputRequester("Modification du prenoms du propriétaire.", "Veuillez entrer le nouveau prenoms du propriétaire.", "")
   queryclient8.s = "UPDATE client SET prenoms='"+texteclient8+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient8)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
        EndIf
        
        If EventGadget = #BC_7
          OpenGadgetList(1, 2)
   texteclient9.s = InputRequester("Modification du noms propre du propriétaire.", "Veuillez entrer le nouveau noms propre du propriétaire", "")
   queryclient9.s = "UPDATE client SET noms='"+texteclient9+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient9)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
         EndIf
         
         If EventGadget = #BC_8
           OpenGadgetList(1, 2)
   texteclient10.s = InputRequester("Modification du nouveau # cellulaire du propriétaire.", "Veuillez entrer le nouveau # cellulaire du propriétaire.", "")
   queryclient10.s = "UPDATE client SET cellp='"+texteclient10+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient10)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
          EndIf
          
          If EventGadget = #BC_9
            OpenGadgetList(1, 2)
   texteclient11.s = InputRequester("Modification du nouveau # cellulaire du responsable.", "Veuillez entrer le nouveau # cellulaire du responsable.", "")
   queryclient11.s = "UPDATE client SET cellresp='"+texteclient11+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient11)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
           EndIf
           
           If EventGadget = #BC_10
             OpenGadgetList(1, 2)
   texteclient12.s = InputRequester("Modification du nouveau # téléphone de l'entreprise.", "Veuillez entrer le nouveau # téléphone de l'entreprise.", "")
   queryclient12.s = "UPDATE client SET telent='"+texteclient12+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient12)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
            EndIf
            
            If EventGadget = #BC_11
              OpenGadgetList(1, 2)
   texteclient13.s = InputRequester("Modification du nouveau # téléphone du responsables.", "Veuillez entrer le nouveau # téléphone du responsable.", "")
   queryclient13.s = "UPDATE client SET telresp='"+texteclient13+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient13)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
             EndIf
             
             If EventGadget = #BC_12
               OpenGadgetList(1, 2)
   texteclient14.s = InputRequester("Modification de la date de création du client.", "Veuillez entrer la nouvelle date de création du client", "")
   queryclient14.s = "UPDATE client SET datesc='"+texteclient14+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient14)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
              EndIf
              
              If EventGadget = #BC_13
                OpenGadgetList(1, 2)
   texteclient15.s = InputRequester("Modification de la nouvelle addresse de l'entreprise.", "Veuillez entrer la nouvelle addresse de l'entreprise.", "")
   queryclient15.s = "UPDATE client SET addent='"+texteclient15+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient15)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
               EndIf
               
               If EventGadget = #BC_14
                 OpenGadgetList(1, 2)
   texteclient16.s = InputRequester("Modification de la nouvelle ville de l'entreprise.", "Veuillez entrer la nouvelle ville de l'entreprise.", "")
   queryclient16.s = "UPDATE client SET villeent='"+texteclient16+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient16)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
                EndIf
                
                If EventGadget = #BC_15
                  OpenGadgetList(1, 2)
   texteclient17.s = InputRequester("Modification de la nouvelle province de l'entreprise.", "Veuillez entrer la nouvelle province de l'entreprise.", "")
   queryclient17.s = "UPDATE client SET provent='"+texteclient17+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient17)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
                 EndIf
                 
                 If EventGadget = #BC_16
                   OpenGadgetList(1, 2)
   texteclient18.s = InputRequester("Modification du pays de l'entrprise.", "Veuillez entrer le nouveau pays de l'entrprise.", "")
   queryclient18.s = "UPDATE client SET paysent='"+texteclient18+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient18)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf 
 
 If EventGadget = #BC_17
   OpenGadgetList(1, 2)
   texteclient19.s = InputRequester("Modification du Code Postal de l'entreprise.", "Veuillez entrer le nouveau Code Postal de l'entrprise.", "")
   queryclient19.s = "UPDATE client SET zipent='"+texteclient19+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient19)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_18
   OpenGadgetList(1, 2)
   texteclient20.s = InputRequester("Modification de l'addresse du propriétaire.", "Veuillez entrer la nouvelle addresse du propriétaire.", "")
   queryclient20.s = "UPDATE client SET addp='"+texteclient20+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient20)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_19
   OpenGadgetList(1, 2)
   texteclient21.s = InputRequester("Modification de la ville du propriétaire.", "Veuillez entrer la nouvelle ville du propriétaire.", "")
   queryclient21.s = "UPDATE client SET villep='"+texteclient21+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient21)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_20
   OpenGadgetList(1, 2)
   texteclient22.s = InputRequester("Modification de la province du propriétaire.", "Veuillez entrer la nouvelle province du propriétaire.", "")
   queryclient22.s = "UPDATE client SET provp='"+texteclient22+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient22)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_21
   OpenGadgetList(1, 2)
   texteclient23.s = InputRequester("Modification du pays du propriétaire.", "Veuillez entrer le nouveau pays du propriétaire.", "")
   queryclient23.s = "UPDATE client SET paysp='"+texteclient23+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient23)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_22
   OpenGadgetList(1, 2)
   texteclient24.s = InputRequester("Modification du Code Postal du propriétaire.", "Veuillez entrer le nouveau Code Postal du propriétaire.", "")
   queryclient24.s = "UPDATE client SET zipp='"+texteclient24+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient24)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #BC_23
   OpenGadgetList(1, 2)
   texteclient25.s = InputRequester("Modification du taux horraire du client.", "Veuillez entrer le nouveau taux horraire du client.", "")
   queryclient25.s = "UPDATE client SET tauxhc='"+texteclient25+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient25)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
  EndIf
  
  
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;// Flotte           //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
 
  If EventGadget = #PB_fg0
    OpenGadgetList(1, 3)
   w0.s = InputRequester("Modification du # série.", "Veuillez entrer le nouveau # série du vehicule.", "")
   w1.s = "UPDATE flotte SET serie='"+w0+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, w1)
   
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #PB_fg2
   OpenGadgetList(1, 3)
     fg2.s = InputRequester("Modification de l'année.", "Veuillez entrer la nouvelle année du vehicule.", "")
   fg3.s = "UPDATE flotte SET annee='"+fg2+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg3)
    FinishDatabaseQuery(#mysql)
   flotte()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #PB_fg3
   OpenGadgetList(1, 3)
   fg4.s = InputRequester("Modification de la marque.", "Veuillez entrer la nouvelle marque du vehicule.", "")
   fg5.s = "UPDATE flotte SET make='"+fg4+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg5)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #PB_fg4
   OpenGadgetList(1, 3)
   fg6.s = InputRequester("Modification du nouveau model.", "Veuillez entrer le nouveau model du vehicule", "")
   fg7.s = "UPDATE flotte SET model='"+fg6+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg7)
    FinishDatabaseQuery(#mysql)
   flotte()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #PB_fg5
   OpenGadgetList(1, 3)
   fg8.s = InputRequester("Modification du killometrage.", "Veuillez entrer le nouveau kilometrage du vehicule.", "")
   fg9.s = "UPDATE flotte SET km='"+fg8+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg9)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
       EndIf
       
       If EventGadget = #PB_fg6
         OpenGadgetList(1, 3)
   fg10.s = InputRequester("Modification des heures.", "Veuillez entrer les nouvelles heures du vehicule.", "")
   fg11.s = "UPDATE flotte SET hrs='"+fg10+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg11)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
        EndIf
        
        If EventGadget = #PB_fg7
          OpenGadgetList(1, 3)
   fg12.s = InputRequester("Modification de la date de la derniere maintenance.", "Veuillez entrer la nouvelle date de la derniere maintenance du vehicule", "")
   fg13.s = "UPDATE flotte SET date='"+fg12+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg13)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
         EndIf
         
         If EventGadget = #PB_fg8
           OpenGadgetList(1, 3)
   fg14.s = InputRequester("Modification du nouveau mot de passe 'ECM'.", "Veuillez entrer le nouveau mot de passe 'ECM' du vehicule.", "")
   fg15.s = "UPDATE flotte SET ecm='"+fg14+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg15)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
          EndIf
          
          If EventGadget = #PB_fg9
            OpenGadgetList(1, 3)
   fg16.s = InputRequester("Modification du nouveau # plaque.", "Veuillez entrer le nouveau # plaque du vehicule.", "")
   fg17.s = "UPDATE flotte SET imatri='"+fg16+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg17)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
           EndIf
           
           If EventGadget = #PB_fg10
             OpenGadgetList(1, 3)
   fg18.s = InputRequester("Modification de la date de fin garantie.", "Veuillez entrer la nouvelle date de fin de garantie du vehicule", "")
   fg19.s = "UPDATE flotte SET fing='"+fg18+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg19)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
            EndIf
            
            If EventGadget = #PB_fg11
              OpenGadgetList(1, 3)
   fg20.s = InputRequester("Modification de la date de la prochaine inspection pepe ou saaq.", "Veuillez entrer la date inspection pep ou saaq du vehicule", "")
   fg21.s = "UPDATE flotte SET nexinspq='"+fg20+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg21)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
             EndIf
             
             If EventGadget = #PB_fg12
               OpenGadgetList(1, 3)
   fg22.s = InputRequester("Modification de la date de la prochaine maintenance.", "Veuillez entrer la nouvelle date de maintenance du vehicule", "")
   fg23.s = "UPDATE flotte SET nexmai='"+fg22+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg23)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
              EndIf
              
              If EventGadget = #PB_fg1
                OpenGadgetList(1, 3)
   fg24.s = InputRequester("Modification du # unité.", "Veuillez entrer le nouveau #unité du vehivule.", "")
   fg25.s = "UPDATE flotte SET unit='"+fg24+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg25)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
               EndIf
  
  
  If EventGadget = #PB_fg13
                OpenGadgetList(1, 3)
   fg26.s = InputRequester("Modification du noms entreprise.", "Veuillez entrer le nouveau noms entreprise du vehicule.", "")
   fg27.s = "UPDATE flotte SET noment='"+fg26+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg27)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
               EndIf
  
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
;               INVENTAIRE
  
  
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
               
               
               
               
               
             If EventGadget = #inv_0
    OpenGadgetList(1, 0)
   invw0.s = InputRequester("Modification du # piece.", "Veuillez entrer le nouveau # de piece.", "")
   invw1.s = "UPDATE inventaire SET nopiece='"+invw0+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invw1)
   
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #inv_1
   OpenGadgetList(1, 0)
     invfg2.s = InputRequester("Modification de la description.", "Veuillez entrer la nouvelle description.", "")
   invfg3.s = "UPDATE inventaire SET description='"+invfg2+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg3)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #inv_2
   OpenGadgetList(1, 0)
   invfg4.s = InputRequester("Modification de la quantité.", "Veuillez entrer la nouvelle quantitée.", "")
   invfg5.s = "UPDATE inventaire SET quantiter='"+invfg4+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg5)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #inv_3
   OpenGadgetList(1, 0)
   invfg6.s = InputRequester("Modification de la quantité à stocker.", "Veuillez entrer la nouvelle quantité à gardez en stock.", "")
   invfg7.s = "UPDATE inventaire SET quantiterstock='"+invfg6+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg7)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 EndIf
 
 If EventGadget = #inv_4
   OpenGadgetList(1, 0)
   invfg8.s = InputRequester("Modification du prix achat #1.", "Veuillez entrer le nouveau prix achat #1.", "")
   invfg9.s = "UPDATE inventaire SET buyprice1='"+invfg8+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg9)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
       EndIf
       
       If EventGadget = #inv_5
         OpenGadgetList(1, 0)
   invfg10.s = InputRequester("Modification du fournisseur #1", "Veuillez entrer le nouveau fournisseur #1.", "")
   invfg11.s = "UPDATE inventaire SET fourn1='"+invfg10+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg11)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
        EndIf
        
        If EventGadget = #inv_6
          OpenGadgetList(1, 0)
   invfg12.s = InputRequester("Modification du prix achat #2.", "Veuillez entrer le nouveau prix achat #2.", "")
   invfg13.s = "UPDATE inventaire SET buyprice2='"+invfg12+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg13)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
         EndIf
         
         If EventGadget = #inv_7
           OpenGadgetList(1, 0)
   invfg14.s = InputRequester("Modification du nouveau fournisseur #2.", "Veuillez entrer le nouveau fournisseur #2.", "")
   invfg15.s = "UPDATE inventaire SET fourn2='"+invfg14+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg15)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
          EndIf
          
          If EventGadget = #inv_8
            OpenGadgetList(1, 0)
   invfg16.s = InputRequester("Modification du nouveau prix vente.", "Veuillez entrer le nouveau prix vente.", "")
   invfg17.s = "UPDATE inventaire SET sellprice='"+invfg16+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg17)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
           EndIf
           
           If EventGadget = #inv_9
             OpenGadgetList(1, 0)
   invfg18.s = InputRequester("Modification du # localization.", "Veuillez entrer le nouveau # de localization.", "")
   invfg19.s = "UPDATE inventaire SET nolocation='"+invfg18+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg19)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
            EndIf  
               
               
               
               
               
               
               
               
; ///////////////////////////////////////////////////////////////////////
    EndSelect
   ForEver
 
; IDE Options = PureBasic 6.10 LTS beta 9 (Linux - x64)
; CursorPosition = 688
; FirstLine = 660
; Folding = ----
; EnableXP
; DPIAware
; UseIcon = icon.ico
; Compiler = PureBasic 6.02 LTS (Windows - x64)