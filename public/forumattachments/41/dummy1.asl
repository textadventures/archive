' Created with QDK Pro 4.1.1

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <room1>
	game info <Created with QDK Pro 4.1.1>
	command <take #@command1#> {
		if property <#command1#; parent> then {
			msg <(first taking if from the #(command1):parent#)> }
		msg <You pick up the #@command1#.>
		give <#command1#>
	}
	command <look at #@command1#> {
		exec <look at #@command1#; normal>
		if property <#command1#; container> then {
			set numeric <a; 0>
			for each object in <#quest.currentroom#> {
				if ( #(quest.thing):parent# = #command1# ) then {
					inc <a; 1>
					if ( %a% = 1 ) then msg <It contains...>
					msg <#quest.thing#> } } }
	}
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room1>

	define object <object1>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open
		close
		add
		remove
		list off
	end define

	define object <object2>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <object3>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

