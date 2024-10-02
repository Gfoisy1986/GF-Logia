

UseSQLiteDatabase()
  Filename$ = "myDatabase.sqlite3"
 If OpenDatabase(90, Filename$, "", "", #PB_Database_SQLite)
    Debug "Connected to myDatabase.sqlite3"
      EndIf
 



         
         
          

  
            

  
  ClientID = EventClient()
Port = 6832

*data = AllocateMemory(1000)
*test = AllocateMemory(2200)
 *Buffer = AllocateMemory(1000)
  Procedure Data2()
     ClientID = EventClient()
    *Buffer = AllocateMemory(1000)
    
    DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
      
   
    ;Debug "PureBasic - Server - A new client has connected !"
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
   
 

          serverID =    CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

If serverID
 
  Debug "PureBasic - Server created (Port "+Port+")."

  OpenConsole("GF_Logia_Server", #PB_UTF8)
     ConsoleTitle("GF_Logia_Server")
   
Debug "Console Launch!"

       
;Data2()
         
  Repeat
      
    ServerEvent = NetworkServerEvent()
    ClientID = EventClient()
    
    
    
    
     
             
    
    
    
     Select ServerEvent
   
         Case #PB_NetworkEvent_None


         
     
    
          
           
                
        Case #PB_NetworkEvent_Connect
          Debug "PureBasic - Server A new client has connected !"
          ;SendNetworkString(ClientID, "hello", #PB_UTF8)
            Data2()
            
          ;   *test = AllocateMemory(2200)
        ;  If ReceiveNetworkData(ClientID, *test, 2200) > 0
            
          ;         Data2()
       
        ;  Debug "test3 is execute..."
        ;   Debug PeekS(*test, 2200, #PB_UTF8)
         
       ; EndIf
     ;  FreeMemory(*test)
      
        
        Case #PB_NetworkEvent_Data
       
          
          ReceiveNetworkData(ClientID, *test, 2200)
          
          
          
           If PeekS(*test, 2200, #PB_UTF8) = "test"
             Debug "yeah test..."
             Data2()
           
           
           
           
         
          
          
            
           ElseIf  PeekS(*test, 2200, #PB_UTF8) = "world"
             Debug "Hello world!"
            
            
       ElseIf ReceiveNetworkData(ClientID, *test, 1000)
          
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
          Debug "PureBasic - Server Client "+ClientID+" has closed the connection..."
          PrintN("PureBasic - Server Client "+ClientID+" has closed the connection...")
         ; Quit = 1
    
      EndSelect
  
     
  ForEver
  
 


          
    EndIf
   Debug "PureBasic - Server Click To quit the server."
      
 CloseDatabase(90)
  CloseNetworkServer(0)
  CloseConsole()
End
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 130
; FirstLine = 135
; Folding = -
; EnableXP
; DPIAware
; UseMainFile = main_server.pb
; Executable = server.run