UseSQLiteDatabase()
  Filename$ = "myDatabase.sqlite3"
  If OpenDatabase(90, Filename$, "", "")
    Debug "Connected to myDatabase.sqlite3"
  EndIf
  
                    
  
  
  ;_____________________________________________________________________________________________________________________________
  ;Variable
  
  Port = 6832

*data = AllocateMemory(1000)
*test = AllocateMemory(2200)
*Buffer = AllocateMemory(1000)
*Frost = AllocateMemory(1000)
 
  
  
  ;---------------------------------------------------------------------------------------------------------------------------------
  ;Enumeration
  
  
    

  ;==============================================================================================================================
  ;Structure
  
  
      Structure Client
    Id.s
    ; Add other fields as necessary
EndStructure
  
  

 ;--------------------------------------------------------------------------------------------------------------------------   
   ;List:



   ;-----------------------------------------------------------------------------------------------------------------------------------
  ;Start Procedure

  
  
Procedure Data2()
  
 
 
ClientID = EventClient()
     *Buffer = AllocateMemory(1000)
     *Frost = AllocateMemory(1000)
     
    DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
    While NextDatabaseRow(90)
       string7$ = GetDatabaseString(90, 1)
       PokeS(*Buffer, string7$, 1000, #PB_UTF8)
       
         SendNetworkData(ClientID, *Buffer, 1000)

      Debug string7$
      PrintN (string7$)
      ReAllocateMemory(*Buffer, 1000)
    Wend  
     
    
     FinishDatabaseQuery(90)
   EndProcedure
  
 
 
   Procedure AddClient()
   NewList Clients.Client() ; The list for storing the elements
    ; Add a new client directly to the list
    If Not AllocateStructure(Client) ; Ensure allocation is done for the new element
        MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
        ProcedureReturn
    EndIf

    AddElement(Clients())  ; Add a new element to the list
    Clients()\Id = Str(EventClient())  ; Assign the ID to the new element
    Debug "Added client with ID: " + Clients()\Id
EndProcedure
   
Procedure ListClients()
  NewList Clients.Client() ; The list for storing the elements
    ForEach Clients()
        Debug "Client ID: " + Clients()\Id
        ; Access other fields if necessary
    Next
EndProcedure


 
  
  
  
  ;_______________________________________________________________________________________________________________________________
  ;Main forms
  
  
serverID =    CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP)

If serverID
 
  Debug "PureBasic - Server created (Port "+Port+")."
  OpenConsole("GF_Logia_Server", #PB_UTF8)
  ConsoleTitle("GF_Logia_Server") 
  Debug "Console Launch!"
 


  

  
        
               
         
;AddMapElement(Country(), Str(ClientID))  

  
  ;--------------------------------------------------------------------------------------------------------------------------------
  ;Loops
  
  
  
  Repeat
      
    ServerEvent = NetworkServerEvent()
   key = EventClient()
    NewList Clients.Client() ; The list for storing the elements
    
    
     
             
    
    
    
     Select ServerEvent
         
            

         Case #PB_NetworkEvent_None


        

     



          

    



  
           
                
         Case #PB_NetworkEvent_Connect
           AddClient()  
          
       ListClients()

          

    
 
           
                Debug "PureBasic - Server A new client has connected !"+ Str(EventClient())
               ;AddMapElement(Country(), Str(EventClient())) ; Use the unique Key
               ; Store the ClientID as the value
           
                
                Debug Key
              
               
               


          
          
          
Data2()


        Case #PB_NetworkEvent_Data
           
         

          
          ReceiveNetworkData(Key, *test, 2200)
         
          
           If PeekS(*test, 2200, #PB_UTF8) = "test"
             Debug "yeah test..."
             
    DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
  While  NextDatabaseRow(90)
       string7$ = GetDatabaseString(90, 1)
       PokeS(*Buffer, string7$, 1000, #PB_UTF8)
     
       
  
   
            SendNetworkData(Key, *Buffer, 1000)  ; Send the buffer to the client
       

         
   
    


      Debug string7$
      PrintN (string7$)
      ReAllocateMemory(*Buffer, 1000)
    Wend
     
    
     FinishDatabaseQuery(90)
           
           
         
           
         
          
          
            
           ElseIf  PeekS(*test, 2200, #PB_UTF8) = "world"
             Debug "Hello world!"
           
            
       ElseIf ReceiveNetworkData(Key, *test, 1000)
             Debug PeekS(*test, 1000, #PB_UTF8)
         
           Data1$ = PeekS(*test, 1000, #PB_UTF8) 
           Debug PeekS(*test, 1000, #PB_UTF8) 
           Debug Data1$
          DatabaseQuery (90, "SELECT * FROM workorder")
               invfg15$ = "UPDATE workorder SET wo='"+Data1$+"' WHERE id=4"  
            ; Debug "Query success..."
            NextDatabaseRow(90)
       DatabaseUpdate(90, invfg15$)
           ; Debug "update db success..."
             ;Debug PeekS(*data, 5000, #PB_UTF8)
             Data2() 
          
      ; Debug "Update DB not working..."
      ; Debug DatabaseError()
    
     FinishDatabaseQuery(90)
   
       ;Debug "Query not working"
 
            Debug "data5 is execute..."
            Debug Data1$
            PrintN(PeekS(*test, 1000, #PB_UTF8))
            
          EndIf
           
       
      

           
          
          
            
          Case #PB_NetworkEvent_Disconnect
          Debug "PureBasic - Server Client "+Key+" has closed the connection..."
          PrintN("PureBasic - Server Client "+Key+" has closed the connection...")
         
         
  
      EndSelect
    
  ForEver
  
  
  
  ;----------------------------------------------------------------------------------------------------------------------------
  ;Footer
  
  
EndIf
   Debug "PureBasic - Server Click To quit the server."
     ClearList(Clients())
   CloseDatabase(90)
   CloseNetworkServer(0)
   CloseConsole()
End
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; CursorPosition = 133
; FirstLine = 129
; Folding = -
; EnableXP
; DPIAware
; UseMainFile = Main_Serveur.pb
; Executable = Serveur.run