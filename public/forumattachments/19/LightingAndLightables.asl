' "Test Game"
' Created with QDK Pro 4.1 Beta

define game <Test Game>
	asl-version <410>
	start <StartRoom>
	game info <Created with QDK Pro 4.1 Beta>
	background <black>
	foreground <white>
	description {
		set string <roomtitle; |b|cl#quest.formatroom#|xb|cb>
		
		if property <#quest.currentroom#; indescription> then {
			set string <indescription; #(quest.currentroom):indescription#>
			if ( $right(#indescription#;1)$ = : ) then {
				set numeric <len; $lengthof(#indescription#)$ - 1>
				msg <$left(#indescription#;%len%)$ #roomtitle#.>
				} else msg <#indescription#>
			} else {
			msg <You are in #roomtitle#.>
			}
		
		if not ( #quest.doorways.out# =  ) then msg <You can go out to |cr#quest.doorways.out#.|cb>
		if not ( #quest.doorways.dirs# =  ) then msg <You can go |cr#quest.doorways.dirs#.|cb>
		if not ( #quest.doorways.places# =  ) then msg <You can go to |cr#quest.doorways.places#.|cb>
		if not ( #quest.objects# =  ) then msg <You can see |cy#quest.formatobjects#.|cb>
		if not ( #quest.lookdesc# =  ) then msg <#quest.lookdesc#>
	}
	command <light #@object1# with #@object2#> {
		
		if got <#object1#> then {
			if action <#object1#; OnLight> then {
				property <#object1#; with = #object2#>
				doaction <#object1#; OnLight>
				} else {
				
				msg <You cannot 'light' that.>
				}
			} else {
			
			msg <You must possess the #@object1# to light #(object1):article#.>
			}
		
	}
	verb <light: OnLight> msg <You cannot 'light' that.>
end define

define options
	debug on
	panes off
	abbreviations on
end define

define type <lightable>
	properties <with = NULL>
	action <OnLight> {
		
		set string <this; $thisobject$>
		
		if not property <#this#; lit> then {
			
			if got <#this#> or not property <#this#; take> then {
				
				if ( #(this):with# = NULL ) then {
					set string <lightingObject; $GetValidLightingObject$>
					if ( #lightingObject# <> NULL ) then {
						property <#this#; with = #lightingObject#>
						msg <(with #(lightingObject):prefix# #@lightingObject#) |xn>
						doaction <#this#; OnLight>
						} else {
						
						msg <You should find something to light #(this):article# with.>
						}
					} else {
					
					if type <#(this):with#; lighting> then {
						set numeric <i; $objectproperty(#(this):with#; uses)$>
						if ( %i% > 0 ) then {
							property <#this#; lit>
							dec <i>
							property <#(this):with#; uses = %i%>
							doaction <$thisobject$; AfterLight>
							if ( %i% = 0 ) then doaction <#(this):with#; WhenEmpty>
							} else {
							
							doaction <#(this):with#; UseWhenEmpty>
							}
						} else {
						
						set string <str; #(this):with#>
						msg <You cannot light the lamp with #(str):prefix# #@str#.>
						}
					}
				} else {
				
				msg <You must possess the #@this# to light #(this):article#.>
				}
			} else {
			
			msg <The #@this# is already lit.>
			}
		
		property <#this#; with = NULL>
	}
	action <AfterLight> 
end define

define type <lighting>
	properties <uses = 3>
	action <UseWhenEmpty> {
		
		set string <this; $thisobject$>
		msg <$capfirst(#(this):prefix# #@this# is all out.>
	}
	action <WhenEmpty> 
end define

define room <StartRoom>
	alias <Start Room>
	look <A most boring location.>
	north <NextRoom>
	south <NextNextRoom>
	east <AnotherRoom>

	define object <lamp>
		look <Just a lamp.>
		take
		prefix <an unlit>
		article <it>
	type <lightable>
	action <AfterLight> {
		
		msg <The lamp sputters, almost dies out, then burns brightly.>
		property <$thisobject$; prefix = a lit>
	}
	end define

	define object <campfire>
		look <Just a campfire.>
		prefix <a cold>
		article <it>
	type <lightable>
	action <AfterLight> {
		
		msg <You have a hard time getting it going, but eventually you bring to life a sizeable conflagration.>
		property <$thisobject$; prefix = a crackling>
	}
	end define

	define object <torch>
		look <Just a torch.>
		take
		prefix <a>
		article <it>
	type <lightable>
	action <AfterLight> {
		
		msg <The torch erupts in flame.>
		property <$thisobject$; prefix = a burning>
	}
	end define

	define object <candles>
		look <Just a bound set of candles.>
		take
		prefix <a bound set of>
		article <them>
	type <lightable>
	action <AfterLight> {
		
		msg <The candles flicker to life.>
		property <$thisobject$; prefix = a flickering set of>
	}
	end define

end define

define room <NextRoom>
	alias <North Room>
	look <A most boring Northerly location.>
	south <StartRoom>

	define object <matches>
		look <Just matches.>
		take
		prefix <a set of>
	type <lighting>
	action <UseWhenEmpty> {
		
		msg <You've used up all the matches.>
	}
	action <WhenEmpty> {
		
		msg <You've used up the last match.>
		property <$thisobject$; prefix = an empty set of>
	}
	end define

end define

define room <NextNextRoom>
	alias <South Room>
	look <A most boring Southerly location.>
	north <StartRoom>

	define object <lighter>
		look <Just a lighter.>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	type <lighting>
	properties <uses = 1>
	action <UseWhenEmpty> {
		
		msg <The lighter is out of fuel.>
	}
	action <WhenEmpty> {
		
		msg <It seems the lighter is now empty.>
		property <$thisobject$; prefix = a spent>
	}
	end define

end define

define room <AnotherRoom>
	west <StartRoom>
end define

define function <GetValidLightingObject>
	set string <return_string; NULL>
	set numeric <i; 0>
	for each object in <inventory> {
		if type <#quest.thing#; lighting> then {
			if ( #(quest.thing):uses# > 0 ) and ( %i% = 0 ) then {
				inc <i>
				set <return_string; #quest.thing#>
				}
			}
		}
	return <#return_string#>
end define

