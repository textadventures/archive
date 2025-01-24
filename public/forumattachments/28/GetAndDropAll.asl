define options	
	debug on
	panes disabled
end define

define game <GetAll>

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
	
	
	'The "get all" command must precede the "get #@item" command,
	'otherwise it will never execute.  This is because Quest pattern
	'matches your input to the first available command: if "get #@item"
	'preceded "get all", then "get #@item" would match your player's
	'input of 'get all' before the "get all" command.
	command <get all> {
	
		'put the noPronoun property on the game object
		property <game; noPronoun>
		
		'cycle through the items
		set numeric <i; 0>
		for each object in <#quest.currentroom#> {
			if type <#quest.thing#; item> then {
				exec <get #quest.thing#>
				inc <i>
			}
		}
		
		if (%i% = 0) then msg <There is nothing to take here.>
		
		'remove the noPronoun property from the game object
		property <game; not noPronoun>
	}
	
	'The "get all" command must precede the "get #@item" command,
	'otherwise it will never execute.
	command <drop all> {
	
		'put the noPronoun property on the game object
		property <game; noPronoun>
		
		'cycle through the items
		set numeric <i; 0>
		for each object in <inventory> {
			exec <drop #quest.thing#>
			inc <i>			
		}
		
		if (%i% = 0) then msg <You have nothing to drop.>
		
		'remove the noPronoun property from the game object
		property <game; not noPronoun>
	}
	
	command <get #@item#> {
	
		if not got <#item#> then {
			if action <#item#; OnGet> then doaction <#item#; OnGet> else msg <You cannot take that.>
		}
		else {
			msg <You already have that.>
		}
	}
	
	command <drop #@item#> {
	
		if got <#item#> then {
			if action <#item#; OnDrop> then doaction <#item#; OnDrop> else msg <You cannot drop that.>
		}
		else {
			msg <You don't have that to drop.>
		}
	}
	
end define

define room <Home>
	
	alias <Home>
	look <You're home.>
	
	define object <apple>
	
		type <item>
		alias <apple>
		look <Yummy and good for you.>
		prefix <an>
		article <it>	
		
	end define
	
	define object <cake>
		
		type <item>
		alias <cake>
		look <Yummy and bad for you>
		prefix <a piece of>
		article <it>	
			
	end define
	
	define object <couch>		
		
		look <Comfy.>
		alias <couch>
		prefix <a>
		article <it>	
			
	end define
	
end define

define type <item>

	action <OnGet> {
	
		set string <this; $thisobject$>
		if property <game; noPronoun> then msg <You take the #@this#.> else msg <You take #(this):article#.>
		give <$thisobject$>
	}
	
	action <OnDrop> {
		
		set string <this; $thisobject$>
		if property <game; noPronoun> then msg <You drop the #@this#.> else msg <You drop #(this):article#.>
		lose <$thisobject$>
	}
	

end define
