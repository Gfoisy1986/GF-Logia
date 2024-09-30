
Port = 6832


 ConnectionID = OpenNetworkConnection("127.0.0.1", Port)

   
If ConnectionID
OpenWindow(40, 0, 0, 800, 560, "GF_Logia", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  ButtonGadget(100, 0, 0, 150, 30, "Exit") 
  ButtonGadget(102, 200, 0, 150, 30, "Data change")
  Debug "Connected!"

   ; SendNetworkString(ConnectionID, "Hello From Gui !", #PB_UTF8)
  ListViewGadget(137, 0, 30, 200, 300,  #PB_ListView_ClickSelect) 
   SetGadgetColor(137, #PB_Gadget_BackColor, $F3C8F3)
 



   
   
    Repeat
     Event = WaitWindowEvent()
    Network = NetworkClientEvent(ConnectionID) 

  
Select Network

    
    
    
           Case #PB_NetworkEvent_Data 
                *data2 = AllocateMemory(2000)
If ReceiveNetworkData(ConnectionID, *data2, 2000)
   
 AddGadgetItem(137, -1, PeekS(*data2, 2000, #PB_UTF8))

    Debug PeekS(*data2, 2000, #PB_UTF8)
    ReAllocateMemory(*data2, 2000)
  
  
  EndIf
FreeMemory(*data2)


       
 EndSelect
 
 
 
 Select Event
     
       Case #PB_Event_Gadget
         Select EventGadget()
            
             
             
           Case 100 : End
           Case 102 : 
             
             
             ClearGadgetItems(137)
          

   *data3 = AllocateMemory(3000)
      string3$ = "update Data2"
      Debug string3$
      
       PokeS(*data3, string3$, 3000, #PB_UTF8)
       SendNetworkData(ConnectionID, *data3, 3000)
       FreeMemory(*data3)
        *data4 = AllocateMemory(4000)
    ReceiveNetworkData(ConnectionID, *data4, 4000)
   Debug PeekS(*data4, 4000, #PB_UTF8)
    FreeMemory(*data4)
             
         EndSelect
       
       Case #PB_Event_Menu
         Select EventMenu()
           Case 1 : Debug "Menu item 1 clicked!"
           Case 2 : Debug "Menu item 2 clicked!"
           Case 3 : Debug "Menu item 3 clicked!"
         EndSelect
    
     EndSelect
     
 ForEver
   
 
EndIf

 

  
          
 
  


       
     


           
 
   
   
     
       
; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; CursorPosition = 74
; FirstLine = 64
; EnableThread
; EnableXP
; DPIAware
; Executable = client.run
; Compiler = PureBasic 6.12 LTS (Linux - x64)
; EnablePurifier