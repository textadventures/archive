' "door"
' Created with QDK Lite 4.1.2

!include <stdverbs.lib>

define game <door>
	asl-version <410>
	start <room1>
	game info <Created with QDK Lite 4.1.2>
	verb <unlock> msg <You can't unlock that.>
	verb <lock> msg <You can't lock that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room1>
	south locked <room2>

	define object <door1>
		alias <door>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			if ( #door1:door1locked# = 1 ) then msg <door is locked> else {
				unlock <room1; south>
				property <door1; door1closed=0>
				msg <the door is now open.> }
		}
		close {
			lock <room1; south>
			property <door1; door1closed=1>
			msg <the door is closed>
		}
		list off
		properties <door1locked = 1; door1closed = 1>
		action <unlock> {
			if got <key> then {
				if ( #door1:door1locked# = 1 ) then {
					msg <you unlocked the door>
					property <door1; door1locked=0> } else msg <the door is not locked> } else msg <you need a key!>
		}
		action <lock> {
			if got <key> then {
				if ( #door1:door1closed# = 1 ) then property <door1; door1locked=1> else msg <the door is not closed>
				if ( #door1:door1locked# = 1 ) then msg <the door is now locked> }
		}
	end define

	define object <key>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <room2>
	north <room1>

	define object <door2>
		alias <door>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			if ( #door2:door2locked# = 1 ) then msg <door is locked> else {
				unlock <room2; north>
				property <door2; door2closed=0>
				msg <the door is now open.> }
		}
		close {
			lock <room2; north>
			property <door2; door2closed=1>
			msg <the door is closed>
		}
		list off
		properties <door2locked = 0; door2closed = 0>
		action <unlock> {
			if got <key> then {
				if ( #door2:door2locked# = 1 ) then {
					msg <you unlocked the door>
					property <door2; door2locked=0> } else msg <the door is not locked> } else msg <you need a key!>
		}
		action <lock> {
			if got <key> then {
				if ( #door2:door2closed# = 1 ) then property <door2; door2locked=1> else msg <the door is not closed>
				if ( #door2:door2locked# = 1 ) then msg <the door is now locked> }
		}
	end define

end define

