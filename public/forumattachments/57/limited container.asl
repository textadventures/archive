' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <room>
	game info <Created with QDK 4.1.4>
	startscript set numeric <backpack count; 0>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room>

	define object <backpack>
		prefix <a small>
		displaytype <Object>
		article <it>
		gender <it>
		container
		opened
		add {
			if ( %backpack count% = 0 ) then {
				add <#quest.add.object.name#; backpack>
				inc <backpack count>
				msg <You put it in the backpack.> } else msg <The backpack is full.>
		}
		remove {
			remove <#quest.remove.object.name#>
			dec <backpack count>
			msg <You take it out of the backpack.>
		}
	end define

	define object <water>
		take
		prefix <a bottle of>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <chocolate>
		take
		prefix <a bar of>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

