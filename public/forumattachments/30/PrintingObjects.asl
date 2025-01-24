define options	
	debug on
	panes disabled
end define

define game <Propogation>

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
	
	command <look all; look room> {
	
		do <ShowObjects(#quest.currentroom#)>
	}
	
	command <inventory; i> {
	
		do <ShowObjects(inventory)>
	}
	
end define

define room <Home>
	
	alias <Your Home>
	look <You're home.>	
	
	define object <apple>
	
		type <item>
		
		alias <apple>
		prefix <an>
		look <It's red.>
	
	end define
	
	define object <orange>
		
		type <item>
		
		alias <orange>
		prefix <an>
		look <It's orange.>

	end define
	
	define object <banana>
		
		type <item>
		
		alias <banana>
		prefix <a>
		look <It's yellow.>

	end define
	
	define object <Sue>
			
		alias <Sue>		
		prefix <>
		look <She's tall.>
	
	end define
	
end define

'parameter1 = any room
define procedure <ShowObjects>

	set string <sRoomObjects; >
	set string <sLocation; $parameter(1)$>
	set numeric <i; 0>
	
	if (#sLocation# <> inventory) then {
	
		msg <In the room you can see |xn>
	}
	else {
		msg <In your inventory you have |xn>
	}
	
	for each object in <#sLocation#> {
		if not property <#quest.thing#; hidden> then inc <i>
	}

	if (%i% <> 0) then {

		set numeric <n; 0>
		for each object in <#sLocation#> {
			if not property <#quest.thing#; hidden> then {
				inc <n>

				if (%n% = 1) then {
					if ($lengthof(#(quest.thing):prefix#)$ > 0) then {
						set <sRoomObjects; #(quest.thing):prefix# #@quest.thing#>
					}
					else {
						set <sRoomObjects; #@quest.thing#>
					}
				}
				else {
					if (%i% = %n%) then {
						if ($lengthof(#(quest.thing):prefix#)$ > 0) then {
							set <sRoomObjects; #sRoomObjects# and #(quest.thing):prefix# #@quest.thing#>
						}
						else {
							set <sRoomObjects; #sRoomObjects# and #@quest.thing#>
						}
					}
					else {
						if ($lengthof(#(quest.thing):prefix#)$ > 0) then {
							set <sRoomObjects; #sRoomObjects#, #(quest.thing):prefix# #@quest.thing#>
						}
						else {
							set <sRoomObjects; #sRoomObjects#, #@quest.thing#>
						}
					}
				}
			}
		}

		set <sRoomObjects; #sRoomObjects#.>
		msg <#sRoomObjects#>
	}		
	else {
		msg <nothing.>
	}

end define

define type <item>

	take
	
end define