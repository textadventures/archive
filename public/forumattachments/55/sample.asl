' "Test progie"
' Created with QDK Pro 4.1.2

!include <stdverbs.lib>

define game <Test progie>
	asl-version <410>
	start <Room A>
	game info <Created with QDK Pro 4.1.2>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Room A>
	east locked <Room B>

	define object <vent>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Inflate-o-Matic>
		take
		displaytype <Object>
		article <it>
		gender <it>
		use on <vent> {
			msg <The inflate-o-matic inflates and opens the vent.|nYay!>
			unlock <Room A; Room B>
		}
	end define

end define

define room <Room B>
	west <Room A>
end define

