' "Test the talking"
' Created with QDK Lite 4.1.2

!include <stdverbs.lib>

define game <Test the talking>
	asl-version <410>
	start <Place>
	game info <Created with QDK Lite 4.1.2>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Place>
	look <This is the place>

	define object <man>
		speak choose <M1>
		displaytype <Character>
		article <him>
		gender <he>
	end define

end define

define selection <M1>
	info <What do you want to say?>
	choice <"Good morning, Sir. Could you tell me the time?"> choose <M2>
	choice <"Hello, give me your money!"> choose <M3>
	choice <"Could you tell me the way to Foxborough Castle in Middlesex Hampton near BottomHall-Callbridge?"> choose <M4>
end define
define selection <M2>
	info <Man: "Yes, of course. It is teatime now.">
	choice <"Thank you and have a nice day"> msg <>
end define
define selection <M3>
	info <Man: "HELP!!! HELP!!! I am getting robbed!">
	choice <"OK OK, shut up, I will go now."> msg <You run away.>
end define
define selection <M4>
	info <Man: "Oh yes, just wlak down this street, turn left at the green house over there. Then get the bus, drive 5 kilometers, ask the butcher there and he will tell you the price for his famous sausages">
	choice <"Oh, I love sausages."> msg <>
end define
