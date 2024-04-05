Case  #inv_del : ; DEL inventaire
      
                         querydelinv.s = "DELETE FROM inventaire WHERE id='"+GetGadgetText(#_inv2)+"'"
  
                         DatabaseUpdate(#mysql, querydelinv) 
                           FinishDatabaseQuery(#mysql)
                           inventaire()
                           
                           
                         
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
         
         
         
         
               
  
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
;               INVENTAIRE
  
  
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
               
               
               
               
               
   Case #inv_0 :
    OpenGadgetList(1, 0)
   invw0.s = InputRequester("Modification du # piece.", "Veuillez entrer le nouveau # de piece.", "")
   invw1.s = "UPDATE inventaire SET nopiece='"+invw0+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invw1)
   
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 
 
 Case #inv_1 :
   OpenGadgetList(1, 0)
     invfg2.s = InputRequester("Modification de la description.", "Veuillez entrer la nouvelle description.", "")
   invfg3.s = "UPDATE inventaire SET description='"+invfg2+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg3)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 
 
 Case #inv_2 :
   OpenGadgetList(1, 0)
   invfg4.s = InputRequester("Modification de la quantité.", "Veuillez entrer la nouvelle quantitée.", "")
   invfg5.s = "UPDATE inventaire SET quantiter='"+invfg4+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg5)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
 
 
 Case #inv_3 :
   OpenGadgetList(1, 0)
   invfg6.s = InputRequester("Modification de la quantité à stocker.", "Veuillez entrer la nouvelle quantité à gardez en stock.", "")
   invfg7.s = "UPDATE inventaire SET quantiterstock='"+invfg6+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg7)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
 
 
 Case #inv_4 :
   OpenGadgetList(1, 0)
   invfg8.s = InputRequester("Modification du prix achat #1.", "Veuillez entrer le nouveau prix achat #1.", "")
   invfg9.s = "UPDATE inventaire SET buyprice1='"+invfg8+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg9)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
       
       
 Case #inv_5 :
         OpenGadgetList(1, 0)
   invfg10.s = InputRequester("Modification du fournisseur #1", "Veuillez entrer le nouveau fournisseur #1.", "")
   invfg11.s = "UPDATE inventaire SET fourn1='"+invfg10+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg11)
    FinishDatabaseQuery(#mysql)
    inventaire()
    CloseGadgetList()
        
        
   Case #inv_6 :
          OpenGadgetList(1, 0)
   invfg12.s = InputRequester("Modification du prix achat #2.", "Veuillez entrer le nouveau prix achat #2.", "")
   invfg13.s = "UPDATE inventaire SET buyprice2='"+invfg12+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg13)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
         
         
  Case #inv_7 :
           OpenGadgetList(1, 0)
   invfg14.s = InputRequester("Modification du nouveau fournisseur #2.", "Veuillez entrer le nouveau fournisseur #2.", "")
   invfg15.s = "UPDATE inventaire SET fourn2='"+invfg14+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg15)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
          
          
  Case #inv_8 :
            OpenGadgetList(1, 0)
   invfg16.s = InputRequester("Modification du nouveau prix vente.", "Veuillez entrer le nouveau prix vente.", "")
   invfg17.s = "UPDATE inventaire SET sellprice='"+invfg16+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg17)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
          
           
  Case #inv_9 :
             OpenGadgetList(1, 0)
   invfg18.s = InputRequester("Modification du # localization.", "Veuillez entrer le nouveau # de localization.", "")
   invfg19.s = "UPDATE inventaire SET nolocation='"+invfg18+"' WHERE id='"+GetGadgetText(#_inv2)+"'"
   DatabaseUpdate(#mysql, invfg19)
    FinishDatabaseQuery(#mysql)
     inventaire()
    CloseGadgetList()
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 139
; FirstLine = 102
; EnableXP
; DPIAware