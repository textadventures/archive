define options	
	debug on
	panes disabled
end define

define game <AfterLeave>

	asl-version <410>
	gametype singleplayer
	start <Home>	
	game version <1.0>
	game author <J. Dobson>
	game copyright <© 2009 JDG Inc.>
	
	background <black>
	default fontname <arial>
	default fontsize <10>
	foreground <White>
	
	
	'Set your 'last room' variable here, equal to the start tag above.
	startscript {
	
		set string <quest.lastroom; Home>
	}
	
	'This script implements the AfterLeave action on a room, if the
	'action exists on a room.
	afterturn {
	
		if (#quest.currentroom# <> #quest.lastroom#) then {
		
			if action <#quest.lastroom#; AfterLeave> then {
				
				doaction <#quest.lastroom#; AfterLeave>
			}
			
			set <quest.lastroom; #quest.currentroom#>
		}
	}		
	
end define

define room <Frontyard>
	
	alias <Frontyard>
	look <You're in your frontyard.>	
	
	south <Home>
	
	'This overwrites the default AfterLeave script defined in the 'defaultroom'
	'type below.
	action <AfterLeave> {
	
		msg <|n(Over-written AfterLeave script fired for $thisobject$.)>
	}
	
end define

define room <Home>
	
	alias <Home>
	look <You're home.>		
	
	north <Frontyard>
	
	'Even though this room does not have it's own AfterLeave action defined,
	'it will inherit one from the 'defaultroom' type.  See below.
	
end define


'This is the definition for 'defaultroom'.  Anything you define here
'will automatically be inherited by any other room in your game.  Because
'the AfterLeave action has been defined here, every room will now have this
'action, even if you omit this action from any room particular room.

define type <defaultroom>

	action <AfterLeave> {
	
		msg <|n(Default AfterLeave script fired for $thisobject$)>
	}

end define