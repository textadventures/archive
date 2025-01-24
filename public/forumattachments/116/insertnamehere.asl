' "LOLIVERSE"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <LOLIVERSE>
	asl-version <410>
	start <the sewers>
	game info <Created with QDK 4.1.5>
	verb <take> msg <You can't take that.>
	verb <turn on; switch on> msg <There's no switch or button. >
	verb <lay on; jump on> msg <On second thought, you decide not to.>
	verb <open> msg <You can't open that... or at least, not yet.>
	verb <watch> msg <Not much to be seen.>
	verb <turn off> msg <You can't turn that off.>
	verb <wear; put on> msg <You can't wear that.>
	verb <take off> msg <You can't take off that.>
	verb <jump through; enter> msg <You can't jump through that.>
	verb <use> msg <You can't use that.>
	verb <switch on> msg <You can't switch on that.>
	verb <turn off; switch off> msg <You can't switch it off.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define synonyms
	try on; put on; look through = wear
end define

define room <the sewers>
	alias <stinky place>
	prefix <this>
	out if flag <both acquired> then goto <lame>
	script {
		foreground <white>
		background <black>
		playmp3 <11 Track 11.mp3>
	}
	description <|jc|cyThe putrid stench of rotting things burns your nose, and you shrink away from the slimy moss covering the walls of the pipe.|nLooking around at the floor, all you can spot in the darkness is  a dead rat, a palm-sized flashlight, and what seems to be a can of tuna sticking out of the sludge.|n|n...What the heck are you even doing in a sewer? |n|n|cb>

	define object <can o' tuna>
		alias <Can o' tuna>
		alt <can; tuna>
		look <You examine the can. It looks fine, no dents or holes.|nIt expired a week ago. |n...Probably still edible.|nMaybe you should take it with you, just in case, y'unno, a zombiepocalypse occurs and you can't leave your hide-out in search for food. >
		take {
			give <can o' tuna>
			msg <You pick it up and throw it into your rucksack. |n...Wait, since when did you have a rucksack?>
		}
		speak <LOL seriously? |nDid you really expect a can of tuna to react?|nDude. >
		prefix <a>
		suffix <sticking out from a pile of ick>
		displaytype <Object>
		article <it>
		gender <it>
		drop nowhere <Why not just keep it for a while longer? A little tuna never hurt nobody...>
		container
		properties <open = You don't have a can opener on you at the mo.>
	end define

	define object <Flashlight>
		alt <torch; light>
		look <The neon-orange flashlight is pretty ordinary, with only one tiny LED lightbulb to illuminate the way. |nEh, better than nothing. >
		take {
			give <Flashlight>
			msg <You slip it into your pocket. The weight feels reassuring. >
		}
		speak <Unfortunately, it isn't one of those ultra-cool hi-tech ones that reacts to audio commands yoou saw on TV the other day. >
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		drop nowhere <After looking at it for a minute, you decide to keep it on your after all... never know when you might need it. >
		properties <turn on = The bulb glows dully before fading out. Damnit.>
	end define

	define object <sewer walls>
		alt <wall>
		look <A trio of roaches pause to scout you out, antennae flailing about in the air, before scuttling off into the darkness.  |nUrgh.|nYou shiver in disgust, letting out the breath you didn't realize you'd been holding. >
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <rat>
		alt <mouse>
		look <All you really need to know is that it's dead. |n|n...Now might be a good time to get out of here. >
		speak <You make a noise to see if it has any reaction. It doesn't. >
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <take = You move to pick it up but sissy out as soon as your fingers touch its dead, dank fur.|n EWWWW. |n|nWhy did you ever wanna pick it up in the first place??>
	end define

	define object <portal>
		alias <around>
		alt <surroundings>
		look {
			if got <can o' tuna> and got <Flashlight> then {
				msg <An odd patch of air shows a familiar-looking bed, the corner of a desk- wait... |n...is that your bedroom you see? |n|nIt looks like there's some kind of window or portal hanging mid-air that leads to your room!|n|nMaybe, if you jump through it, you can get |bout |xbof here and to your bedroom!>
				flag on <both acquired> } else msg <There don't seem to be any exits... you stumble around in the dark for awhile, dodging strange bugs and piles of goop, but eventually stop when you get too tired.|n |nGod, will you ever get out of here?? |n|n...Maybe there are some things you need to do here before you can leave..? >
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <jump through> goto <lame>
	end define

	define object <exit>
		look <Oh please. You didn't really think it was gonna be THAT easy, did you?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <lame>
	alias <your room>
	north <Living room>
	south {
		msg <Back to the sewer? Why the heck would you ever wanna go back there??>
		playmp3 <526670_SOUNDDOGS__cr.mp3>
	}
	script {
		clear
		background <white>
		playmp3 <>
		foreground <blue>
		msg <|cgYou crash onto the soft carpeting of your bedroom.|n|nWhoa, that actually worked!!! Awesome.|n|nYou scan the room. Desk, chair, TV, shelves, door...|nYou dump your rucksack on the desk and flop onto the bed. |n|nAhhhhh. Home, sweet fresh-smelling home. |nEverything is here and there doesn't seem to be anything out of the ordinary... except the portal, still there, and letting the stench of the sewer in. |cb>
		playmp3 <Wim Mertens - Struggle for Pleasure.mp3>
	}
	description <|cgYou crash onto the soft carpeting of your bedroom.|n|nWhoa, that actually worked!!! Awesome.|n|nYou scan the room. Desk, chair, TV, shelves, door...|nYou dump your rucksack on the desk and flop onto the bed. |n|nAhhhhh. Home, sweet fresh-smelling home. |nEverything is here and there doesn't seem to be anything out of the ordinary... except the portal, still there, and letting the stench of the sewer in. |cb>

	define object <bed>
		look <Not much to be seen. Just your blanket and pillows.>
		prefix <your>
		displaytype <Object>
		article <it>
		gender <it>
		properties <lay on = Mmmmm comfy. Maybe it's time for a nap..... |n|n...|n|n...|n|n...|n|n>
		action <lay on> {
			clear
			msg <|jc.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n...man, that was a good nap.>
		}
	end define

	define object <underbed>
		alias <underneath the bed>
		alt <underneath bed; under bed; under the bed>
		look {
			reveal <Suitcase>
			msg <You bend down to see if anything's there. Covered in dust is your suitcase, the really old one that has only one compartment. |nYou pull it out into the open. >
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		opened
	end define

	define object <desk>
		alt <table>
		look {
			msg <There isn't much on the desk, just your lamp and some books you're supposed to be reading for English class. Oh, and a piece of paper. >
			reveal <paper1>
		}
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Suitcase>
		look <It's red, the edges rough from all the abuse you put it through back in the day. At least the zipper still works.>
		prefix <a red>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <open> {
			if flag <lighter acquired> then msg <It's empty now.> else {
				msg <Disappointingly enough, the only thing in here is a plain ol' cigarette lighter.>
				reveal <lighter> }
		}
	end define

	define object <lighter>
		alt <light; cigarette lighter>
		look <It's nothing special. You flick it to see if it works, and it does. >
		take {
			give <lighter>
			msg <|nHuh. |n|nWhat are the odds of there being a lighter in your old suitcase when you don't smoke... and have NEVER EVER owned a lighter before? you muse as you pocket it. >
			flag on <Lighter acquired>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <drawer>
		alias <desk drawer>
		alt <drawer>
		look {
			if flag <glasses acquired> then msg <Not much left to be seen here.> else {
				msg <Inside are a velvet box and another piece of paper. >
				reveal <Velvet box>
				reveal <paper 2> }
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		opened
		close <You slide it shut thoughtfully. >
		remove {
			remove <paper 2>
			remove <Velvet box>
		}
		list off
		list empty <It's empty now.>
		list closed <It's closed.>
		properties <open>
	end define

	define object <Velvet box>
		alt <box>
		look {
			msg <The dark blue box is rectangular in shape, about the right size for a pair of glasses. You snap it open to reveal....|n|n...wow. A pair of glasses. >
			reveal <glasses>
			give <glasses>
			flag on <glasses acquired>
		}
		take {
			msg <You stuff it in the side compartment of your sack.>
			give <Velvet box>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		opened
		properties <open = It's empty now.>
	end define

	define object <glasses>
		alt <shades; sunglasses; sunshades>
		look <They look brand new and are tinted purple. >
		take
		gain flag on <glasses acquired>
		prefix <pair of>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		drop nowhere <They might come in handy.>
		properties <wear>
		action <wear> {
			flag on <glasses on>
			msg <You put the glasses on, blinking for a second as you adjust. >
		}
		action <take off> {
			flag off <glasses on>
			msg <Ahh, the world looks so much better in proper technicolor.>
		}
		action <use> {
			msg <You slip the glasses on, blinking for a few seconds to adjust.>
			flag on <glasses on>
		}
	end define

	define object <paper1>
		alias <piece of paper>
		look {
			picture <Hello.jpg>
			reveal <drawer>
		}
		take {
			msg <You stare at it for a moment, then think, "Eh, might as well." |n|nFolding it neatly you slide it into your rucksack.>
			give <paper1>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <paper 2>
		alias <second piece of paper>
		look {
			if flag <glasses on> then {
				playmp3 <>
				picture <G welcome.jpg>
				msg <Interesting...>
				playmp3 <385_ludovico_einaud.mp3> } else {
				picture <N welcome.jpg>
				msg <Nothing in the speech bubble...> }
		}
		take {
			give <paper 2>
			msg <You fold it in half and then again before sliding it into your rucksack.>
		}
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Living room>
	prefix <your>
	indescription <You walk into:>
	south <lame>

	define object <TV>
		look if flag <tv on> then msg <There's nothing being played at the moment.> else msg <It's off.>
		displaytype <Object>
		article <it>
		gender <it>
		action <turn on> {
			if flag <tv on> then msg <It's already on.> else {
				msg <The tv PZZZZ'es to life, but shows a blank screen.|n|nSince you haven't paid your cable bill for a couple of months, they've cut you off. |n|nLuckily you still have some DVDs that your friend, Skinny, left here from the last time he stayed over. >
				flag on <tv on>
				reveal <DVD1>
				reveal <DVD2>
				reveal <DVD3> }
		}
		action <switch on> {
			if flag <tv on> then msg <It's already on.> else {
				flag on <tv on>
				msg <The tv PZZZZ'es to life, but shows a blank screen.|n|nSince you haven't paid your cable bill for a couple of months, they've cut you off. |n|nLuckily you still have some DVDs that your friend, Skinny, left here from the last time he stayed over. >
				reveal <DVD1>
				reveal <DVD2>
				reveal <DVD3> }
		}
	end define

	define object <DVD1>
		alias <Meet me in heaven >
		alt <heaven; korean movie; korean film>
		look <It's supposed to be a movie about a brother and sister and their pet dog. |nYou can't understand the synopsis since it's in some other language, but it does say it has English subtitles...>
		prefix <a movie called>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <watch> {
			if flag <tv on> then msg <|nYou pop it in and start watching.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n...OH MY GOD. |nThat was the saddest movie you have ever had the misfortune of watching. |n|nFirst the kid and his baby sister's dad dies, then their mom abandons them... |n...then the little sister dies in front of her brother's eyes... the mother doesn't care... |n...the dog gets beaten up, the kid gets beaten up, the dog dies defending the brother... |n|nPutting the movie back in its case, you wipe the tears and snot away and vow to be nicer to stray dogs now. > else {
				flag on <tv on>
				msg <|nYou turn on the TV and put the movie in. |n.|n.|n.|n.|n.|n.|n.|n.|n.|n.|n...OH MY GOD. |nThat was the saddest movie you have ever had the misfortune of watching. |n|nFirst the kid and his baby sister's dad dies, then their mom abandons them... |n...then the little sister dies in front of her brother's eyes... the mother doesn't care... the dog gets beaten up, the kid gets beaten up, the dog dies defending the brother... |n|nAs you put the DVD back in its case you wipe the tears and snot away, vowing to be nicer to stray dogs now. |n> }
		}
	end define

	define object <DVD2>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <DVD3>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define text <intro>
|jc|cy


You wake up, scared as shit, and find yourself in.... a sewer?|cb
end define

