XIncludeFile "Libraries\Lua\Lua.pbi"

UseModule Lua

ProcedureC PB_Debug(*Lua_State)
  Debug PeekS(lua_tostring(*Lua_State, 1),-1, #PB_UTF8)
  ProcedureReturn 0 ; Number of results
EndProcedure

ProcedureC Test_Results(*Lua_State)
  String.s = PeekS(lua_tostring(*Lua_State, 1),-1, #PB_UTF8) ; Get the string parameter
  
  Debug "Test_Results() got called"
  
  If String = "Test"
    Result_Bool = #True
  Else
    Result_Bool = #False
  EndIf
  
  lua_pushstring(*Lua_State, ReverseString(String)) ; Return a string
  lua_pushboolean(*Lua_State, Result_Bool) ; Return a boolean true
  ProcedureReturn 2 ; Number of results (If this doesn't equal the number of pushes, there will be a memory leak)
EndProcedure

; #### Create the Lua-State
*Lua_State = luaL_newstate()

; #### Load some libraries
lua_pushcclosure(*Lua_State, @luaL_openlibs(), 0)
lua_call(*Lua_State, 0, 0)
;lua_callk(*Lua_State, 0, 0, 0, #Null)

; #### Return the lua version
Debug PeekD(lua_version(*Lua_State))

; #### Make our procedure Test() available in lua
lua_register(*Lua_State, "PB_Debug", @PB_Debug())
lua_register(*Lua_State, "Test_Results", @Test_Results())

; #### Call Test() with some UTF-8 string passed as parameter (Make sure the PB file is formatted as UTF-8)
Debug luaL_dostring(*Lua_State, "PB_Debug('tesä+¡m↓')")
Debug luaL_dostring(*Lua_State, "PB_Debug('hello')")

file$ = "Test.lua"

Debug "--- Run" + file$ + " script ---"

If luaL_dofile(*Lua_State, file$)
  ; #### Some error happened, return error message
  Debug PeekS(lua_tostring(*Lua_State, -1), -1, #PB_UTF8)
EndIf

;CreateThread()

;lua_close(l)
; IDE Options = PureBasic 5.42 LTS (Windows - x64)
; CursorPosition = 26
; Folding = -
; EnableUnicode
; EnableXP
; EnableCompileCount = 10
; EnableBuildCount = 0
; EnableExeConstant