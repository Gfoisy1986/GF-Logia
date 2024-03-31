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
; IDE Options = PureBasic 6.10 LTS (Windows - x64)
; CursorPosition = 255
; FirstLine = 219
; EnableXP
; DPIAware