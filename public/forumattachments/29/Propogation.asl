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
	
	startscript {
	
		for each object in game {
		
			if action <#quest.thing#; Propogate> then doaction <#quest.thing#; Propogate>
		}
	}
	
	command <list all #cmd1# objects> {

		set numeric <i; 0>
		for each object in game {	

			if action <#quest.thing#; #cmd1#> then {

				inc <i>
				msg <    #quest.thing#>
			}
		}

		if (%i% = 0) then {
			msg <    No objects have that action.>
		}
		else {
			msg <|n    %i% total objects with the |b#cmd1#|xb action.>
		}
	}
	
	command <action #cmd1#:#cmd2#> {
	
		if exists <#cmd1#> then {
			if action <#cmd1#; #cmd2#> then {
	
				doaction <#cmd1#; #cmd2#>
				msg <    Action fired.>
	
			}
			else {
				msg <#cmd1# has no such action.>
			}
		}
		else {
			msg <No such object exists.>
		}
	}

	
end define

define room <Home>
	
	alias <Home>
	look <You're home.>	
	
end define

define room <inventory>

end define

define object <sword>

	alias <sword>
	prefix <a>
	article <it>
	look <Sharp.>
	
	action <Propogate> {
	
		set string <this; $thisobject$>
		set string <cloned; $Propogate(#this#; inventory)$>
	}

end define

'copies a master item into a new item, and then moves that item to the
'provided location

'parameter1 = the master item to clone
'parameter2 = the location where the item is to be placed
define function <Propogate>

	set string <Propogate_return; NULL>	

	set string <Propogate_p1; $parameter(1)$>
	set string <Propogate_p2; $parameter(2)$>

	if real <#Propogate_p1#> then {

		if real <#Propogate_p2#> then {

			set <Propogate_return; $GetNextClone(#Propogate_p1#)$>
			clone <#Propogate_p1#; #Propogate_return#; #Propogate_p2#>			
			action <#Propogate_return#; Propogate> msg <    Propogate action removed.>				
		}
		else {
			msg <Attempted to propogate base item '#Propogate_p1#' to non-existent location '#Propogate_p2#'.>
		}
	}
	else {
		msg <Attempted to propogate non-existent base item '#Propogate_p1#' to location '#Propogate_p2#'.>
	}
	
	return <#Propogate_return#>

end define

'clones a master item, returning a duplicate

'parameter1 = the master item to be cloned
define function <GetNextClone>

	set string <GetNextClone_return; NULL>
	set string <GetNextClone_p1; $parameter(1)$>
	set numeric <iNumOfClones; 1>
	set numeric <bCloned; 0>	
	
	repeat while (%bCloned% = 0) {
	
		if real <#GetNextClone_p1#_%iNumOfClones%> then {
			inc <iNumOfClones>
		}
		else {
			set <GetNextClone_return; #GetNextClone_p1#_%iNumOfClones%>
			inc <bCloned>
		}
	}	
	
	return <#GetNextClone_return#>	

end define

