 Case  852 : ; DEL employer
          OpenGadgetList(1, 1)
                         querydelemployer.s = "DELETE FROM username WHERE id='"+GetGadgetText(#_020)+"'"
  
                         DatabaseUpdate(#mysql, querydelemployer) 
                           FinishDatabaseQuery(#mysql)
                         employer()
                         
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
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 234
; FirstLine = 197
; EnableXP
; DPIAware