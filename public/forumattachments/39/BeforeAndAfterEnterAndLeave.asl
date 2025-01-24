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
	
	'Initialize your 'last room' variable here, equal to the start tag above.
	startscript {
	
		set string <quest.lastroom; Home>		
	}
	
	'This script implements our own room description formatting, and
	'the BeforeEnter, AfterEnter, and AfterLeave actions of a room.
	description {
	
		if (#quest.lastroom# <> #quest.currentroom#) then {
		
			doaction <#quest.currentroom#; BeforeEnter>
			if not property <#quest.currentroom#; isEnterable> then {

				outputoff
				goto <#quest.lastroom#>
				outputon
			}
			else {		
			
				doaction <#quest.lastroom#; AfterLeave>				
				do <RoomDescription>				
				doaction <#quest.currentroom#; AfterEnter>
			}
		}
		else {
		
			do <RoomDescription>
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

'A procedure to describe rooms.
define procedure <RoomDescription>

	set <quest.lastroom; #quest.currentroom#>
				
	msg <|b|cr$capfirst(#(quest.currentroom):prefix#)$ $capfirst(#(quest.currentroom):alias#)$|xb|cb>	
	msg <>
	msg <#quest.lookdesc#  |xn>
	
	if ($lengthof(#quest.doorways#)$ > 0) then {
		
		msg <You can go #quest.doorways#.>
	}
	else {
		msg <>
	}
	
	if ($lengthof(#quest.formatobjects#)$ > 0) then {

		msg <>
		msg <You can see #quest.formatobjects#.>
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
	look <You're in the warm comfort of your house.>		
	
	north <Frontyard>
	
	'Even though this room does not have it's own AfterLeave action defined,
	'it will inherit one from the 'defaultroom' type.  See below.
	
	'Same goes for the BeforeLeave, BeforeEnter, and AfterEnter actions.
	
end define

define room <Frontyard>
	
	alias <front yard>
	prefix <your>
	look <You're in your frontyard.>	
	
	south <Home>
	north <Street>
	
	define object <apple>
	
		take
		alias <apple>
		prefix <an>
		article <it>
		look <Yummy.>
		
	end define
	
	'This overwrites the default BeforeEnter script defined in the 'defaultroom'
	'type below.
	action <BeforeEnter> {

		'If the player has the apple, remove the 'isEnterable' property from this
		'room, thereby making it non-enterable.  You should message the player
		'something relevant in this case.
		if got <apple> then {

			msg <You should leave the apple behind before you go to the front yard.>
			property <$thisobject$; not isEnterable>
		}
		else {
			property <$thisobject$; isEnterable>
		}
	}
	
	'This overwrites the default AfterEnter script defined in the 'defaultroom'
	'type below.
	action <AfterEnter> {
	
		msg <Gosh, it's cold out here.>
	}
	
	'This overwrites the default BeforeLeave script defined in the 'defaultroom'
	'type below.
	action <BeforeLeave> {
	
		'If the apple here, remove the 'isLeavable' property from this room,
		'thereby making it non-leave-able.  You should message the player
		'something relevant in this case.
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
		msg <|n(You've just left #(this):prefix# #@this#, and thank goodness - for it is not a very pretty front yard, and it offends your eyes.)>
	}
	
end define

define room <Street>

	alias <street>
	prefix <the>
	look <You're standing on a barren street.>	
	
	south <Frontyard>
	
	'Just like the Home room, this room inherits all of the stuff
	'from the 'defaultroom' type definition, directly below.

end define	

'*****THE DEFAULTROOM TYPE********


'This is the definition for 'defaultroom'.  Anything you define here
'will automatically be inherited by every other room in your game.  For instance,
'because the AfterLeave action has been defined here, every room will now have 
'this action, even if you do not define this action in any particular room.

define type <defaultroom>

	action <BeforeEnter> {
	
		'The property 'isEnterable' is set on a room by default to indicate
		'that it is, indeed, enterable.
		property <$thisobject$; isEnterable>
	}
	
	action <AfterEnter> {
		
		set string <this; $thisobject$>
		msg <|n(You've just entered #(this):prefix# #@this#.)>
	}
	
	action <BeforeLeave> {
	
		'The property 'isLeavable' is set on a room by default to indicate
		'that it is, indeed, leave-able.
		property <$thisobject$; isLeavable>
	}
	
	action <AfterLeave> {
	
		set string <this; $thisobject$>
		msg <|n(You've just left #(this):prefix# #@this#.)>
	}

end define