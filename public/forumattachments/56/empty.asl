' "Empty"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <Empty>
	asl-version <410>
	start <room>
	game info <Created with QDK 4.1.4>
	verb <empty> msg <You can't empty that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <room>

	define object <bottle>
		displaytype <Object>
		article <it>
		gender <it>
		container
		transparent
		opened
		action <empty> for each object in game if ( #(quest.thing):parent# = bottle ) then property <#quest.thing#; parent=>
	end define

	define object <coin>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		parent <bottle>
	end define

	define object <fluff>
		prefix <a piece of>
		displaytype <Object>
		article <it>
		gender <it>
		parent <bottle>
	end define

	define object <ship>
		prefix <a small>
		displaytype <Object>
		article <it>
		gender <it>
		parent <bottle>
	end define

end define

