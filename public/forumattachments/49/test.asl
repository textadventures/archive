' "test"
' Created with QDK Lite 4.1.3

!include <stdverbs.lib>

define game <test>
	asl-version <410>
	start <Start>
	game info <Created with QDK Lite 4.1.3>
	startscript {
		msg <Insert your name:>
		enter <name>
		msg <Hello #name#>
	}
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Start>
end define

