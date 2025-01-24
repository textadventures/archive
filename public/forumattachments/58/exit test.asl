' "Exit script"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <Exit script>
	asl-version <410>
	start <room>
	game info <Created with QDK 4.1.4>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room>
	look <Type "change" to change the "east" script.>
	east msg <This is the initial east script.>
	command <change> action <room.east; script> msg <This is the NEW script!>
end define

