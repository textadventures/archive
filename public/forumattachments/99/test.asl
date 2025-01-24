' Created with QDK Lite 4.1.3

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <house>
	game info <Created with QDK Lite 4.1.3>
	verb <bite> msg <You can't bite that.>
	define variable <health>
		type numeric
		value <100>
		display nozero <Health: !>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <house>
	look <type 'bite dog' !>

	define object <dog>
		displaytype <Object>
		article <it>
		gender <it>
		action <bite> {
			msg <The dog bites back.>
			set numeric <health; %health%-2>
		}
	end define

end define

