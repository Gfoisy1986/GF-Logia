﻿  OpenGadgetList(1, 5)
    
    Debug ("Ouverture du work order " + GetGadgetText(#_F002))
    
   
    
   
           
            

            TextGadget(#_wo3, 0, 320, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#_wo3, #PB_Gadget_BackColor, $A7E3EF)
            DatabaseQuery(#mysql, "SELECT * FROM job WHERE (wo, pstatus) = ('"+GetGadgetText(#_F002)+"', '0')")
      ListViewGadget(#_w4, 0, 340, 200, 120)
             SetGadgetColor(#_w4, #PB_Gadget_BackColor, $F3C8F3)
           While  NextDatabaseRow(#mysql) 
               
               JOB1$ = GetDatabaseString(#mysql, 2)
               AddGadgetItem(#_w4, -1, JOB1$)
                 Wend  
                 FinishDatabaseQuery(#mysql)
                

                 TextGadget(#_wo5, 0, 500, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
                 SetGadgetColor(#_wo5, #PB_Gadget_BackColor, $A7E3EF)
       
       
       DatabaseQuery (#mysql, "SELECT * FROM note WHERE (wo) = ('"+GetGadgetText(#_F002)+"')")
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
       TextGadget(6052, 530, 20, 185, 20, GetGadgetText(#_F002), #PB_Text_Border | #PB_Text_Center)
      ; SetGadgetColor(6052, #PB_Gadget_BackColor, $F3C8F3)
            
       
       
   
        TextGadget(6050, 715, 0, 185, 20, "# série", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(6050, #PB_Gadget_BackColor, $A7E3EF)
      DatabaseQuery (#mysql, "SELECT * FROM workorder WHERE wo='"+GetGadgetText(#_F002)+"'")
        FirstDatabaseRow(#mysql)
       dataserie.w = TextGadget(6054, 715, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6054, #PB_Gadget_BackColor, $F3C8F3)   
             FinishDatabaseQuery(#mysql)
       
       
       
       
          
        TextGadget(#PB_wo7, 900, 0, 185, 20, "Année", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo7, #PB_Gadget_BackColor, $A7E3EF)
        DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql) 
       TextGadget(6055, 900, 20, 185, 20, GetDatabaseString(#mysql, 2), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(2500, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
         
         ;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         
         TextGadget(#PB_wo8, 1085, 0, 185, 20, "Unitée", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo8, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql) 
      TextGadget(#PB_ll1, 1085, 20, 185, 20, GetDatabaseString(#mysql, 14), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(#PB_ll1, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
             
              TextGadget(#PB_wo9, 530, 40, 185, 20, "Make", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_wo9, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql)  
      TextGadget(6056, 530, 60, 185, 20, GetDatabaseString(#mysql, 3), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6056, #PB_Gadget_BackColor, $F3C8F3)
         FinishDatabaseQuery(#mysql)     
             
         
         
          TextGadget(#PB_w10, 715, 40, 185, 20, "Model", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w10, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql)  
       TextGadget(6057, 715, 60, 185, 20, GetDatabaseString(#mysql, 4), #PB_Text_Border | #PB_Text_Center)
      ;     SetGadgetColor(6057, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql) 
           
           
           
           TextGadget(#PB_w11, 900, 40, 185, 20, "KM", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w11, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
     FirstDatabaseRow(#mysql) 
       TextGadget(6058, 900, 60, 185, 20, GetDatabaseString(#mysql, 5), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6058, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w12, 1085, 40, 185, 20, "HRS", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w12, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
      FirstDatabaseRow(#mysql)  
      TextGadget(6059, 1085, 60, 185, 20, GetDatabaseString(#mysql, 6), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6059, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
         TextGadget(#PB_w13, 530, 80, 185, 20, "Date", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w13, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
      FirstDatabaseRow(#mysql) 
      TextGadget(6060, 530, 100, 185, 20, GetDatabaseString(#mysql, 7), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6060, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
            TextGadget(#PB_w14, 715, 80, 185, 20, "Prochaine maintenance", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w14, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
       FirstDatabaseRow(#mysql) 
      TextGadget(6061, 715, 100, 185, 20, GetDatabaseString(#mysql, 12), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6061, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w15, 900, 80, 185, 20, "Prochaine Insp.", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w15, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
       FirstDatabaseRow(#mysql) 
      TextGadget(6062, 900, 100, 185, 20, GetDatabaseString(#mysql, 11))
       ;    SetGadgetColor(6062, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w16, 1085, 80, 185, 20, "Mot de passe 'ECM'", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w16, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql)  
      TextGadget(6063, 1085, 100, 185, 20, GetDatabaseString(#mysql, 8), #PB_Text_Border | #PB_Text_Center)
          ; SetGadgetColor(6063, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
            TextGadget(#PB_w17, 530, 120, 185, 20, "Fin Garantie", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w17, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql) 
       TextGadget(6064, 530, 140, 185, 20, GetDatabaseString(#mysql, 10), #PB_Text_Border | #PB_Text_Center)
       ;    SetGadgetColor(6064, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           TextGadget(#PB_w18, 715, 120, 185, 20, "Liscence", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w18, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
        FirstDatabaseRow(#mysql) 
       TextGadget(6065, 715, 140, 185, 20, GetDatabaseString(#mysql, 9), #PB_Text_Border | #PB_Text_Center)
        ;   SetGadgetColor(6065, #PB_Gadget_BackColor, $F3C8F3)
           FinishDatabaseQuery(#mysql)
           
           
           
           TextGadget(#PB_w19, 900, 120, 370, 20, "Noms entreprise", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#PB_w19, #PB_Gadget_BackColor, $A7E3EF)
       DatabaseQuery (#mysql, "SELECT * FROM flotte WHERE serie='"+GetGadgetText(6054)+"'")
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
        
          
          
           TextGadget(6068, 530, 220, 750, 20, "Feuillet inventaire des pièces",  #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6068, #PB_Gadget_BackColor, $A7E3EF)
      
      
           If   DatabaseQuery (#mysql, "SELECT * FROM invwo WHERE wo='"+GetGadgetText(6052)+"' ORDER BY id ASC")
             
               
               ListIconGadget(#PB_w26, 530, 240, 1280, 280, "Quantitée", 120, #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection)
                 SetGadgetColor(#PB_w26, #PB_Gadget_BackColor, $00FFFF)
             AddGadgetColumn(#PB_w26, 1, "# Pièce", 120)
             AddGadgetColumn(#PB_w26, 2, "Description", 610)
            
         
              While NextDatabaseRow(#mysql)
     
      AddGadgetItem(#PB_w26, -1, GetDatabaseString(#mysql, 1)+Chr(10)+GetDatabaseString(#mysql, 2)+Chr(10)+GetDatabaseString(#mysql, 3))
              Wend  
                FinishDatabaseQuery(#mysql)
           EndIf
           TextGadget(6069, 530, 520, 750, 20, "Modification table inventaire des pièces", #PB_Text_Border | #PB_Text_Center)
           SetGadgetColor(6069, #PB_Gadget_BackColor, $A7E3EF)
 
 
          ButtonGadget(#PB_w27, 530, 540, 100, 30, "Quantitée")
          ButtonGadget(#PB_w28, 630, 540, 100, 30, "# Pièces")
          ButtonGadget(#PB_w29, 730, 540, 100, 30, "Descriptiion")
          ButtonGadget(#PB_w30, 830, 540, 200, 30, "Ajouter une pièce")
          ButtonGadget(#PB_w31, 1030, 540, 240, 30, "Suprrimer une pièce")
           
                
                
                
          
           
          CloseGadgetList()
          

; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 15
; FirstLine = 12
; EnableXP
; DPIAware