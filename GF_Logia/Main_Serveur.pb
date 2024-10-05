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
  EndStructure
  
  

 ;--------------------------------------------------------------------------------------------------------------------------   
   ;List:

Global NewList Programm.Client()  ; The list for storing the elements

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
  
EndProcedure
   
  
  Procedure.i Key()  ; Simulate an event client function
    Static clientID.i = 0
    clientID + 1
    ProcedureReturn clientID
EndProcedure
  
  
  
  ;_______________________________________________________________________________________________________________________________
  ;Main forms
  
  InitNetwork()
serverID =    CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

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
    
    
    
    
     
             
    
    
    
     Select ServerEvent
         
            

         Case #PB_NetworkEvent_None


        

     



          

    



  
           
                
         Case #PB_NetworkEvent_Connect
             
    
    *Element.Client = AddElement(Programm())  ; Add a new element to the list
    If *Element <> 0  ; Check if the element was successfully allocated
        *Element\Id = "Client"+Str(EventClient())  ; Assign the ID to the new element
        Debug "Added client with ID: " + *Element\Id
    Else
        MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
    EndIf 
          
        

           
   
 ForEach Programm()
   
   Debug Programm()\Id
   
Next
           
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
     ClearList(Programm())
   CloseDatabase(90)
   CloseNetworkServer(0)
   CloseConsole()
End
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
; IDE Options = PureBasic 5.73 LTS (Windows - x86)
; CursorPosition = 40
; FirstLine = 12
; Folding = -
; EnableXP
; DPIAware
; Executable = Serveur.run
; CPU = 2
; Compiler = PureBasic 5.73 LTS (Windows - x86)