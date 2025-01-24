' "Container Game"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <Container Game>
	asl-version <410>
	start <The Room>
	game info <Created with QDK 4.1.4>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <The Room>

	define object <Chest>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open
		close
		add
		remove
	end define

	define object <rock>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <stick>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

