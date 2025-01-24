' Created with QDK Lite 4.1.3

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <test>
	game info <Created with QDK Lite 4.1.3>
	beforeturn {
		if ( $instr( #quest.command#; shit)$ > 0 ) then {
			msg <bad word>
			dontprocess }
	}
	verb <take> msg <You can't take that.>
	define variable <Test>
		type numeric
		value <0>
		display <test: !>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <test>

	define object <book>
		displaytype <Object>
		article <it>
		gender <it>
		action <take> {
			give <book>
			reveal <book>
		}
	end define

end define

