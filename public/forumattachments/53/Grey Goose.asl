' "test bag"
' Created with QDK Pro 4.1.3

!include <stdverbs.lib>

define game <test bag>
	asl-version <410>
	start <Scotty's Bar>
	game info <Created with QDK Pro 4.1.3>
	verb <drink> msg <You can't drink that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Scotty's Bar>

	define object <Bottle of Grey Goose>
		take {
			enter <random>
			exec <$rand(1;100)$>
			msg <Your random number is $random$>
		}
		displaytype <Object>
		article <it>
		gender <it>
		container
		open
		close
		add
		remove
	end define

	define object <shot1>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <Bottle of Grey Goose>
	end define

	define object <shot2>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <Bottle of Grey Goose>
	end define

	define object <Empty Shot Glass>
		take
		displaytype <Object>
		article <it>
		gender <it>
		use <shot1> {
			if property <Full Shot Glass; in storage> then {
				move <Empty Shot Glass; storage>
				give <Full Shot Glass>
				property <Empty Shot Glass; in storage>
				property <Full Shot Glass; not in storage>
				remove <shot1>
				hide <shot1>
				msg <You pour a shot in the shot glass.> } else msg <Your shot glass is already full.>
		}
		use <shot2> {
			if property <Full Shot Glass; in storage> then {
				move <Empty Shot Glass; storage>
				give <Full Shot Glass>
				property <Empty Shot Glass; in storage>
				property <Full Shot Glass; not in storage>
				hide <shot2>
				msg <You pour a shot in the shot glass.> } else msg <Your shot glass is already full.>
		}
	end define

end define

define room <storage>

	define object <Full Shot Glass>
		take
		displaytype <Object>
		article <it>
		gender <it>
		properties <in storage>
		action <drink> 
	end define

end define

