Case #_WO1202 :
OpenGadgetList(0, 4)
TextGadget(#_wo3, 0, 320, 200, 20, "Liste des travaux", #PB_Text_Border | #PB_Text_Center)
            SetGadgetColor(#_wo3, #PB_Gadget_BackColor, $A7E3EF)
       
     If ListViewGadget(#_w4, 0, 340, 200, 120)
       SetGadgetColor(#_w4, #PB_Gadget_BackColor, $F3C8F3)  
       DatabaseQuery(#mysql, "SELECT * FROM job WHERE (wo, pstatus) = ('"+GetGadgetText(#_WO1202)+"', '0')", #PB_Database_DynamicCursor)
     
     
      
           While  NextDatabaseRow(#mysql) 
                JOB1.s = GetDatabaseString(#mysql, 2)
               
               AddGadgetItem(#_w4, -1, ""+JOB1)
                 Wend  
                 FinishDatabaseQuery(#mysql)
                
                 ButtonGadget(#PB_b14, 0, 460, 200, 30, "Nouveau travaux")

                 TextGadget(#_wo5, 0, 500, 200, 20, "Liste des Notes", #PB_Text_Border | #PB_Text_Center)
                 SetGadgetColor(#_wo5, #PB_Gadget_BackColor, $A7E3EF)
       
               EndIf
               
               
               
                If  ListViewGadget(#_wo6, 0, 520, 200, 80)
       SetGadgetColor(#_wo6, #PB_Gadget_BackColor, $F3C8F3) 
       DatabaseQuery (#mysql, "SELECT * FROM note WHERE (wo) = ('"+GetGadgetText(#_WO1202)+"')")
             While NextDatabaseRow(#mysql) 
               
               
               AddGadgetItem(#_wo6, -1, ""+GetDatabaseString(#mysql, 1))
               
                  
                   
              Wend       
                 FinishDatabaseQuery(#mysql)
                 EndIf
       ButtonGadget(#_wo7, 0, 600, 200, 20, "Sauvegarder note")
       ButtonGadget(#_wo8, 0, 620, 200, 20, "Supprimer note")
       ButtonGadget(#_wo9, 0, 640, 200, 20,"Nouvelle note")
       
       
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
       
       
       punch()
       CloseGadgetList()
       
       Case #_wo6 : ;open note
            OpenGadgetList(0, 4)
           
       If     DatabaseQuery (#mysql, "SELECT * FROM note WHERE notename='"+GetGadgetText(#_wo6)+"'")
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       
       TextGadget(#_wo12, 200, 500, 320, 20, "Editeur de Note", #PB_Text_Border | #PB_Text_Center)
       SetGadgetColor(#_wo12, #PB_Gadget_BackColor, $A7E3EF)
       EditorGadget(#_wo13, 200, 520, 320, 140)
       SetGadgetColor(#_wo13, #PB_Gadget_BackColor, $F3D2A8)
     While  NextDatabaseRow(#mysql) 
         AddGadgetItem(#_wo13, -1, GetDatabaseString(#mysql, 3))
         Wend
         FinishDatabaseQuery(#mysql)
         EndIf
         CloseGadgetList()
         
         
         
         
 Case #PB_b14 : ;newjobbuttonhandler
   
   OpenGadgetList(0, 4)
   
 Text200$ = InputRequester("nouvelle job", "Veuillez entrer le nom de la nouvelle job", "")
          Text201$ = InputRequester("Info job", "Veuillez entrer les information sur les travaux", "")
        
   
 If    DatabaseQuery (#mysql, "SELECT * FROM job")
   query67.s = "INSERT INTO job (jobname, jobinfo, wo, pstatus) VALUES ('"+Text200$+"', '"+Text201$+"', '"+GetGadgetText(#_WO1202)+"', '0')"
    
  ; update the database with the literal prepared query and confirm the write
  DatabaseUpdate(#mysql, query67)
    
    Debug "data successfully inserted."

 
    FinishDatabaseQuery(#mysql)
  EndIf
 ; aWOordertHandler()
  CloseGadgetList()
  
  Case  #_w4 : ;joblist
             OpenGadgetList(0, 4)
    
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, wo) = ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_WO1202)+"')")
      
     
     TextGadget(1204, 200, 320, 320, 20, "Liste des rapports de travaux", #PB_Text_Border | #PB_Text_Center)
     SetGadgetColor(1204, #PB_Gadget_BackColor, $A7E3EF)
    ListViewGadget(1206, 200, 340, 320, 65)
   SetGadgetColor(1206, #PB_Gadget_BackColor, $9280EE)
        
  While NextDatabaseRow(#mysql)
  
        AddGadgetItem(1206, -1, "" + GetDatabaseString(#mysql, 3))
   
   Wend
     FinishDatabaseQuery(#mysql)
     EndIf
     
   If   DatabaseQuery (#mysql, "SELECT * FROM job WHERE (jobname, pstatus) = ('"+GetGadgetText(#_w4)+"', '1')")
      
      
 ListViewGadget(1207, 200, 405, 320, 85)
     ; EditorGadget(1207, 200, 405, 320, 85) 
      SetGadgetColor(1207, #PB_Gadget_BackColor, $F3D2A8)
        
    While NextDatabaseRow(#mysql)  
     
      AddGadgetItem(1207, -1, ""+GetDatabaseString(#mysql, 1)+" : " + GetDatabaseString(#mysql, 4))
    
    Wend    
         FinishDatabaseQuery(#mysql)
   EndIf
   
punch()
    
   CloseGadgetList()
   
   
   
   
   Case #_wo9 :  ;new note         ;a modifier #serie identifier
    OpenGadgetList(0, 4)
    Text100$ = InputRequester("New Note name", "Veuillez entrer le nom de la nouvelle note", "")
    
   If  DatabaseQuery (#mysql, "SELECT * FROM note WHERE wo='"+GetGadgetText(#_WO1202)+"'")
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
              DatabaseQuery (0, "SELECT * FROM note WHERE wo='"+GetGadgetText(#_WO1202)+"'")
             While NextDatabaseRow(#mySql) 
               
               
               AddGadgetItem(#_1203, -1, "" + GetDatabaseString(#mySql, 1))
               
                  
                   
              Wend 
             
   
              FinishDatabaseQuery(#mySql)
            EndIf
           

     
      
     
            CloseGadgetList()
            
            
            
              Case #_2002 :;punchout
          
         
         
          OpenGadgetList(0, 4)
       
   
    Debug "editor window saved"
    
    
   
     
               
       query3$ = InputRequester("rapport job : "+GetGadgetText(#_w4), " Veuillez écrire le nouveau rapport", "")
    


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
   
   query12.s = "UPDATE punch SET punchout = '"+time+"', pstatus = '2' WHERE (jobname, wo, pstatus) = ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(#_WO1202)+"', '1')"
    query12_1.s = "INSERT INTO job (jobname, jobinfo, jobrepport, wo, pstatus) VALUES ('"+GetGadgetText(#_w4)+"', '"+GetGadgetText(1206)+"', '"+query3$+"', '"+GetGadgetText(#_WO1202)+"', '1')"
    
   
  ; update the database With the literal prepared query And confirm the write
    If DatabaseUpdate(#mysql, query12)
     FinishDatabaseQuery(#mysql)
    MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)
    Debug "punch out query12 "+time+" successfully inserted."
    DatabaseUpdate(#mysql, query12_1)
    FinishDatabaseQuery(#mysql)
      MessageRequester("job Sauvegardée", "SAVED",  #PB_MessageRequester_Info)
      Debug "query12_1 successfully inserted."
       punch()
  Else
    Debug "not working punch out"
   
   
  EndIf
  
  
 
 
  
   
  

  

 
  CloseGadgetList()


   Case #_2001 : ;punch in
          
        OpenGadgetList(0, 4)

;Debug FormatDate("%dd %mm %yyyy %hh:%ii:%ss", Date())


day.s = "%dd"
month.s = "%mm"
year.s = "%yyyy"
hour.s = "%hh"
minute.s = "%ii"
second.s = "%ss"



   time.s = FormatDate(""+day+"/"+month+"/"+year+"  "+hour+":"+minute+":"+second+"", Date())
    
       
     
   query11.s = "INSERT INTO punch (wo, jobname, punchin, pstatus) VALUES ('"+GetGadgetText(#_WO1202)+"', '"+GetGadgetText(#_w4)+"', '"+time+"', '1')"
          
  ; update the database With the literal prepared query And confirm the write
                  
            
           If DatabaseUpdate(#mysql, query11)
    
    Debug "punch out "+time+" successfully inserted."
punch()
  Else
    
    Debug "error inserting data! " + DatabaseError()
    
  EndIf

  ; close the database file
  
  

  FinishDatabaseQuery(#mysql)
  
 
  CloseGadgetList()
; IDE Options = PureBasic 6.11 LTS (Linux - x64)
; CursorPosition = 131
; FirstLine = 105
; EnableXP
; DPIAware