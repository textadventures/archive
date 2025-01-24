define options	
	debug on
	panes disabled
end define

define game <BeforeAndAfterLeave>

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
	
	'This script implements the AfterLeave action on a room
	
	afterturn {
	
		if (#quest.currentroom# <> #quest.lastroom#) then {		
			
			doaction <#quest.lastroom#; AfterLeave>			
			set <quest.lastroom; #quest.currentroom#>
		}
	}
	
	'This script implements the BeforeLeave action on a room.
	beforeturn {
	
		select case <#quest.command#> {
		
			case <north; south; west; east; up; down; northwest; northeast; southwest; southeast> {

				doaction <#quest.currentroom#; BeforeLeave>
				if not property <#quest.currentroom#; isLeavable> then dontprocess		
			}
		}		
	}
			
	
end define

'These synonyms are required in order to make the BeforeLeave functionality
'effective, even though Quest already understands the short-forms for travel
'directions.

define synonyms

	n = north
	s = south
	e = east
	w = west
	u = up
	d = down
	nw = northwest
	ne = northeast
	sw = southwest
	se = southeast
	
end define

define room <Home>
	
	alias <home>
	prefix <your>
	look <You're home.>		
	
	north <Frontyard>
	
	'Even though this room does not have it's own AfterLeave action defined,
	'it will inherit one from the 'defaultroom' type.  See below.
	
	'Same goes for the BeforeLeave action, which is also inherited.
	
end define

define room <Frontyard>
	
	alias <front yard>
	prefix <your>
	look <You're in your frontyard.  It's damn cold out here.>	
	
	south <Home>
	
	define object <apple>
	
		take
		alias <apple>
		prefix <an>
		article <it>
		look <Yummy.>
		
	end define
	
	'This overwrites the default BeforeLeave script defined in the 'defaultroom'
	'type below.
	action <BeforeLeave> {
	
		if here <apple> then {
			
			msg <You should take the apple before you leave.>
			property <$thisobject$; not isLeavable>
		}
		else {
			property <$thisobject$; isLeavable>
		}
	}
	
	'This overwrites the default AfterLeave script defined in the 'defaultroom'
	'type below.
	action <AfterLeave> {
	
		set string <this; $thisobject$>
		msg <|n(You've just left #(this):prefix# #@this#, and thank goodness - it was cold out there!)>
	}
	
end define


'*****THE DEFAULTROOM TYPE********


'This is the definition for 'defaultroom'.  Anything you define here
'will automatically be inherited by every other room in your game.  For instance,
'because the AfterLeave action has been defined here, every room will now have 
'this action, even if you do not define this action in any particular room.

define type <defaultroom>

	'isLeavable
	
	action <BeforeLeave> {
	
		property <$thisobject$; isLeavable>
	}
	
	action <AfterLeave> {
	
		set string <this; $thisobject$>
		msg <|n(You've just left #(this):prefix# #@this#.)>
	}

end define