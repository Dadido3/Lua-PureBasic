a, b = Test_Results('Hi there')
PB_Debug(a)				-- Should print: ereht iH
PB_Debug(tostring(b))	-- Should print: false

a, b = Test_Results('Test')
PB_Debug(a)				-- Should print: tseT
PB_Debug(tostring(b))	-- Should print: true