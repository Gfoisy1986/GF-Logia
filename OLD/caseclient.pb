 Case  #_BCC8521 : ;DEL client
          OpenGadgetList(1, 2)
                         querydelclient2.s = "DELETE FROM client WHERE id='"+GetGadgetText(#_BCC20)+"'"
  
                         DatabaseUpdate(#mysql, querydelclient2) 
                           FinishDatabaseQuery(#mysql)
                        Client()
                         
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
              
              
              
              
              
 
 ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 ;////////////////////////////////////////
 ;// Table des Client ici bas  /////////
 ;////////////////////////////////////////  
 
 
 Case #BC_024 :
   OpenGadgetList(1, 2)
   texteclient0.s = InputRequester("Modification du nom de l'entreprise.", "Veuillez entrer le nouveau nom de l'entreprise.", "")
   queryclient0.s = "UPDATE client SET nomsent='"+texteclient0+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient0)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
  Case #BC_24 :
    OpenGadgetList(1, 2)
   texteclient3.s = InputRequester("Modification du nom du responsable.", "Veuillez entrer le nom du responsable.", "")
   queryclient3.s = "UPDATE client SET nomres='"+texteclient3+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient3)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_2 :
   OpenGadgetList(1, 2)
     texteclient4.s = InputRequester("Modification du email du propriétaire.", "Veuillez entrer le nouveau email du propriétaire.", "")
   queryclient4.s = "UPDATE client SET emailp='"+texteclient4+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient4)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 
 
 Case #BC_3 :
   OpenGadgetList(1, 2)
   texteclient5.s = InputRequester("Modification du email du responsable.", "Veuillez entrer le nouveau email du responsable.", "")
   queryclient5.s = "UPDATE client SET emailres='"+texteclient5+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient5)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_4 :
   OpenGadgetList(1, 2)
   client6.s = InputRequester("Modification du nouveau # FAX du responsable.", "Veuillez entrer le nouveau # FAX du responsable", "")
   client66.s = "UPDATE client SET faxres='"+client6+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, client66)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_5 :
   OpenGadgetList(1, 2)
   texteclient7.s = InputRequester("Modification du nouveau # FAX de l'entreprise.", "Veuillez entrer le nouveau # FAX de l'entreprise.", "")
   queryclient7.s = "UPDATE client SET faxent='"+texteclient7+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient7)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
      
       
       Case #BC_66 :
         OpenGadgetList(1, 2)
   texteclient8.s = InputRequester("Modification du prenoms du propriétaire.", "Veuillez entrer le nouveau prenoms du propriétaire.", "")
   queryclient8.s = "UPDATE client SET prenoms='"+texteclient8+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient8)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
      
        
        Case #BC_7 :
          OpenGadgetList(1, 2)
   texteclient9.s = InputRequester("Modification du noms propre du propriétaire.", "Veuillez entrer le nouveau noms propre du propriétaire", "")
   queryclient9.s = "UPDATE client SET noms='"+texteclient9+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient9)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
        
         
         Case #BC_8 :
           OpenGadgetList(1, 2)
   texteclient10.s = InputRequester("Modification du nouveau # cellulaire du propriétaire.", "Veuillez entrer le nouveau # cellulaire du propriétaire.", "")
   queryclient10.s = "UPDATE client SET cellp='"+texteclient10+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient10)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
         
          
          Case #BC_9 :
            OpenGadgetList(1, 2)
   texteclient11.s = InputRequester("Modification du nouveau # cellulaire du responsable.", "Veuillez entrer le nouveau # cellulaire du responsable.", "")
   queryclient11.s = "UPDATE client SET cellresp='"+texteclient11+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient11)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
       
           
           Case #BC_10 :
             OpenGadgetList(1, 2)
   texteclient12.s = InputRequester("Modification du nouveau # téléphone de l'entreprise.", "Veuillez entrer le nouveau # téléphone de l'entreprise.", "")
   queryclient12.s = "UPDATE client SET telent='"+texteclient12+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient12)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
          
            
            Case #BC_11 :
              OpenGadgetList(1, 2)
   texteclient13.s = InputRequester("Modification du nouveau # téléphone du responsables.", "Veuillez entrer le nouveau # téléphone du responsable.", "")
   queryclient13.s = "UPDATE client SET telresp='"+texteclient13+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient13)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
          
             
             Case #BC_12 :
               OpenGadgetList(1, 2)
   texteclient14.s = InputRequester("Modification de la date de création du client.", "Veuillez entrer la nouvelle date de création du client", "")
   queryclient14.s = "UPDATE client SET datesc='"+texteclient14+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient14)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
             
              
              Case #BC_13 :
                OpenGadgetList(1, 2)
   texteclient15.s = InputRequester("Modification de la nouvelle addresse de l'entreprise.", "Veuillez entrer la nouvelle addresse de l'entreprise.", "")
   queryclient15.s = "UPDATE client SET addent='"+texteclient15+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient15)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
             
               
               Case #BC_14 :
                 OpenGadgetList(1, 2)
   texteclient16.s = InputRequester("Modification de la nouvelle ville de l'entreprise.", "Veuillez entrer la nouvelle ville de l'entreprise.", "")
   queryclient16.s = "UPDATE client SET villeent='"+texteclient16+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient16)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
                
                
                Case #BC_15 :
                  OpenGadgetList(1, 2)
   texteclient17.s = InputRequester("Modification de la nouvelle province de l'entreprise.", "Veuillez entrer la nouvelle province de l'entreprise.", "")
   queryclient17.s = "UPDATE client SET provent='"+texteclient17+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient17)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
                 
                 
                 Case #BC_16 :
                   OpenGadgetList(1, 2)
   texteclient18.s = InputRequester("Modification du pays de l'entrprise.", "Veuillez entrer le nouveau pays de l'entrprise.", "")
   queryclient18.s = "UPDATE client SET paysent='"+texteclient18+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient18)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_17 :
   OpenGadgetList(1, 2)
   texteclient19.s = InputRequester("Modification du Code Postal de l'entreprise.", "Veuillez entrer le nouveau Code Postal de l'entrprise.", "")
   queryclient19.s = "UPDATE client SET zipent='"+texteclient19+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient19)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_18 :
   OpenGadgetList(1, 2)
   texteclient20.s = InputRequester("Modification de l'addresse du propriétaire.", "Veuillez entrer la nouvelle addresse du propriétaire.", "")
   queryclient20.s = "UPDATE client SET addp='"+texteclient20+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient20)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
 
 
 Case #BC_19 :
   OpenGadgetList(1, 2)
   texteclient21.s = InputRequester("Modification de la ville du propriétaire.", "Veuillez entrer la nouvelle ville du propriétaire.", "")
   queryclient21.s = "UPDATE client SET villep='"+texteclient21+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient21)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_20 :
   OpenGadgetList(1, 2)
   texteclient22.s = InputRequester("Modification de la province du propriétaire.", "Veuillez entrer la nouvelle province du propriétaire.", "")
   queryclient22.s = "UPDATE client SET provp='"+texteclient22+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient22)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_21 :
   OpenGadgetList(1, 2)
   texteclient23.s = InputRequester("Modification du pays du propriétaire.", "Veuillez entrer le nouveau pays du propriétaire.", "")
   queryclient23.s = "UPDATE client SET paysp='"+texteclient23+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient23)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_22 :
   OpenGadgetList(1, 2)
   texteclient24.s = InputRequester("Modification du Code Postal du propriétaire.", "Veuillez entrer le nouveau Code Postal du propriétaire.", "")
   queryclient24.s = "UPDATE client SET zipp='"+texteclient24+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient24)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()

 
 Case #BC_23 :
   OpenGadgetList(1, 2)
   texteclient25.s = InputRequester("Modification du taux horraire du client.", "Veuillez entrer le nouveau taux horraire du client.", "")
   queryclient25.s = "UPDATE client SET tauxhc='"+texteclient25+"' WHERE id='"+GetGadgetText(#_BCC20)+"'"
   DatabaseUpdate(#mysql, queryclient25)
    FinishDatabaseQuery(#mysql)
    Client()
    CloseGadgetList()
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 304
; FirstLine = 268
; EnableXP
; DPIAware