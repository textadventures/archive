' "Health"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <Health>
	asl-version <410>
	start <Bathroom>
	game author <RedTulip>
	game version <1.0>
	game info <A test for health.>
	startscript {
		set numeric <poison; 10>
		set numeric <pills; 10>
		set numeric <int_health; 100>
	}
	afterturn {
		select case <%int_health%> {
			case <10; 20; 30; 40> set string <Health; Sickly>
			case <50; 60; 70; 80; 90; 100> set string <Health; Healthy and Hearty>
			}
	}
	define variable <Health>
		type string
		value <Hale and Hearty>
		display <Health: !>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Bathroom>
	alias <bathroom>
	prefix <a>
	look <A simple bathroom. Nothing much seems to be in it.>

	define object <Poison>
		alias <poison>
		look {
			select case <%poison%> {
				case <10> msg <On the box are ten drops of poison.>
				case <9> msg <On the box are nine drops of poison.>
				case <8> msg <On the box are eight drops of poison.>
				case <7> msg <On the box are seven drops of poison.>
				case <6> msg <On the box are six drops of poison.>
				case <5> msg <On the box are five drops of poison.>
				case <4> msg <On the box are four drops of poison.>
				case <3> msg <On the box are three drops of poison.>
				case <2> msg <On the box are two drops of poison.>
				case <1> msg <On the box is a drop of poison.>
				case else msg <The bottle is empty.>
				}
		}
		take
		prefix <a bottle of>
		displaytype <Object>
		article <it>
		gender <it>
		use {
			select case <%poison%> {
				case <10; 9; 8; 7; 6; 5; 4; 3; 2; 1> {
					msg <You sip a drop of poison.>
					dec <poison; 1>
					dec <int_health; 10>}
				case else msg <The bottle is empty.>
				}
		}
		drop everywhere <Dropped.>
		properties <drips = 10>
	end define

	define object <pills>
		alt <pill; box>
		look {
			select case <%pills%> {
				case <10> msg <On the box are ten pills.>
				case <9> msg <On the box are nine pills.>
				case <8> msg <On the box are eight pills.>
				case <7> msg <On the box are seven pills.>
				case <6> msg <On the box are six pills.>
				case <5> msg <On the box are five pills.>
				case <4> msg <On the box are four pills.>
				case <3> msg <On the box are three pills.>
				case <2> msg <On the box are two pills.>
				case <1> msg <On the box is a pill.>
				case <0> msg <The box is empty.>
				}
		}
		take <Taken.>
		prefix <a box of>
		displaytype <Object>
		article <it>
		gender <it>
		use {
			select case <%pills%> {
				case <10; 9; 8; 7; 6; 5; 4; 3; 2; 1> {
					msg <You pop a pill into your mouth.>
					dec <pills; 1>
					inc <int_health; 10>}
				case else msg <The box is empty.>
				}
		}
		drop everywhere <Dropped.>
	end define

end define

