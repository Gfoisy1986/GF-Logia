*Server = WebSocket_Server::Create(8090)


Procedure WebSocket_Event(*Server, *Client, Event, *Event_Frame.WebSocket_Server::Event_Frame) ; no need to worry about mutexes as this call is coming from your main loop
  Select Event
    Case WebSocket_Server::#Event_Connect
      PrintN(" #### Client connected: " + *Client)
      
    Case WebSocket_Server::#Event_Disconnect
      PrintN(" #### Client disconnected: " + *Client)
      ; !!!! From the moment you receive this event *Client must not be used anymore !!!!
      
    Case WebSocket_Server::#Event_Frame
      PrintN(" #### Frame received from " + *Client)
      
      ; #### OpCode is the type of frame you receive.
      ; #### It's either Text, Binary-Data, Ping-Frames or other stuff.
      ; #### You only need to care about text and binary frames.
      Select *Event_Frame\Opcode
        Case WebSocket_Server::#Opcode_Ping
          PrintN("      Client sent a ping frame")
        Case WebSocket_Server::#Opcode_Text
          PrintN("      Text received: " + PeekS(*Event_Frame\Payload, *Event_Frame\Payload_Size, #PB_UTF8|#PB_ByteLength))
        Case WebSocket_Server::#Opcode_Binary
          PrintN("      Binary data received")
          ; *Event_Frame\Payload contains the data, *Event_Frame\Payload_Size is the size of the data in bytes.
          ; !!!! Don't use the Payload after you return from this callback. If you need to do so, make a copy of the memory in here. !!!!
      EndSelect
      
  EndSelect
EndProcedure
WebSocket_Server::Frame_Text_Send(*Server, *Client, "Hello Client!")

Repeat
  WebSocket_Server::Event_Callback(*Server, *Callback)
  While WebSocket_Server::Event_Callback(*Server, @WebSocket_Event())
  Wend
  ; Other stuff
ForEver



Free(*Server)


































; IDE Options = PureBasic 5.60 (Linux - x64)
; CursorPosition = 34
; FirstLine = 28
; Folding = -
; EnableXP
; Executable = client.run