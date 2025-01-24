' "Computer Menu"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <Computer Menu>
	asl-version <410>
	start <Computer room>
	game author <Ally (RedTulip)>
	game version <1.0>
	game copyright <©>
	game info <Showing a way to make an entrance appear with the correct password.>
	verb <turn off; switch off> msg <You can't turn off that.>
	verb <turn on; switch on> msg <You can't turn on that.>
	verb <use> msg <You can't use that.>
	verb <restart> msg <You can't restart that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Computer room>
	alias <Computer Room>
	prefix <The>
	look <A room with only |ione|xi computer.>
	east locked <Exit; It's locked.>

	define object <computer>
		look if flag <on> then msg <The computer is on.> else msg <The computer is off.>
		speak <You can't speak to it.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <turn off> {
			if flag <on> then {
				msg <Turned off.>
				flag off <on> } else msg <It's already turned off.>
		}
		action <turn on> {
			if flag <on> then msg <It's already turned on.> else {
				msg <Turned on.>
				flag on <on> }
		}
		action <use> {
			if flag <on> and not flag <system_locked> then choose <computer menu> else {
				if not flag <on> then msg <Turn it on, first.>
				if flag <system_locked> then msg <You have to restart it.> }
		}
		action <restart> {
			if flag <system_locked> then {
				msg <Restarted.>
				flag off <system_locked> } else {
				if not flag <on> then msg <It's turned off.> else msg <Why bother?> }
		}
	end define

end define

define room <Exit>
	alias <exit>
	prefix <the>
	look <You have exited the computer room.>
	west <Computer room>
end define

define selection <computer menu>
	info <The Computer Menu>
	choice <Unlock door> {
		msg <Type the correct password.>
		enter <password>
		select case <#password#> {
			case <correctpassword> {
				msg <Correct.>
				flag on <unlocked>
				unlock <Computer room; east>
				action <computer; use> choose <emails>}
			case else {
				msg <Incorrect password, locking system.>
				flag on <system_locked>}
			}
	}
	choice <Emails> choose <emails>
end define
define selection <emails>
	info <Emails>
	choice <Inbox> choose <inbox>
	choice <Outbox> choose <outbox>
end define
define selection <inbox>
	info <Inbox>
	choice <Hey, what's up?> msg <|b|i4/12/2011|nFrom: Gerry|n|n|xb|xiMy sister asked if you're fine. That's all she's gotta say, bye.>
	choice <Moooney...> msg <|b|i2/15/2010|nFrom: Nai|n|n|xbWhy're you not giving me back my money??? You owe me!|xi>
end define
define selection <outbox>
	info <Outbox>
	choice <Singing> msg <|b|i3/06/2010|nFrom: Youa|n|n|xb|xiLayla's learning how to sing. Aren't you happy for her?>
end define
