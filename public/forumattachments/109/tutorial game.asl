' "Quest Tutorial Game!"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <Quest Tutorial Game!>
	asl-version <410>
	start <Lounge>
	game author <Lin>
	game version <v1 beta>
	game copyright <FATHEAD - 2011>
	game info <made over the course of 8127391264397827 weeks.|nalso farts. yes.>
	command <say #text#; shout #text#; yell #text#> msg <You say "#text#", but nobody replies....>
	command <weigh #@object#> {
		if property <#object#; weight> then msg <Picking it up, you would say its around about #(object):weight# grams. This isn't important mind you.> else {
			msg <Good luck lifting that mate. Cos you cant. > }
	}
	verb <watch> msg <You can't watch that.>
	verb <sit on> msg <You can't sit on that.>
	verb <read> msg <You can't read that.>
	verb <lick> msg <You can't lick that.>
	verb <switch off; turn off> msg <You can't switch off that.>
	verb <take> msg <You can't take that.>
	verb <switch on> msg <You can't switch on that.>
	verb <pick up> msg <You can't pick up that.>
	verb <use> msg <You can't use that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Lounge>
	prefix <The>
	look <this is a pretty 'orrid room. peeling wallpaper, damp carpet. but hey - at least it has a nice comfy settee and a dvd of the mighty boosh on!>
	south <Kitchen>

	define object <Telly>
		alt <TV; Television>
		look <This Telly is a fancy 60" Widescreen Plasma HD Telly. It looks new, oddly enough. Its currently showing the episode "Bollo" from the popular British TV Series "The Mighty Boosh".>
		speak <Mate, Vince wont reply to you no matter how hard you shout about how good his hair is.>
		prefix <A>
		suffix <showing a episode from The Mighty Boosh>
		displaytype <Object>
		article <it>
		gender <it>
		properties <watch = You decide to sit for a moment to watch some of the episode. You instead end up watching the entire dvd. nice going bub.; read = nope.avi; take = Its too big to fit in your pockets!>
		action <switch off> {
			property <Telly; look=This Telly is a fancy 60" Widescreen Plasma HD Telly. It looks new, oddly enough. Its currently switched off.>
			property <Telly; watch=you have a sit down on the nice comfy settee and watch the telly for 5 minutes before realizing that its switched off. derp.>
			msg <|bMIGHTY BOOSH NOOOOOOOOO|xb>
		}
		action <switch on> {
			property <Telly; look=This Telly is a fancy 60" Widescreen Plasma HD Telly. It looks new, oddly enough. Its currently showing the episode "Bollo" from the popular British TV Series "The Mighty Boosh".>
			property <Telly; watch=You decide to sit for a moment to watch some of the episode. You instead end up watching the entire dvd. nice going bub.>
			msg <|bMIGHTY BOOSH YEEEEEEEEEEAAAAAAAAAAH|xb>
		}
	end define

	define object <Settee>
		alt <Sofa; Couch>
		look <man what would i give to sit on something like that. uh i mean what YOU would give to sit on it. ahem. (by the way its a couch. damn americans.)>
		speak <its a settee. settees dont speak, idiot.>
		prefix <A Comfy-Looking>
		suffix <made in denmark>
		displaytype <Object>
		article <it>
		gender <it>
		properties <sit on = you sit on the comfortable settee and then think: "wait im trapped here why am i sitting down on a settee?" you promptly get up.; read = what are you trying to do, read its fortune?!; take = like the telly, this is also too big to fit in your pockets.>
	end define

	define object <Table>
		look <ooh thats a nice looking table. it hurts to the touch. how odd. best not sit on it eh?>
		speak <yep thats a table alright - it dont speak back.>
		prefix <A Stupid>
		suffix <which hurts like hell when you touch it>
		displaytype <Object>
		article <it>
		gender <it>
		properties <sit on = well that was dumb, now your arse is smarting really bad!; read = look mate, this isnt school, you wont find little graffiti marks on this table.; take = ooh you almost got it into your pockets. shame its too big.>
		action <sit on> {
			msg <YOU IDIOT WHY DIDN'T YOU LISTEN TO ME WHEN I SAID DON'T SIT ON THE TABLE?!|n|nyou ignorant bastard. YOU DIE FOR THIS.|n>
			playerlose
		}
	end define

	define object <Newspaper>
		alt <Paper; News>
		look <the front page news is on how "News Of The World" has crashed and burned. strange that theres a newspaper article on a dead newspaper aint it?>
		take {
			give <Newspaper>
			msg <Taken.>
		}
		speak <no reply. damn.>
		prefix <A>
		suffix <dated 17 July 2011>
		displaytype <Object>
		article <it>
		gender <it>
		drop nowhere <Ooooooh no no no no no! you never know when it might come in handy!>
		properties <read = you sit down on the settee and read a bit of the newspaper before getting distracted by whats on the telly. you watch the entire dvd once again. fool.>
	end define

	define object <Wallpaper>
		look <eurgh. thats horrible. its peeling an' everything!>
		speak <talking to brick walls again are we?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <lick = look, this isnt bloody "charlie and the chocolate factory", theres no fruity wallpaper shit here.>
	end define

	define object <Carpet>
		look <god this thing stinks.>
		take
		speak <talking to brick floors again are we?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		drop nowhere <>
		properties <lick = THERE'S NO FRUITY CARPETS EITHER!!!>
	end define

	define object <Bob>
		look if property <Bob; dead> then msg <HES DEAD JIM> else msg <Bob is standing up straight, looking fine and dandy. Hes got a nice tuxedo on for some reason. oh well, back to the daily grind i guess.>
		speak <I SAID HES DEAD JIM>
		displaytype <Character>
		article <him>
		gender <he>
		properties <dead>
		action <take> give <Bob>
	end define

	define object <Lin1>
		alias <Lin>
		look <"WAIT WHAT HOW DID YOU FIND ME ARRRGH I THOUGHT I HAD A GOOD HIDING SPOT">
		speak <"sup.">
		displaytype <Character>
		article <him>
		gender <he>
		invisible
		properties <take = "NOOOOOOOOOOOOOO">
	end define

	define object <Defib Pack>
		look <A Defib Pack can revive a dead person if what happens in Left 4 Dead is true.....Not sure it is but i'd give it a shot if i were you. >
		take <taken>
		speak <"Bzzt">
		prefix <A>
		displaytype <Object>
		article <it>
		gender <it>
		use on <Bob> {
			property <Bob; not dead>
			msg <HES ALIIIIIIVE>
		}
	end define

end define

define room <Kitchen>
	prefix <The>
	look <ooh we can make some cheese toasties! wait theres no bread. shit. or cheese for that matter. damn, this place is empty!>
	north <Lounge>

	define object <Lin2>
		alias <Lin>
		look <"Hello again.">
		speak <"So this is the lovely kitchen. its looking a bit grim at the moment ill be honest.">
		displaytype <Character>
		article <him>
		gender <he>
		invisible
		properties <take = "NOOOOOOOOOOOOO">
	end define

	define object <Bread>
		look <This item does not exist. (ok so it exists but you cant do anything with it)>
		speak <huh? what are you talking to?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <take = nope>
	end define

	define object <Cheese>
		look <STOP BREAKING THINGS GODDAMMIT>
		speak <brick wall speech number 4 (yeah im keeping count)>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <take = nuh-uh.>
	end define

	define object <Toaster>
		look <oh if only this wasnt scenery then you might of been able to make those cheese toasties that we all desire....>
		speak <why do you keep expecting things to talk back?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <use = no.>
	end define

	define object <Ubben>
		alt <Oven; Cooker>
		look if flag <oven on> then msg <Looking through the glass of the shiny Ubben which can toast bread in 5 minutes flat, you can see that a flame is lit. You deduct that its on. Nice going sherlock.> else msg <also known as a "Oven" or a "Cooker", this thing can cook bread within 5 minutes, inna flash! You notice this Ubben is incredibly shiny for how old and crippled the house is.>
		speak <i dont think so >
		prefix <A>
		displaytype <Object>
		article <it>
		gender <it>
		properties <use = use Ubben with what?>
		action <switch off> {
			flag off <oven on>
			msg <What, you're not gonna make any more toast? well, fine, jerk.>
		}
		action <switch on> {
			flag on <oven on>
			msg <And the lord said, let there be light! (in the Ubben that is.)>
		}
	end define

	define object <Flour>
		look <....can i see flour beetles in there?!>
		speak <hallo mistah floah>
		prefix <Some>
		displaytype <Object>
		article <it>
		gender <it>
		properties <weight = 150>
	end define

	define object <Eggs>
		look msg <Daring to look inside the tattered box, you find around about 3 eggs in there and youre 100%% sure they must be off by now.>
		speak <hullo mister egg>
		prefix <A Few>
		displaytype <Object>
		article <them>
		gender <they>
		properties <weight = 120>
	end define

	define object <Sugar>
		look <its sugar. plain old sugar. looks like granulated. need anymore details or are you just that stupid?>
		speak <"hi!">
		prefix <A Bit of>
		displaytype <Object>
		article <it>
		gender <it>
		properties <weight = 85>
	end define

end define

define text <intro>
Sup bro, its time to play the quest tutorial game! im sure you wont enjoy this what so fucking ever!  but dont worry cos this is just so i know the ins and outs of Quest so i can make FVG! oh, and a word of advice - dont sit on the table.
end define

define text <win>
Nice Going Brosiff! Now wait for FVG to be released :3
end define

define text <lose>
nice going, chump. restart or restore from a old save to continue.
end define

define text <take>
Taken.
end define

define text <drop>
Dropped.
end define

