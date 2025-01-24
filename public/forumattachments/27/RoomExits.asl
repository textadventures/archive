define options	
	debug on
	panes disabled
end define

define game <RoomList>

	asl-version <410>
	gametype singleplayer
	start <Home>	
	game version <1.0>
	game author <J. Dobson>
	game copyright <© 2008 JDG Inc.>
	
	background <black>
	default fontname <arial>
	default fontsize <10>
	foreground <White>
	
	description {
	
		msg <|b#(quest.currentroom):alias#|xb|n>
		msg <#(quest.currentroom):look#|n>
		
		for each exit in <#quest.currentroom#> {
			set numeric <i; $lengthof(#quest.thing#)$ - $instr(#quest.thing#;.)$>
			set string <s; $right(#quest.thing#; %i%)$>
			msg <|b$capfirst(#s#)$:|xb |cl#(quest.thing):to#|cb>
		}
	}
	
end define

define room <Home>
	
	alias <Home>
	look <You're home.>
	
	north <Backyard>
	south <Frontyard>
	
end define

define room <Backyard>
	
	alias <Backyard>
	look <You're in the backyard.>	
	
	south <Home>
	
end define

define room <Frontyard>
	
	alias <Frontyard>
	look <You're in the frontyard.>	
	
	north <Home>
	
end define
