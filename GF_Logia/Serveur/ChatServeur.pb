UseSQLiteDatabase()
  Filename$ = "myDatabase.sqlite3"
  If OpenDatabase(90, Filename$, "", "")
    Debug "Connected to myDatabase.sqlite3"
  EndIf
  UseJPEGImageDecoder() 
                  
  
  
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
  
    Structure World
     Nick.s
     Message.s
  EndStructure

 ;--------------------------------------------------------------------------------------------------------------------------   
   ;List:

Global NewList Programm.Client()  ; The list for storing the elements
Global NewList Programm2.World()  ; The list for storing the elements
   ;-----------------------------------------------------------------------------------------------------------------------------------
  ;Start Procedure





 
  
Procedure Data2()
  
 
 *Frost = AllocateMemory(1100)
ClientID = EventClient()
        DatabaseQuery(90, "SELECT * FROM utilizateur", #PB_Database_DynamicCursor)
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
  
 
 


Procedure Wo()
 *Frost =    AllocateMemory(1100)
                 *charle =    AllocateMemory(1111)
  DatabaseQuery(90, "SELECT * FROM utilizateur", #PB_Database_DynamicCursor)
  While  NextDatabaseRow(90)
       string90$ = GetDatabaseString(90,0)
       PokeS(*charle, string90$, 1100, #PB_UTF8)
       Debug string90$
       
 
       string92$ = "charle"
       PokeS(*Frost, string92$, 1111, #PB_UTF8)
     Debug string92$
   
       ForEach Programm()
         
       Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
         
       SendNetworkData(Con, *charle, 1111)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
       
         Next         
         ReAllocateMemory(*charle, 1111)
   Wend 
                
     FreeMemory(*Frost)           
      FreeMemory(*charle)          
                
            FinishDatabaseQuery(90)   
EndProcedure

  
  Procedure inventaire()
      *sty = AllocateMemory(5501)
   *Frost =    AllocateMemory(1100)
  DatabaseQuery (90, "SELECT * FROM inventaire")
  While NextDatabaseRow(90)
    
       string90$ = "gui"
       PokeS(*Frost, string90$, 1100, #PB_UTF8)
     
     
     
     
                  str0.s = GetDatabaseString(90, 0)
                  PokeS(*sty, str0, 5501, #PB_UTF8)
                 
       ForEach Programm()
         
       Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
        SendNetworkData(Con, *sty, 5501)
       Debug Programm()\Con
       Debug Programm()\Id
       Debug str0
       Debug string90$
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
       
       
                  str1.s = GetDatabaseString(90, 1)
                  PokeS(*Frost8, str1, 191, #PB_UTF8)
                 
      
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
      *Element\Id = "Client ID  "+Str(EventClient()) ; Assign the ID to the new element
       *Element\Con = EventClient() ; Assign the Connection Client to the new element
        Debug "Added client with ID: " + *Element\Id
    Else
        MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
    EndIf 
          
           
                Debug "PureBasic - Server A new client has connected !"+ Str(EventClient())
                 
    
             
                
                
                
                
                
                
                
                




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

    
;              
           *Frost =    AllocateMemory(1100)
                   string13$ = "elie"
        PokeS(*Frost, string13$, 1100, #PB_UTF8)
        Debug string13$
;       
;        
        ForEach Programm()
           
         Con = Programm()\Con
        SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
         Debug Programm()\Con
         Debug Programm()\Id
         
          Next 
;               
             FreeMemory(*Frost)
            
; ;             
; ;              
; ;              
;              
          
             
     
           
            *Frost =    AllocateMemory(1100)
            *charle =    AllocateMemory(1111)
            *Alex =    AllocateMemory(2000)
            *Mario =    AllocateMemory(2003)
   DatabaseQuery(90, "SELECT * FROM utilizateur", #PB_Database_DynamicCursor)
   While  NextDatabaseRow(90)
       string90$ = GetDatabaseString(90, 32)
        PokeS(*charle, string90$, 1100, #PB_UTF8)
        Debug string90$
        FinishDatabaseQuery(90)
        
  DatabaseQuery(90, "SELECT * FROM utilizateur", #PB_Database_DynamicCursor)
        NextDatabaseRow(90)
        string209$ = GetDatabaseString(90, 34)
        PokeS(*Alex, string209$, 2000, #PB_UTF8)
        Debug string209$
        FinishDatabaseQuery(90)
        
        DatabaseQuery(90, "SELECT * FROM utilizateur", #PB_Database_DynamicCursor)
        NextDatabaseRow(90)
        string309$ = GetDatabaseString(90, 36)
        PokeS(*Mario, string309$, 2003, #PB_UTF8)
        Debug string309$
        FinishDatabaseQuery(90)
        
        string92$ = "charle"
        PokeS(*Frost, string92$, 1111, #PB_UTF8)
      Debug string92$
    
        ForEach Programm()
          
        Con = Programm()\Con
       SendNetworkData(Con, *Frost, 1100)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
          
        SendNetworkData(Con, *charle, 1111)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
       
        SendNetworkData(Con, *Alex, 2000)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
       
        SendNetworkData(Con, *Mario, 2003)  ; Send the buffer to the client
       Debug Programm()\Con
       Debug Programm()\Id
;        
          Next         
          ReAllocateMemory(*charle, 1111)
          ReAllocateMemory(*Alex, 2000)
          ReAllocateMemory(*Mario, 2003)
    Wend 
;                 
      FreeMemory(*Frost)           
       FreeMemory(*charle)          
      
       
        FreeMemory(*Alex)
        FreeMemory(*Mario)

; --------------------------------------------------------------------------------------------------------------------------           
;    Case Chat click    
    Case #PB_NetworkEvent_Data  
      
      
                
                   *Eric = AllocateMemory(500)
                   ReceiveNetworkData(Key, *Eric, 500)
                   Debug PeekS(*Eric, 500, #PB_UTF8)
                  If PeekS(*Eric, 500, #PB_UTF8) = "Eric"
                   ; DeleteElement(Programm2())
            
                    
                  
                  
                 ElseIf PeekS(*Eric, 500, #PB_UTF8) = "Eric2" 
                   Debug "JoinWorldChat!"
                   *EditS = AllocateMemory(10000)
                   ReceiveNetworkData(key, *EditS, 10000)
                   Text34567$ = PeekS(*EditS, 10000, #PB_UTF8)
              
                   Debug "Editor : "+PeekS(*EditS, 10000, #PB_UTF8)
       *Element2.World = AddElement(Programm2())  ; Add a new element to the list
     If *Element2 <> 0  ; Check if the element was successfully allocated
       *Element2\Nick = "Guest: "+Str(EventClient()) ;Assign the ID To the new element
        *Element2\Message = PeekS(*EditS, 10000, #PB_UTF8) ; Assign the Connection Client to the new element
       Debug "Added client with ID: " + *Element2\Nick
       Debug "Added client with ID: " + *Element2\Message
     Else
         MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
     EndIf 
  
                   
             
                 
                   ReAllocateMemory(*Eric, 500)
                   ReAllocateMemory(*EditS, 10000)
                   
             EndIf         
                   
;                ;    DatabaseQuery (90, "SELECT * FROM inventaire")
;             ;  While NextDatabaseRow(90)
;                     ;  str2.s = GetDatabaseString(90, 2)
;                     ;  PokeS(*Frost, str2, 192, #PB_UTF8)
;                       ForEach Programm()
;                       Con = Programm()\Con
;                      SendNetworkData(Con, *Frost, 192)
;                      Debug str2
;                             Debug Programm()\Con
;                           Debug Programm()\Id
;                    Next
;                       ReAllocateMemory(*Frost, 192)
;                    Wend 
                  ; FinishDatabaseQuery(90)
                 
      
      
      
      
      
;       *Element2.World = AddElement(Programm2())  ; Add a new element to the list
;     If *Element2 <> 0  ; Check if the element was successfully allocated
;       *Element2\Nick = ; ; Assign the ID to the new element
;        *Element2\Message = ;EventClient() ; Assign the Connection Client to the new element
;        Debug "Added client with ID: " + *Element2\Name
;        Debug "Added client with ID: " + *Element2\Message
;     Else
;         MessageRequester("Error!", "Unable to allocate memory for new element", #PB_MessageRequester_Ok)
;     EndIf 
;           
           
                Debug "Un utilisateur ces connecter au chat!  Client: "+ Str(EventClient())
             
  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
          
          
            
          Case #PB_NetworkEvent_Disconnect
          Debug "PureBasic - Server Client "+Key+" has closed the connection..."
          PrintN("PureBasic - Server Client "+Key+" has closed the connection...")
          DeleteElement(Programm())
          DeleteElement(Programm2())
  
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
; CursorPosition = 549
; FirstLine = 545
; Folding = -
; EnableThread
; EnableXP
; DPIAware
; Executable = ../GF_Logia/GF_Logia/Serveur/Serveur_x64.run
; Compiler = PureBasic 6.12 LTS (Linux - x64)