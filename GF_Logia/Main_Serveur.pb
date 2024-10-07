UseSQLiteDatabase()
  Filename$ = "myDatabase.sqlite3"
  If OpenDatabase(90, Filename$, "", "")
    Debug "Connected to myDatabase.sqlite3"
  EndIf
  
                    
  
  
  ;_____________________________________________________________________________________________________________________________
  ;Variable
  
  Port = 6832





  
  ;---------------------------------------------------------------------------------------------------------------------------------
  ;Enumeration
  
  
    

  ;==============================================================================================================================
  ;Structure
  
  
      Structure Client
        Id.s
        Con.l
  EndStructure
  
  

 ;--------------------------------------------------------------------------------------------------------------------------   
   ;List:

Global NewList Programm.Client()  ; The list for storing the elements

   ;-----------------------------------------------------------------------------------------------------------------------------------
  ;Start Procedure

  
  
Procedure Data2()
  
 
 *Frost = AllocateMemory(1100)
ClientID = EventClient()
        DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  While  NextDatabaseRow(90)
       string7$ = GetDatabaseString(90, 1)
       PokeS(*Frost, string7$, 1100, #PB_UTF8)
     
   
       ForEach Programm()
         
       Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
         Next         
  
          ReAllocateMemory(*Frost, 1100)
   
   
   Wend
   

    FinishDatabaseQuery(90)


      Debug string7$
      PrintN (string7$)
      
FreeMemory(*Frost)
         

    
   EndProcedure
  
 
 
  Procedure AddClient()
  
EndProcedure
   
  
  Procedure.i Key()  ; Simulate an event client function
    Static clientID.i = 0
    clientID + 1
    ProcedureReturn clientID
EndProcedure
  
  
  
  ;_______________________________________________________________________________________________________________________________
  ;Main forms
  
;InitNetwork()

serverID =    CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

If serverID
 
  Debug "PureBasic - Server created (Port "+Port+")."
  
  OpenConsole("GF_Logia_Server", #PB_UTF8)
  ConsoleTitle("GF_Logia_Server") 
  Debug "Console Launch!"
  



        
      
      
         
 

  
  ;--------------------------------------------------------------------------------------------------------------------------------
  ;Loops
  
  
  
  Repeat
      
    ServerEvent = NetworkServerEvent()
   key = EventClient()
    
    
    
    
     
             
    
    
    
     Select ServerEvent
         
            

         Case #PB_NetworkEvent_None


        

     



          

    



  
           
                
         Case #PB_NetworkEvent_Connect
             
    
    *Element.Client = AddElement(Programm())  ; Add a new element to the list
    If *Element <> 0  ; Check if the element was successfully allocated
      *Element\Id = "Client ID  "+Str(EventClient())
       *Element\Con = EventClient() ; Assign the ID to the new element
        Debug "Added client with ID: " + *Element\Id
    Else
        MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
    EndIf 
          
        

           
   
 
           
                Debug "PureBasic - Server A new client has connected !"+ Str(EventClient())
               ;
                
               
              
                ;   -----------------------------------------------------------------------------          
                
                
                
                
                
                
                
                
                    


  
  
    *Frost =    AllocateMemory(1100)
                 *charle =    AllocateMemory(1100)
  DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  While  NextDatabaseRow(90)
       string90$ = GetDatabaseString(90, 1)
       PokeS(*charle, string90$, 1100, #PB_UTF8)
       Debug string90$
       
 
       string92$ = "charle"
       PokeS(*Frost, string92$, 1100, #PB_UTF8)
     Debug string92$
   
       ForEach Programm()
         
       Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
         
       SendNetworkData(Con, *charle, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
       
         Next         
         ReAllocateMemory(*charle, 1100)
   Wend 
                
     FreeMemory(*Frost)           
      FreeMemory(*charle)          
                
            FinishDatabaseQuery(90)    
                
      
            ;-------------------------------------------------------------------------------
            ;Inventaire transaction list id
   *sty = AllocateMemory(5501)
   *Frost =    AllocateMemory(1100)
  DatabaseQuery (90, "SELECT * FROM inventaire")
  While NextDatabaseRow(90)
    
       string90$ = "gui"
       PokeS(*Frost, string90$, 1100, #PB_UTF8)
     Debug string90$
     
     
     
                  str0.s = GetDatabaseString(90, 0)
                  PokeS(*sty, str0, 5501, #PB_UTF8)
                  Debug str0
       ForEach Programm()
         
       Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
        Debug string90$
       SendNetworkData(Con, *sty, 5501)
       Debug Programm()\Con
       Debug Programm()\Id
       Debug str0
         Next         
         ReAllocateMemory(*sty, 5501)
   Wend
  
  FinishDatabaseQuery(90)
   FreeMemory(*sty)
FreeMemory(*Frost)
;-----------------------------------------------------------------------------------------------------------------------------------
      ;Inventaire transaction list 1
   *Frost = AllocateMemory(191)
   *Frost8 = AllocateMemory(1100)
  DatabaseQuery (90, "SELECT * FROM inventaire")
  While NextDatabaseRow(90)
    
    
     string99$ = "gui1"
       PokeS(*Frost, string99$, 1100, #PB_UTF8)
       Debug string99$
       
         str1.s = GetDatabaseString(90, 1)
                  PokeS(*Frost8, str1, 191, #PB_UTF8)
 Debug str1
      
     ForEach Programm()
        Con = Programm()\Con
        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
         Debug string99$
       Debug Programm()\Con
       Debug Programm()\Id
       
                
                   SendNetworkData(Con, *Frost8, 191)
                  Debug str1
                   Debug Programm()\Con
                     Debug Programm()\Id
       
         Next         
        
         ReAllocateMemory(*Frost8, 191)
          
   Wend
  
  FinishDatabaseQuery(90)
  FreeMemory(*Frost8)
FreeMemory(*Frost)
          
  ;-----------------------------------------------------------------------------------------------------------------------------
               
               
               
                 
   
       
   
 
  
;        
;                *Frost = AllocateMemory(191)
;                     DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                      str1.s = GetDatabaseString(90, 1)
;                      PokeS(*Frost, str1, 191, #PB_UTF8)
;                      ForEach Programm()
;                      Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 191)
;                     Debug str1
;                            Debug Programm()\Con
;                      Debug Programm()\Id
;                   Next
;                      ReAllocateMemory(*Frost, 191)
;                   Wend 
;                   FinishDatabaseQuery(90)
;                   FreeMemory(*Frost)
;                   *Frost = AllocateMemory(192)
;                   DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                      str2.s = GetDatabaseString(90, 2)
;                      PokeS(*Frost, str2, 192, #PB_UTF8)
;                      ForEach Programm()
;                      Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 192)
;                     Debug str2
;                            Debug Programm()\Con
;                          Debug Programm()\Id
;                   Next
;                      ReAllocateMemory(*Frost, 192)
;                   Wend 
;                   FinishDatabaseQuery(90)
;                   FreeMemory(*Frost)
;                   *Frost = AllocateMemory(193)
;                   DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                      str3.s = GetDatabaseString(90, 3)
;                      PokeS(*Frost, str3, 193, #PB_UTF8)
;                      ForEach Programm()
;                       Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 193)
;                     Debug str3
;                            Debug Programm()\Con
;                       Debug Programm()\Id
;                  Next
;                     ReAllocateMemory(*Frost, 193)
;                   Wend 
;                   FinishDatabaseQuery(90)
;                   FreeMemory(*Frost)
;                  *Frost = AllocateMemory(194)
;                  DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                     str4.s = GetDatabaseString(90, 4)
;                     PokeS(*Frost, str4, 194, #PB_UTF8)
;                     ForEach Programm()
;                       Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 194)
;                     Debug str4
;                            Debug Programm()\Con
;                       Debug Programm()\Id
;                   Next
;                      ReAllocateMemory(*Frost, 194)
;                     Wend 
;                     FinishDatabaseQuery(90)
;                     FreeMemory(*Frost)
;                    *Frost = AllocateMemory(195)
;                   DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                      str5.s = GetDatabaseString(90, 5)
;                      PokeS(*Frost, str5, 195, #PB_UTF8)
;                      ForEach Programm()
;                      Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 195)
;                     Debug str5
;                            Debug Programm()\Con
;                       Debug Programm()\Id
;                   Next
;                      ReAllocateMemory(*Frost, 195)
;                    Wend 
;                    FinishDatabaseQuery(90)
;                    FreeMemory(*Frost)
;                   *Frost = AllocateMemory(196)
;                   DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                      str6.s = GetDatabaseString(90, 6)
;                      PokeS(*Frost, str6, 196, #PB_UTF8)
;                      ForEach Programm()
;                      Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 196)
;                     Debug str6
;                            Debug Programm()\Con
;                      Debug Programm()\Id
;                   Next
;                     ReAllocateMemory(*Frost, 196)
;                   Wend 
;                   FinishDatabaseQuery(90)
;                   FreeMemory(*Frost)
;                   *Frost = AllocateMemory(197)
;                   DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                     str7.s = GetDatabaseString(90, 7)
;                     PokeS(*Frost, str7, 197, #PB_UTF8)
;                     ForEach Programm()
;                     Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 197)
;                     Debug str7
;                            Debug Programm()\Con
;                       Debug Programm()\Id
;                  Next
;                    ReAllocateMemory(*Frost, 197)
;                  Wend 
;                  FinishDatabaseQuery(90)
;                  FreeMemory(*Frost)
;                  *Frost = AllocateMemory(198)
;                  DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                     str8.s = GetDatabaseString(90, 8)
;                     PokeS(*Frost, str8, 198, #PB_UTF8)
;                     ForEach Programm()
;                     Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 198)
;                     Debug str8
;                            Debug Programm()\Con
;                      Debug Programm()\Id
;                  Next
;                     ReAllocateMemory(*Frost, 198)
;                  Wend 
;                  FinishDatabaseQuery(90)
;                  FreeMemory(*Frost)
;                  
;                  
;                  
;                  
;                  *Frost = AllocateMemory(199)
;                  DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                   str9.s = GetDatabaseString(90, 9)
;                   PokeS(*Frost, str9, 199, #PB_UTF8)
;                   ForEach Programm()
;                    Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 199)
;                     Debug str9
;                            Debug Programm()\Con
;                    Debug Programm()\Id
;                  Next
;                    ReAllocateMemory(*Frost, 199)
;                  Wend 
;                  FinishDatabaseQuery(90)
;                  FreeMemory(*Frost)
;                  *Frost = AllocateMemory(200)
;                  DatabaseQuery (90, "SELECT * FROM inventaire")
;              While NextDatabaseRow(90)
;                     str10.s = GetDatabaseString(90, 10)
;                     PokeS(*Frost, str10, 200, #PB_UTF8)
;                     ForEach Programm()
;                     Con = Programm()\Con
;                     SendNetworkData(Con, *Frost, 200)
;                     Debug str10
;                            Debug Programm()\Con
;                     Debug Programm()\Id
;                  Next
;                   ReAllocateMemory(*Frost, 200)
;                  
;                  
;                 Wend 
;           FinishDatabaseQuery(90)
;               FreeMemory(*Frost)
;--------------------------------------------------------------------------


        Case #PB_NetworkEvent_Data
           
         
;                 *test = AllocateMemory(2200)
;           
;           ReceiveNetworkData(Key, *test, 2200)
;          
;           
;            If PeekS(*test, 2200, #PB_UTF8) = "test"
;              Debug "yeah test..."
;             FreeMemory(*test)
;          *Frost =   AllocateMemory(1100)
;            string15$ = "elie"
;        PokeS(*Frost, string15$, 1100, #PB_UTF8)
;      
;    
;        ForEach Programm()
;          
;        Con = Programm()\Con
;        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
;        Debug Programm()\Con
;        Debug Programm()\Id
;          Next 
;              
;             ReAllocateMemory(*Frost, 1100)
;                   
;    DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
;   While  NextDatabaseRow(90)
;        string7$ = GetDatabaseString(90, 1)
;        PokeS(*Frost, string7$, 1100, #PB_UTF8)
;      Debug string7$
;    
;        ForEach Programm()
;          
;        Con = Programm()\Con
;        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
;        Debug Programm()\Con
;        Debug Programm()\Id
;          Next         
;       
;    ReAllocateMemory(*Frost, 1100)
;    
;    Wend
;    
;     FinishDatabaseQuery(90)
; ;FreeMemory(*Buffer, 1000)
; FreeMemory(*Frost)
;          
;            
;      
;      
;      
; ;      *test = AllocateMemory(2200)
; ;            ElseIf  PeekS(*test, 2200, #PB_UTF8) = "world"
;              Debug "Hello world!"
;            ReAllocateMemory(*test, 1000)
;             
;        ElseIf ReceiveNetworkData(Key, *test, 1000)
;              Debug PeekS(*test, 1000, #PB_UTF8)
;              FreeMemory(*test)
;              
;              
;          *Frost =    AllocateMemory(1100)
;                  string13$ = "elie"
;        PokeS(*Frost, string13$, 1100, #PB_UTF8)
;      
;    
;        ForEach Programm()
;          
;        Con = Programm()\Con
;        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
;        Debug Programm()\Con
;        Debug Programm()\Id
;          Next 
;              
;              FreeMemory(*Frost)
;              
;              
;              
;              
;              *test = AllocateMemory(1000)
;            Data1$ = PeekS(*test, 1000, #PB_UTF8) 
;            Debug PeekS(*test, 1000, #PB_UTF8) 
;            Debug Data1$
;           DatabaseQuery (90, "SELECT * FROM workorder")
;                invfg15$ = "UPDATE workorder SET wo='"+Data1$+"' WHERE id=4"  
;             ; Debug "Query success..."
;             NextDatabaseRow(90)
;        DatabaseUpdate(90, invfg15$)
;            ; Debug "update db success..."
;              ;Debug PeekS(*data, 5000, #PB_UTF8)
;                FreeMemory(*test)
;            
;      FinishDatabaseQuery(90)
;                *Frost =   AllocateMemory(1100)
;    DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
;   While  NextDatabaseRow(90)
;        string7$ = GetDatabaseString(90, 1)
;        PokeS(*Frost, string7$, 1100, #PB_UTF8)
;      
;    
;        ForEach Programm()
;          
;        Con = Programm()\Con
;        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
;        Debug Programm()\Con
;        Debug Programm()\Id
;          Next         
;   
;           ReAllocateMemory(*Frost, 1100)
;    
;    
;    Wend
;    
; 
;     
; 
; 
;       
;       ;FreeMemory(*Buffer, 1000)
; FreeMemory(*Frost)
;           
;       ; Debug "Update DB not working..."
;       ; Debug DatabaseError()
;     
;      FinishDatabaseQuery(90)
;    
;        ;Debug "Query not working"
;  
;             Debug "data5 is execute..."
;             Debug Data1$
;             ;PrintN(PeekS(*test, 1000, #PB_UTF8))
;             
;           EndIf
;            
;        
;       

           
          
          
            
          Case #PB_NetworkEvent_Disconnect
          Debug "PureBasic - Server Client "+Key+" has closed the connection..."
          PrintN("PureBasic - Server Client "+Key+" has closed the connection...")
          DeleteElement(Programm())
         
  
      EndSelect
    
  ForEver
  
  
  
  ;----------------------------------------------------------------------------------------------------------------------------
  ;Footer
  
  
EndIf
   Debug "PureBasic - Server Click To quit the server."
     ClearList(Programm())
   CloseDatabase(90)
   CloseNetworkServer(0)
   CloseConsole()
  
End
  
  
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 300
; FirstLine = 289
; Folding = -
; EnableXP
; DPIAware
; Executable = Serveur_x64.run
; Compiler = PureBasic 6.12 LTS (Linux - x64)