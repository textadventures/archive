' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <Room 1>
	game info <Created with QDK 4.1.4>
	startscript lock <Room 1; Room 2>
	command <Unlock> unlock <Room 1; Room 2>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Room 1>
	north <Room 2>
end define

define room <Room 2>
	south <Room 1>
end define

