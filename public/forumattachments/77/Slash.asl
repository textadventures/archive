' "Slash"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <Slash>
	asl-version <410>
	start <slash>
	game info <Created with QDK 4.1.4>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <slash>

	define object <knife>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <outlet>
		displaytype <Object>
		article <it>
		gender <it>
		use <knife> {
			msg <You get hurt, and die.>
			playerlose
		}
	end define

end define

