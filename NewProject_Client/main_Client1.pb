
Port = 6832

*data2 = AllocateMemory(2000)


 



ConnectionID = OpenNetworkConnection("127.0.0.1", Port)
If ConnectionID
OpenConsole()












PrintN("Guillaume Foisy")
;
SendNetworkString(ConnectionID, "Hello From Gui !", #PB_UTF8)
Repeat
  




    PrintN(PeekS(*data2, 2000, #PB_UTF8))
    Debug ""+PeekS(*data2, 2000, #PB_UTF8)
  

   

 

  Until ReceiveNetworkData(ConnectionID, *data2, 2000) = -1
   FreeMemory(*data2)
EndIf


; IDE Options = PureBasic 6.12 LTS (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 25
; FirstLine = 23
; EnableThread
; EnableXP
; DPIAware
; Executable = client.run
; Compiler = PureBasic 6.12 LTS (Linux - x64)
; EnablePurifier