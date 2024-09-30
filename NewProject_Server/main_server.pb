;
; ------------------------------------------------------------
;
;   PureBasic - Network (Server) example file
;
;    (c) Fantaisie Software
;
; ------------------------------------------------------------
;
; Note: run the NetworkClient.pb file to send some data to this server
;

UseSQLiteDatabase()

 



         
         
          

  
            

  
  
  
Port = 6832

  

  Procedure Data2()
     ClientID = EventClient()
   Filename$ = "myDatabase.sqlite3"
 If OpenDatabase(90, Filename$, "", "", #PB_Database_SQLite)
    Debug "Connected to myDatabase.sqlite3"
      EndIf
    *data2 = AllocateMemory(2000)
   DatabaseQuery(90, "SELECT * FROM workorder WHERE status='1'", #PB_Database_DynamicCursor)
      
   
    ;Debug "PureBasic - Server - A new client has connected !"
    While NextDatabaseRow(90)
       string$ = GetDatabaseString(90, 1)
     
      Debug string$
      PrintN (string$)
       PokeS(*data2, string$, 2000, #PB_UTF8)
       SendNetworkData(ClientID, *data2, 2000)
       ReAllocateMemory(*data2, 2000)
     Wend
     
          
     FinishDatabaseQuery(90)
     CloseDatabase(90)
 FreeMemory(*data2)
    
EndProcedure

  
If CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

  Debug "PureBasic - Server created (Port "+Port+")."

  OpenConsole("GF_Logia_Server", #PB_UTF8)
     ConsoleTitle("GF_Logia_Server")
   
Debug "Console Launch!"

  Repeat
      
    ServerEvent = NetworkServerEvent()
    ClientID = EventClient()
   
    
     
      Select ServerEvent
          
              
              
              
          
          
          
        Case #PB_NetworkEvent_Connect
          Debug "PureBasic - Server A new client has connected !"
          ;SendNetworkString(ClientID, "hello", #PB_UTF8)
             Data2()
     
     
     
         
    
    
   
    
  
 
          
        
        Case #PB_NetworkEvent_Data
         *data3 = AllocateMemory(3000)
             If ReceiveNetworkData(ClientID, *data3, 3000) :
            
           
          *data4 = AllocateMemory(4000)
      string4$ = "update Data4"
      Debug string4$
      
       PokeS(*data4, string4$, 4000, #PB_UTF8)
       If SendNetworkData(ClientID, *data4, 4000)
         Data2()
         EndIf
       FreeMemory(*data4)
       Delay(30)
              
         Debug PeekS(*data3, 3000, #PB_UTF8)
         PrintN(PeekS(*data3, 3000, #PB_UTF8))
                FreeMemory(*data3)
         EndIf
          *data = AllocateMemory(1000)
          If ReceiveNetworkData(ClientID, *data, 1000) :
          


  
           Debug PeekS(*data, 1000, #PB_UTF8)
           PrintN(PeekS(*data, 3000, #PB_UTF8))
            FreeMemory(*data)
           EndIf
          
           
           
        Case #PB_NetworkEvent_Disconnect
          Debug "PureBasic - Server Client "+ClientID+" has closed the connection..."
          PrintN("PureBasic - Server Client "+ClientID+" has closed the connection...")
         ; Quit = 1
    
      EndSelect
  
    
  Until Quit = 1
  
 
Else
  Debug "Error Can't create the server (port in use ?)."
EndIf

          
    
   Debug "PureBasic - Server Click To quit the server."
 
  CloseDatabase(90)
  CloseNetworkServer(0)
  CloseConsole()
End
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 112
; FirstLine = 97
; Folding = -
; EnableXP
; DPIAware
; UseMainFile = main_server.pb
; Executable = server.run