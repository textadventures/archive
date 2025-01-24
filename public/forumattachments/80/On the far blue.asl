' "On the far blue"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <On the far blue>
	asl-version <410>
	start <sailor cabin>
	game info <Created with QDK 4.1.5>
	default fontsize <14>
	startscript {
		msg <|s18With an raging thundershock you awake,|nThe cabin is shaking heavely from the left to the right.|n|nIf i where you i would find something floatable quick. Only five minutes to find something floatable and jump off the ship...|s00>
		timeron <nU>
		timeron <ti,er 1>
		timeron <T 2>
		timeron <T3>
		timeron <T4>
		timeron <t5>
		show <Captain Seval>
		show <Old Sam>
		show <Charlie>
	}
	verb <take> msg <You can't take that.>
	verb <look under> msg <No that won't work...>
	verb <speak> msg <No reaction...>
	verb <jump off> 
	verb <enter> msg <You can't enter that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define type <Location>
end define

define room <Sailor cabin>
	indescription <You are in the sailor cabin, here you sleep along with the other 4 crew member's.>
	out locked <Deck; The door is locked! You will need a key...>

	define object <Cabin key>
		look <Amazing, its  a key!|nYou rock!>
		speak <Hello key?|n-Key did not respond.>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
		action <take> {
			show <Cabin key>
			give <Cabin key>
		}
	end define

	define object <Cabin door>
		look <It is locked, you will need a key.>
		displaytype <Object>
		article <it>
		gender <it>
		use <Cabin key> {
			goto <Lowerdeck>
			msg <You lock the door behind you after you leave the cabin.>
		}
	end define

	define object <Your treasure chest>
		look <In this you have stored thing's like clothing and your luckystone.|nYou will need a key if you want to open it.|n>
		speak <Don't try to speak to treasure chest's, that bring's evil.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Bed>
		look <It's you bed, in your bed is, of course your pillow.>
		speak <Don't try to speak to it, it would bring evil....>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Pillow>
		look <You alway's lay something underneath your pillow. |nMaybe it's wise to look under the pillow.>
		speak <Pillow's don't talk back smartass.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <look under> {
			msg <You found the cabin key.>
			show <Cabin key>
			give <Cabin key>
			hide <Pillow>
		}
	end define

end define

define room <Upperdeck>
	down <Lowerdeck>

	define object <Old Sam>
		look <He staring at the wave's, it looks like he has lost all hope...>
		speak <Old Sam : I found a key here, was it your's? I thought it was from the captain, so i put in in the captain's cabin. >
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <Captain's cabin>
	look <You are now in the captain's cabin.>

	define object <Captain's table>
		look <There's a key on it.>
		speak <That bring's evil, don't do that.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Key>
		alias <Galley key>
		look <It's a key for the Galley on the ship.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <Galley>
	look <This is the place where the cook work's.|nThere are lots of beer barrel's here.>
	out <Deck>

	define object <Pile of large Beer barrel's>
		look <The beer barrel's are very large, also they are very floatable.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Beer barrel>
		displaytype <Object>
		article <it>
		gender <it>
		drop nowhere <>
		action <take> {
			msg <You now have a empty beer barrel, it's floatable,and very big, you should |n''jump off board''with this quick!>
			show <Beer barrel>
			give <Beer barrel>
			show <ship>
		}
	end define

end define

define room <Lowerdeck>
	look <There is a raging thunder outside, you will need to find something floatable fast!.>
	up <Upperdeck>

	define object <board>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
		invisible
	end define

	define object <ship>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
		invisible
		properties <jump off>
	end define

	define object <the cabin's>
		look <There is nothing in here that is usefull for you.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define timer <nU>
	interval <300>
	action {
		msg <|s28The wave's crush the ship, while your still in it, and you have nothing floatable, you drowned.|n|s00>
		playerlose
	}
	disabled
end define

define timer <ti,er 1>
	interval <1>
	action {
		msg <5 minute's before you drown...>
		timeroff <ti,er 1>
	}
	disabled
end define

define timer <T 2>
	interval <60>
	action {
		msg <4 Minute's before you drown..>
		timeroff <T 2>
	}
	disabled
end define

define timer <T3>
	interval <120>
	action {
		msg <3 minutes before you drown...>
		timeroff <T3>
	}
	disabled
end define

define timer <T4>
	interval <180>
	action {
		msg <|s18Just 2 minute's before you drown..|s00>
		timeroff <T4>
	}
	disabled
end define

define timer <t5>
	interval <240>
	action {
		msg <|s26Hurry up! in 1 minute the waves will crush the ship!|s00>
		timeroff <t5>
	}
	disabled
end define

define selection <enter>
	info <Enter captain's cabin?>
	choice <yes> goto <Captain's cabin>
	choice <no> msg <>
end define
