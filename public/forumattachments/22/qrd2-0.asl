' "RD2"
' Created with QDK Pro 4.1

!include <stdverbs.lib>

define game <RD2>
	asl-version <410>
	start <portal>
	game info <Created with QDK Pro 4.1>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <portal>
	prefix <the>
	look <The main portal.>
	script {
		set string <room_next; test room>
		create room <#room_next#>
		create exit west <portal; #room_next#>
	}
end define

