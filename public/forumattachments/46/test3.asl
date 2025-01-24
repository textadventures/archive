' Created with QDK Lite 4.1.2

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <start>
	game info <Created with QDK Lite 4.1.2>
	command <land> {
		if ( %height% > 0 ) then {
			if ( %height% > 200 ) then {
				goto <land1>
				set numeric <height; 0> }
			if ( %height% > 100 ) then {
				goto <land2>
				set numeric <height; 0> }
			if ( %height% > 1 ) then {
				goto <land3>
				set numeric <height; 0> }
			timeroff <height> }
	}
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <start>
	look <You are in the plane|ntype jump!>
	command <jump> {
		set numeric <height; 300>
		msg <you jump out of the plane>
		timeron <height>
	}
end define

define room <land1>
	look <Landing 1>
end define

define room <land2>
	look <Landing 2>
end define

define room <land3>
	look <Landing 3>
end define

define timer <height>
	interval <1>
	action {
		msg <Height: %height%>
		set numeric <height; %height% -10>
		msg <>
		if ( %height% = 0 ) then {
			msg <You crashed into the ground. This ist very painful.>
			timeroff <height> }
	}
	disabled
end define

