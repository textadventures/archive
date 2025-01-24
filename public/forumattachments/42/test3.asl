' "test3"
' Created with QDK Pro 4.1.1

!include <stdverbs.lib>

define game <test3>
	asl-version <410>
	start <room1>
	game info <Created with QDK Pro 4.1.1>
	description {
		set numeric <dummy1; 0>
		for each object in <#quest.currentroom#> if exists <#quest.thing#> then inc <dummy1; 1>
		msg <#quest.lookdesc#|n#quest.doorways.dirs#>
		set numeric <c2; #(quest.currentroom):c1#>
		if not ( %c2% = 0 ) then {
			if ( %c2% = 1 ) then {
				if ( %dummy1% > 0 ) then {
					if ( %dummy1% = 1 ) then msg <a coin and #quest.formatobjects# are here.> else msg <a coin, #quest.formatobjects# are here.> } else msg <There is a coin here.> } else {
				if ( %dummy1% > 0 ) then {
					if ( %dummy1% = 1 ) then msg <%c2% coins and #quest.formatobjects# are here.> else msg <%c2% coins, #quest.formatobjects# are here.> } else msg <There are %c2% coins here.> } } else {
			if ( %dummy1% = 0 ) then  else {
				if ( %dummy1% = 1 ) then msg <#quest.formatobject# is here.> else msg <#quest.formatobjects# are here.> } }
	}
	command <take coin> {
		set numeric <c2; #(quest.currentroom):c1#>
		if ( %c2% = 0 ) then msg <I don't see that here.> else {
			inc <coins; 1>
			dec <c2; 1>
			msg <You pick up a coin.>
			property <#quest.currentroom#; c1=%c2%> }
	}
	command <take coins> {
		set numeric <c2; #(quest.currentroom):c1#>
		if ( %c2% = 0 ) then msg <I don't see that here.> else {
			if ( %c2% = 1 ) then msg <You pick up a coin.> else msg <You take the coins.>
			inc <coins; %c2%>
			property <#quest.currentroom#; c1=0> }
	}
	command <drop coin> {
		set numeric <c2; #(quest.currentroom):c1#>
		if ( %coins% = 0 ) then msg <You don't have any coins.> else {
			dec <coins; 1>
			inc <c2; 1>
			msg <You drop a coin.>
			property <#quest.currentroom#; c1=%c2%> }
	}
	command <drop coins> {
		set numeric <c2; #(quest.currentroom):c1#>
		if ( %coins% = 0 ) then msg <You don't have any coins.> else {
			msg <You drop the coins.>
			inc <c2; %coins%>
			property <#quest.currentroom#; c1=%c2%>
			set numeric <coins; 0> }
	}
	define variable <coins>
		type numeric
		value <0>
		display nozero <You have ! coin*s*>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room1>
	look <You are in a room.>
	east <room2>
	properties <c1 = 20>

	define object <cup>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <room2>
	look <You are in a room.>
	west <room1>

	define object <spoon>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <fork>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

