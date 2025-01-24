' "test2"
' Created with QDK Lite 4.1.2

!include <stdverbs.lib>

define game <test2>
	asl-version <410>
	start <coast>
	game info <Created with QDK Lite 4.1.2>
	command <swim #to#> 
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <coast>
	look <In the north you can see an island. Try to swim to it!>
	command <swim #to#> {
		msg <you are in the water>
		if ( $left(#quest.originalcommand#; 4)$ = swim ) then {
			if ( $left(#quest.originalcommand#; 6)$ = swim n ) then goto <ocean> else msg <you cant swim in this direction> }
	}
end define

define room <ocean>
	look <A lot of water! In the north you can see the island, in the south is the coast.>
	command <swim #to#> {
		if ( $left(#quest.originalcommand#; 4)$ = swim ) then {
			select case <$left(#quest.originalcommand#; 6)$> {
				case <swim n> {
					msg <you swim towards the island in the north>
					goto <island>}
				case <swim s> {
					msg <You swim back to the coast>
					goto <coast>}
				case else msg <You cant swim there>
				} }
	}

	define object <fish>
		alias <fish>
		look <It looks tasty.>
		speak <the fish says "hello">
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <island>
	look <A wonderful island! In the south you can see the coast.>
	command <swim #to#> {
		if ( $left(#quest.originalcommand#;4)$ = swim ) then {
			if ( $left(#quest.originalcommand#; 6)$ = swim s ) then {
				msg <You swim towards the coast in the south>
				goto <ocean> } else msg <You cant swim  there> }
	}
end define

