' "test"
' Created with QDK Lite 4.1.3

!include <stdverbs.lib>

define game <test>
	asl-version <410>
	start <test>
	game info <Created with QDK Lite 4.1.3>
	define variable <life>
		type numeric
		value <10>
		display <life: !>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <test>
	prefix <ein>
	look <look at the man>

	define object <man>
		look {
			msg <you feel bad looking at the man>
			set numeric <nr; $rand(1; 5)$>
			do <subLife(%nr%)>
		}
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define procedure <subLife>
	dec <life; $parameter(1)$>
	if ( %life% <= 0 ) then playerlose
end define

define text <lose>
upps, you died!
end define

