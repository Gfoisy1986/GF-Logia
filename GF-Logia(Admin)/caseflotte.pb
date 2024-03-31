   Case  #PB_fc  : ;DEL flotte
          OpenGadgetList(1, 3)
                         querydelflotte.s = "DELETE FROM flotte WHERE id='"+GetGadgetText(#_a0fl)+"'"
  
                         DatabaseUpdate(#mysql, querydelflotte) 
                           FinishDatabaseQuery(#mysql)
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
        
        
        
        
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;// Flotte           //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
 
  Case #PB_fg0 :
    OpenGadgetList(1, 3)
   w0.s = InputRequester("Modification du # série.", "Veuillez entrer le nouveau # série du vehicule.", "")
   w1.s = "UPDATE flotte SET serie='"+w0+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, w1)
   
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
 
 
 Case #PB_fg2 :
   OpenGadgetList(1, 3)
     fg2.s = InputRequester("Modification de l'année.", "Veuillez entrer la nouvelle année du vehicule.", "")
   fg3.s = "UPDATE flotte SET annee='"+fg2+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg3)
    FinishDatabaseQuery(#mysql)
   flotte()
    CloseGadgetList()
 
 
 Case #PB_fg3 :
   OpenGadgetList(1, 3)
   fg4.s = InputRequester("Modification de la marque.", "Veuillez entrer la nouvelle marque du vehicule.", "")
   fg5.s = "UPDATE flotte SET make='"+fg4+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg5)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
 
 
 Case #PB_fg4 :
   OpenGadgetList(1, 3)
   fg6.s = InputRequester("Modification du nouveau model.", "Veuillez entrer le nouveau model du vehicule", "")
   fg7.s = "UPDATE flotte SET model='"+fg6+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg7)
    FinishDatabaseQuery(#mysql)
   flotte()
    CloseGadgetList()
 
 
 Case #PB_fg5 :
   OpenGadgetList(1, 3)
   fg8.s = InputRequester("Modification du killometrage.", "Veuillez entrer le nouveau kilometrage du vehicule.", "")
   fg9.s = "UPDATE flotte SET km='"+fg8+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg9)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
       
       
 Case #PB_fg6 :
         OpenGadgetList(1, 3)
   fg10.s = InputRequester("Modification des heures.", "Veuillez entrer les nouvelles heures du vehicule.", "")
   fg11.s = "UPDATE flotte SET hrs='"+fg10+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg11)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
       
        
 Case #PB_fg7 :
          OpenGadgetList(1, 3)
   fg12.s = InputRequester("Modification de la date de la derniere maintenance.", "Veuillez entrer la nouvelle date de la derniere maintenance du vehicule", "")
   fg13.s = "UPDATE flotte SET date='"+fg12+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg13)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
         
         
  Case #PB_fg8 :
           OpenGadgetList(1, 3)
   fg14.s = InputRequester("Modification du nouveau mot de passe 'ECM'.", "Veuillez entrer le nouveau mot de passe 'ECM' du vehicule.", "")
   fg15.s = "UPDATE flotte SET ecm='"+fg14+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg15)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
          
          
  Case #PB_fg9 :
            OpenGadgetList(1, 3)
   fg16.s = InputRequester("Modification du nouveau # plaque.", "Veuillez entrer le nouveau # plaque du vehicule.", "")
   fg17.s = "UPDATE flotte SET imatri='"+fg16+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg17)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
          
           
  Case #PB_fg10 :
             OpenGadgetList(1, 3)
   fg18.s = InputRequester("Modification de la date de fin garantie.", "Veuillez entrer la nouvelle date de fin de garantie du vehicule", "")
   fg19.s = "UPDATE flotte SET fing='"+fg18+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg19)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
            
            
   Case #PB_fg11 :
              OpenGadgetList(1, 3)
   fg20.s = InputRequester("Modification de la date de la prochaine inspection pepe ou saaq.", "Veuillez entrer la date inspection pep ou saaq du vehicule", "")
   fg21.s = "UPDATE flotte SET nexinspq='"+fg20+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg21)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
            
             
   Case #PB_fg12 :
               OpenGadgetList(1, 3)
   fg22.s = InputRequester("Modification de la date de la prochaine maintenance.", "Veuillez entrer la nouvelle date de maintenance du vehicule", "")
   fg23.s = "UPDATE flotte SET nexmai='"+fg22+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg23)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
              
              
    Case #PB_fg1 :
                OpenGadgetList(1, 3)
   fg24.s = InputRequester("Modification du # unité.", "Veuillez entrer le nouveau #unité du vehivule.", "")
   fg25.s = "UPDATE flotte SET unit='"+fg24+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg25)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
              
  
  
  Case #PB_fg13 :
                OpenGadgetList(1, 3)
   fg26.s = InputRequester("Modification du noms entreprise.", "Veuillez entrer le nouveau noms entreprise du vehicule.", "")
   fg27.s = "UPDATE flotte SET noment='"+fg26+"' WHERE id='"+GetGadgetText(#_a0fl)+"'"
   DatabaseUpdate(#mysql, fg27)
    FinishDatabaseQuery(#mysql)
    flotte()
    CloseGadgetList()
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 192
; FirstLine = 156
; EnableXP
; DPIAware