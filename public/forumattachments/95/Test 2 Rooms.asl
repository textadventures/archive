' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <Room A>
	game info <Created with QDK 4.1.5>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Room A>
	east locked <Room B; You can't go to Room B without a ticket.>

	define object <Ticket>
		look <Just a plain ordinary ticket to Room B.>
		take <You have the ticket.>
		lose lose <Ticket>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		use on <Doorman> unlock <Room A; Room B>
		give to <Doorman> {
			msg <You give the ticket to the doorman.>
			unlock <Room A; Room B>
		}
	end define

	define object <Doorman>
		look <He looks menacing at you...>
		prefix <a>
		displaytype <Character>
		article <him>
		gender <he>
		container
	end define

end define

define room <Room B>
	west <Room A>
end define

