













 ;_____________________________________________________________________________________________________________________________
  ;Variable
  
  Port = 6832
 *Buffer = AllocateMemory(1000)

 *data = AllocateMemory(1000)
  *test =  AllocateMemory(2200)
 
  
  
  
  
  
  
  ;---------------------------------------------------------------------------------------------------------------------------------
  ;Enumeration
  
  
  
  
  
  
  
  
  
  
  ;-----------------------------------------------------------------------------------------------------------------------------------
  ;Start Procedure
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ;_______________________________________________________________________________________________________________________________
  ;Main forms
  
  ConnectionID = OpenNetworkConnection("127.0.0.1", Port)
  
  If ConnectionID
    
OpenWindow(40, 0, 0, 800, 560, "GF_Logia", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
ButtonGadget(100, 0, 0, 150, 30, "Exit") 
ButtonGadget(101, 200, 40, 150, 30, "update") 
  ButtonGadget(102, 200, 0, 150, 30, "Data change")
  Debug "Connected!"

    ;SendNetworkString(ConnectionID, "Hello From Gui !", #PB_UTF8)
  ListViewGadget(137, 0, 30, 200, 300,  #PB_ListView_ClickSelect) 
   SetGadgetColor(137, #PB_Gadget_BackColor, $F3C8F3)


  
  
  
  
  
  ;--------------------------------------------------------------------------------------------------------------------------------
  ;Loops
  
  
    Repeat
     Event = WaitWindowEvent()
    Network = NetworkClientEvent(ConnectionID) 

  
Select Network

    
    
  Case #PB_NetworkEvent_Data 
   *Buffer = AllocateMemory(1000)
  
 
 
  
If ReceiveNetworkData(ConnectionID, *Buffer, 1000)
           
                 AddGadgetItem(137, -1, PeekS(*Buffer, 1000, #PB_UTF8))
         
           Debug PeekS(*Buffer, 1000, #PB_UTF8)
     EndIf 
       FreeMemory(*Buffer)

 
  



    
 EndSelect
 
 
 
 Select Event
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
             
             
           Case 100 : End
             
              Case 101 :
              
          
   
  
      
     
     
      
       PokeS(*test, "world", 2200, #PB_UTF8)
       SendNetworkData(ConnectionID, *test, 2200)
       
       
       invfg14$ = InputRequester("Modification du nouveau fournisseur #2.", "Veuillez entrer le nouveau fournisseur #2.", "")
        Debug invfg14$
       PokeS(*test, invfg14$, 1000, #PB_UTF8)
      
       SendNetworkData(ConnectionID, *test, 2200)
        SendNetworkData(ConnectionID, *test, 1000)
      ClearGadgetItems(137)
 

   
  
    
             
             
           Case 102 : 
             

             
          

        string3$ = "test"
       Debug string3$
      
         PokeS(*test, string3$, 2200, #PB_UTF8)
         SendNetworkData(ConnectionID, *test, 2200)
      ClearGadgetItems(137)
     
             
         EndSelect
       
       Case #PB_Event_Menu
         Select EventMenu()
           Case 1 : Debug "Menu item 1 clicked!"
           Case 2 : Debug "Menu item 2 clicked!"
           Case 3 : Debug "Menu item 3 clicked!"
         EndSelect
    
     EndSelect
     
   ForEver
   
   
   ;-------------------------------------------------------------------------------------------------------------------------------
   ;Footer
  
     
EndIf
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; CursorPosition = 185
; EnableXP
; DPIAware