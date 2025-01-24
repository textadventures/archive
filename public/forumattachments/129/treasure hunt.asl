' "Spectrum"
' Created with QDK 3.12

define game <Spectrum>
	asl-version <311>
	start <Beginning of Game>
	game author <Mocha Man>
	game version <1.1>
	game copyright <© 2002 Mocha Man Entertainment>
	game info <Created with QDK 3.12.>
	command <scotty> {
		msg <CHEAT-CHEAT-CHEATER!!>
		goto <Safe>
	}
	command <credits> msg <- Programming: Mocha Man|n- Software: QDK|n     www.axeuk.com/quest|n|nNOTE: There are not any cheats for this game. No. None. Of course not. I'm not nervous. Do I look nervous? No cheats. Nada. heh heh...>
	command <help> msg <TIP-- Make a map as you go.|n|nType "north", "southwest", etc. Or click the compass buttons to navigate.|n|nYour goal is to pick up all the treasures you find (it will tell you if you pick up a treasure) and deposit them in the safe room where you start.|n|nYou can type "look at" followed by the object name to learn more about an object.|n|nIf you see anything that can be picked up, PICK IT UP! It is either a key or a treasure.|n|nThere are one or two places where you can type "hint" to get a small hint, but don't count on 100 percent guidance.>
	command <slimjim> {
		msg <CHEATY-CHEAT-CHEATER!!>
		give <Gecko Key>
		give <Shimmer>
		give <Flashlight>
		give <Shell>
		give <Screwdriver>
		give <pirate>
		give <Sky>
		give <Stone>
	}
	command <jackpot> {
		msg <SUPER CHEAT-CHEAT-CHEATER!!>
		reveal <Sheet Music>
		reveal <Flute>
		reveal <takeable cat>
		give <Silver Bracelet>
		give <gold>
		give <Pearls>
		give <Watch>
		give <takeable cat>
		give <diamonds>
		give <Opal>
		give <Emerald>
		give <Sword>
		give <Rainbow Key>
		give <Flute>
		give <Sheet Music>
	}
end define

define synonyms
end define

define room <Safe>
	alias <safe room>
	indescription <You are safely in the:>
	north <Teal>
	south <Peach>
	east <Magenta>
	west <lavender>
	northwest <lavender>
	northeast <Lime>
	southwest <Jet>
	southeast <Mahogany>
	script if here <gold> and here <Silver Bracelet> and here <Pearls> and here <Watch> and here <diamonds> and here <Opal> and here <Emerald> and here <Sword> then {
		msg <You deposited all treasure in the safe room! You now have the rainbow key and can go out.>
		lose <Gecko Key>
		lose <Shimmer>
		lose <Flashlight>
		lose <Shell>
		lose <Screwdriver>
		lose <pirate>
		lose <Sky>
		lose <Stone>
		move <Gecko Key; Storage>
		move <Shimmer; Storage>
		move <Flashlight; Storage>
		move <Shell; Storage>
		move <Screwdriver; Storage>
		move <pirate; Storage>
		move <Sky; Storage>
		move <Stone; Storage>
		give <Rainbow Key>
		create exit out <Safe; Hallway>
	}
	else msg <Welcome to the safe room. Here, you will deposit all eight treasures you find in the rooms around you. Once all eight treasues are in this room, exit it and then re-enter it. You can then move out of the maze to the next part.>
end define

define room <Silver>
	alias <Silver Room>
	look <The silver room has mirrors on every surface. Try not to bump into anything!>
	indescription <You have entered the:>
	north <yellow>
	west if got <Gecko Key> then {
		msg <You used the gecko key to get to the lime room.>
		goto <Lime>
	}
	else {
		msg <You need a certain reptillian key to get through this door.>
		goto <Silver>
	}

	define object <gold>
		alias <gold bar>
		look msg <It is soft, shiny, and weighs much more than it first appears to.>
		take {
			give <gold>
			msg <The gold bar is now weighing down your pockets. You collected a treasure!>
		}
		prefix <a>
		suffix <gleaming brightly>
		drop {
			lose <gold>
			msg <The gold is on the ground.>
			set numeric <treasures; +1>
		}
	end define

end define

define room <Lime>
	alias <Lime Room>
	look <In the lime room there are lush tropical plants on every surface except for a small pathway winding through them. It is humid here and full of butterflies. The walls appear to be made of light brown stone with bright green moss covering most of them.>
	indescription <Here is the:>
	south <Magenta>
	east if got <Gecko Key> then {
		msg <Used the gecko key to get through the gate.>
		goto <Silver>
	}
	else {
		msg <You need a green or silver key to get through this door.>
		goto <Lime>
	}
	west <Teal>
	southwest <Safe>
end define

define room <Magenta>
	alias <Magenta Room>
	look <In the magenta room, everything is smooth but not shiny, made out of some sort of marble or granite. There is a warm light radiating off of everything.>
	indescription <Location:>
	north <Lime>
	south <Mahogany>
	east <Orange>
	west <Safe>

	define object <Gecko Key>
		alias <Gecko Key>
		look msg <It is very small and radiates greenish silver light. On the side is a carving of a lizard.>
		take {
			msg <Took the gecko key.>
			give <Gecko Key>
		}
		drop everywhere <Dropped.>
	end define

end define

define room <Teal>
	alias <Teal Room>
	look <The teal room has a glass floor. Underneath you can see a shallow pond full of tropical fish. The walls are damp and made of a clouded cyan crystal.>
	indescription <You have found yourself in the:>
	south <Safe>
	west if got <Shimmer> then {
		msg <You place the shimmer key in the lock and hear a satisfying click.>
		goto <Not Gold>
	}
	else {
		msg <A very sparkly key would do the trick here.>
		goto <Teal>
	}

	define object <Shimmer>
		alias <Shimmer Key>
		look msg <The glimmer key is mostly white, with several quartz crystals set into the handle. The tip of the key is gold.>
		take {
			msg <The glimmer key sparkles happily as it slips into your pocket.>
			give <Shimmer>
		}
		prefix <the>
		drop everywhere <Dropped.>
	end define

end define

define room <White>
	alias <White Room>
	look <You are blinded by the sheer whiteness of every bland surface around you. The only relief from the color scheme is a golden keyhole on the far wall. There is also a small peice of paper that, upon further examination, reveals itself to be a peice of sheet music.>
	indescription <You stuble into the:>
	north <Eraser>
	south <Rose>
	east <Slate>
	west <yellow>

	define object <Sheet Music>
		alias <Music>
		look msg <On it is written an eerie tune for flute. It is an old peice of parchment with the notes scratched on in ink.>
		take {
			msg <You fold up the music and pocket it.>
			reveal <Sheet Music>
			give <Sheet Music>
		}
		prefix <a piece of sheet>
		invisible
		drop everywhere <You set the sheet music down.>
	end define

end define

define room <yellow>
	alias <Yellow Room>
	prefix <a cavernous>
	look <This room has a variety of different kinds of canaries fluttering about the room, perching in the lemon trees and avoiding the beehives. The sound of the animals is annoying but tolerable.>
	indescription <You are in:>
	north <Brown>
	east <White>
end define

define room <lavender>
	alias <Lavender Room>
	look <The lavender room is completely silent. Soft, clean purple carpet feels good on your feet. The walls appear to match the carpet but seem to change color as you move. By the time you leave, they are ordinary blue walls.>
	indescription <You walk quietly into the:>
	north if got <Shimmer> then {
		msg <The shimmer key provides passage through the door.>
		goto <Not Gold>
	}
	else {
		msg <Without some sparkly key, you can't get through.>
		goto <lavender>
	}
	east <Safe>
	west <Olive>
end define

define room <Not Gold>
	alias <Gold Room>
	look <In the gold room, the walls curve to shape the room like a sphere. The walls, floor and ceiling are a deep, rich, amber color.>
	indescription <The gate reveals the:>
	north if got <Shimmer> then {
		msg <Your shimmer key lets you through. The door is warm as you pull it open.>
		goto <Red>
	}
	else {
		msg <Without a key as sparkly as the room, you won't get out.>
		goto <Not Gold>
	}
	south if got <Shimmer> then {
		msg <Your shimmer key clicks and you move through.>
		goto <lavender>
	}
	else {
		msg <You need a special shiny sparkly key.>
		goto <Not Gold>
	}
	east if got <Shimmer> then {
		msg <The shimmer key slides you through the door. Blue light greets you.>
		goto <Teal>
	}
	else {
		msg <Without a key you won't get anywhere.>
		goto <Not Gold>
	}

	define object <Silver Bracelet>
		alias <Silver>
		look msg <It is fairly simple, round and smooth. There is a small piece of jade set into the top.>
		take {
			msg <You slip the bracelet around your wrist. It is warm and smooth.|nYou picked up a treasure!>
			give <Silver Bracelet>
		}
		prefix <a beautiful>
		suffix <bracelet>
		drop everywhere <The bracelet sits on the ground, still warm.>
	end define

end define

define room <Red>
	alias <Red Room>
	look <The first thing you notice is sweltering heat. You stand on a concrete platform floating over a flaming pit far below. The light comes from the streams of red-hot lava running down the walls. The doorknob is hot but still tolerable.>
	indescription <You have entered the:>
	north <Ginger>
	south if got <Shimmer> then {
		msg <Your shimmer key clicks and you push the door open.>
		goto <Not Gold>
	}
	else {
		msg <The gate is held firmly. Either get a shiny key or get out of the heat!>
		goto <Red>
	}
	east <Cream>
	west <Opaque>
end define

define room <Cream>
	alias <Cream Room>
	look <The cream room has offwhite walls and there is mist floating around at ankle level. It is quiet and the air smells sweet.>
	indescription <This is the:>
	north <Clear>
	east <Dark>
	west <Red>
end define

define room <Dark>
	alias <Dark Room>
	look <You have entered the dark room. It is dark.>
	indescription <This is the:>
	north <Pink>
	west <Cream>

	define object <Pearls>
		alias <Pearl>
		look msg <They are round and smooth, the finest quality.>
		take if got <Flashlight> then {
			msg <You shine the flashlight around until you see the pearls and pick them up.|nYou collected a treasure!>
			give <Pearls>
		}
		else msg <You can not find the pearls in the dark.>
		prefix <a long>
		suffix <necklace>
		drop everywhere <The pearls sit on the ground calmly.>
	end define

end define

define room <Peach>
	alias <Peach room>
	look <The peach room is brilliantly lit and has orange walls with green vines snaking up them. You stand on a brick path.>
	indescription <Here is the:>
	north <Safe>
	south <Puce>
	east <Mahogany>
	west <Jet>

	define object <Flashlight>
		alias <Flashlight>
		look msg <It's just an ordinary black plastic flashlight.>
		take {
			msg <You pocket the flashlight.>
			give <Flashlight>
		}
		prefix <a discarded>
		suffix <sitting on the path>
		drop everywhere <Your flashlight sits on the ground, discarded again.>
	end define

end define

define room <Jet>
	alias <Jet Room>
	look <The jet room is all varying shades of grey and black. The hard, flat walls form a perfect cube and there are deep, unrecognisable carvings in some other language on the left wall, full of angles and brackets.>
	indescription <You are in the:>
	north <lavender>
	south <Tan>
	east <Peach>
	west <Jade>
	northeast <Safe>
end define

define room <Mahogany>
	alias <Mahogany room>
	look <The mahogany room is a perfect cube and each surface is made of fine mahogany wood, almost red, polished until you can clearly see your reflection (and your fingerprints). There is bright, happy sunlight streaming in through a large glass window that looks out on the safe room.>
	indescription <You walk quetly into the:>
	north <Magenta>
	south <Maroon>
	east <Blue>
	west <Peach>
	northwest <Safe>
end define

define room <Jade>
	alias <Jade room>
	look <Here in the jade room, it is cold and misty. You appear to be in an outdoor japanese garden on a very foggy, overcast day. You can not see more than five feet ahead of you and can hear a stream somewhere nearby.>
	indescription <This is the:>
	south if got <Shell> then {
		msg <You are careful not to break the shell key as you unlock the door with it.>
		goto <Aqua>
	}
	else {
		msg <You need a certain fragile key to get through this gate.>
		goto <Jade>
	}
	east <Jet>
end define

define room <Tan>
	alias <Tan Room>
	look <The door to the tan room reveals a vast, giant desert that you can not see the end of. Behind you, the doorframe seems to be standing in the middle of nowhere, balancing on its own. When you open it you can see the jet room where you came from. There are cactuses and cliffs, and an eagle calls in the distance.>
	indescription <Welcome to the:>
	north <Jet>
	command <walk desert> msg <do you REALLY want to walk the desert?>
	command <yes> msg <Well tough. You can't commit suicide in this game.>

	define object <Shell>
		alias <Shell>
		look msg <It is made up of one larger blue, white, and lavender shell with smaller shells all over it forming the shaft and bumps. It smells like salt water.>
		take {
			msg <You carefully slip the key into your pocket.>
			give <Shell>
		}
		prefix <a small>
		suffix <key, sitting out of place>
		drop everywhere <You carefully set the shell key down in a safe spot on the ground.>
	end define

end define

define room <Aqua>
	alias <Aqua room>
	look <As you step into the aqua room, you realise that you are completely underwater. As you step through the door, an air bubble forms around you, keeping you dry and giving you a few minutes' worth of air. Tropical fish swim around you happily and you feel wet sand under your feet, and there is a flute nearby, half buried in the sand. The ceiling is made of glass.>
	indescription <You step into the:>
	north if got <Shell> then {
		msg <The shell key slips into the lock. You are careful not to break it as you turn it.>
		goto <Jade>
	}
	else {
		msg <You need a fragile key for this gate.>
		goto <Aqua>
	}

	define object <Watch>
		alias <Watch>
		look msg <It is silver-plated with an analogue face which has a shiny blue background. There is no company marking.>
		take {
			msg <You buckle the watch onto your wrist, where it gleams brightly.|nYou picked up a treasure!!>
			give <Watch>
		}
		prefix <an expensive platinum waterproof>
		drop everywhere <You set the watch on the ground.>
	end define

	define object <Flute>
		alias <Flute>
		look msg <It is beautifully carved and is in perfect condition. It sounds vaguely like an owl.>
		take {
			msg <You hold on to the instrument tightly.>
			reveal <Flute>
			give <Flute>
		}
		prefix <a wooden>
		suffix <sitting>
		invisible
		drop everywhere <You set down your flute.>
	end define

end define

define room <Maroon>
	alias <Maroon Room>
	look <Welcome to the maroon room. Red carpet is soft under your feet. You can see potted palm trees all around you and there are expensive dark red couches arranged in a lounge-like circle. You are walking on stone cobbles, warm from the sun. It is nighttime in this room. When you look up through the hot air, you see a crescent moon in the clear sky.>
	indescription <This is the:>
	north <Mahogany>
	east <Celedon>
	west <Puce>

	define object <Screwdriver>
		alias <Screwdriver>
		look msg <Wow! A SCREWDRIVER!! Oooh aaah. It's black plastic.>
		take {
			msg <You slip the screwdriver into your back pocket.>
			give <Screwdriver>
		}
		prefix <a>
		suffix <lying on the ground>
		drop everywhere <The screwdriver clatters to the ground.>
	end define

end define

define room <Olive>
	alias <Olive Room>
	look <The olive room has walls of pale-green concrete, which each have a large plate of glass about an inch in front of them. The glass has water running down its surface in the space between the glass and the wall. The floor is white and pale blue tiled.>
	indescription <This is the:>
	north <Fuchsia>
	east <lavender>
end define

define room <Fuchsia>
	alias <Fuchsia Room>
	prefix <glow of the>
	look <The fuchsia room looks like an ordinary white room, except that there are large flourescent lights on the ceiling casting a reddish-purple glow over everything the floor is a mirror, further magnifying the light.>
	indescription <You have entered the:>
	north <Opaque>
	south <Olive>
end define

define room <Opaque>
	alias <Opaque Room>
	look <All surfaces are made of glass that has been smoked or blemished so that you can not see through it, yet you feel like you are walking on fog. Your footsteps echo slightly.>
	indescription <You have stepped into the:>
	north <Clover>
	south <Fuchsia>
	east <Red>
end define

define room <Clover>
	alias <Clover Room>
	look <The clover room seems like a narrow hallway with soft moss growing on everything, except it has no roof, just walls that seem to go on forever. You take a few steps before a geyser to your left shoots a narrow jet of hot water up and up and out of sight. Soon, more join it, popping open in the least expected places. As you leave the room, the water from the first geyser begins to hit the ground like rain, now almost completely cool.>
	indescription <Welcome to the:>
	south <Opaque>
	east <Ginger>

	define object <pirate>
		alias <pirate>
		look msg <It is large and coated with some waterproof material. It has a skull and crossbones carved into the handle.>
		take {
			msg <The skull and crossbones on it grins at you as you slip it into your pocket.>
			give <pirate>
		}
		prefix <an old, wooden>
		suffix <key>
		drop everywhere <The pirate key clatters to the ground.>
	end define

end define

define room <Eraser>
	alias <Eraser room>
	look <Around you, you see nothing. Void. There is no floor, but before you begin to fall a HUGE gust of wind scoops you up and begins to push you further and further up into the air... The door you came through dwindles away below you. Suddenly, the wind stops, and you start falling and land where you least expected...>
	indescription <You step into the nothing of the:>
	north <Safe>
	south <Safe>
	east <Safe>
	west <Safe>
	northwest <Safe>
	northeast <Safe>
	southwest <Safe>
	southeast <Safe>
end define

define room <Ginger>
	alias <Ginger room>
	look <The ginger room is a fairly large room, but you can still see all six surfaces. The floor is covered with soft orange pillows that match the walls. There are cats everywhere, sleeping, playing, fishing, fighting, eating, and sleeping. One brushes against your leg.>
	indescription <You stumble into the:>
	south <Red>
	east <Clear>
	west <Clover>
	command <pet cat> msg <You pet one of the cats. It is soft and the cat begins to purr.>

	define object <cat>
		alias <cats>
		look msg <The cats are of all varieties, and are all beyond cute. Upon noticing your presence they begin jumping up onto pillows near you, eager for attention.>
		invisible
	end define

	define object <takeable cat>
		alias <cat>
		look msg <The ginger cat is small and soft, and looks at you with lazy eyes.>
		take {
			msg <You pick up one of the cats and take it with you. It sits happily in your arms for awhile and then decides to walk with you instead of being carried.>
			reveal <takeable cat>
			give <takeable cat>
		}
		prefix <a happy>
		suffix <sleeping>
		invisible
		drop everywhere <The cat stays where you left it, calmly going to sleep.>
	end define

end define

define room <Clear>
	alias <Clear Room>
	look <The clear room has walls, floor, and a ceiling, but you can not see them. They are clear. You can tell they are there because you're obviously walking on something, and because you can see your reflection below you. Overcast daylight pours in through the ceiling, and way below the floor stretches a vast, beautiful landscape of a foggy forest, mountains, and the ocean.>
	indescription <You step into the:>
	south <Cream>
	east <Pink>
	west <Ginger>
end define

define room <Pink>
	alias <Pink Room>
	look <The pink room is made of hard, pink wood. There are staircases everywhere, winding their way up to various doors leading in different directions. There is warm indoor light on everything and it is as quiet as an art gallery.>
	indescription <This is the:>
	south <Dark>
	east <Brown>
	west <Clear>
end define

define room <Brown>
	alias <Brown Room>
	look <The brown room is actually the inside of an old ship, and you immediately think of a pirate galleon. You are far below decks, where they store supplies. Smells of good food and loud laughter ring down from above, and everything sways rhythmically. The light comes from several yellow lanterns.>
	indescription <You walk into the:>
	south <yellow>
	east <Eraser>
	west <Pink>
	command <go upstairs> msg <And what? Get killed by a pirate? Let's focus here.>

	define object <diamonds>
		alias <diamonds>
		look msg <They are many in number and have no flaws.>
		take if got <pirate> then {
			msg <You use your pirate key to open the chest and get the diamonds. You then decide to take the chest with you for safekeeping.>
			give <diamonds>
		}
		else msg <The treasure chest they are in is locked. The lock has a skull and crossbones on it.>
		prefix <fine>
		suffix <enclosed in a treasure chest>
		drop everywhere <You set the chest and the diamonds down and lock it just to be safe.>
	end define

end define

define room <Puce>
	alias <Puce room>
	look <The puce room is a blank room with light brown walls and a classroom-style carpet. It is small and exceptionally boring. There is a small outlet at the base of one wall.>
	indescription <This is the:>
	north <Peach>
	east <Maroon>
end define

define room <Blue>
	alias <Blue Room>
	look <The first thing you step on is a piece of floating ice that supports your weight, bobbing on a frigid pond. You get across by hopping from one island to another. Along the edges of the room, in front of the ice walls, stand small penguins watching you in awe. You can see your breath, but you can also see the magnificent display of northern lights off in the distance.>
	indescription <Here you find the:>
	north <Orange>
	south <Celedon>
	east <NW Grey>
	west <Mahogany>

	define object <Sky>
		alias <Sky Key>
		look msg <It is a small light blue key, made out of glass or crystal, that is completely translucent.>
		take {
			msg <You slip the sky key into a safe place in your pocket.>
			give <Sky>
		}
		prefix <the>
		suffix <sitting on the ice>
		drop everywhere <You set the sky key down with a soft tink.>
	end define

end define

define room <Celedon>
	alias <Celedon Room>
	look <The first thing you notice is that you are walking on a tree. You look around and see that the ground is in fact a very sturdy canopy of a lush tropical forest. You can hear a river below you and when you peer through a hole in the foliage you can see a waterfall rushing into a pond, in which frogs are abundant. It is very sunny.>
	indescription <Here you find the:>
	north <Blue>
	east <SW Grey>
	west <Maroon>
	command <take frog> msg <The frogs are too fast to catch.>
end define

define room <Orange>
	alias <Orange Room>
	look <You are in a small dining room, with a long table laden with a giant feast. The room is lit with candlelight and there is no one else in sight. A cuckoo clock rests next to a flowerpot on the wall nearest you.>
	indescription <This here is the:>
	south <Blue>
	east <Blank>
	west <Magenta>

	define object <Food>
		alias <Feast>
		look msg <The feast has turkey, mashed potatoes, stuffing, yams, gravy, cranberry sauce, and cider. There is also a large salad. Upon tasting some of the food you discover that it is absolutely delicious.>
		invisible
	end define

end define

define room <Indigo>
	alias <Indigo Room>
	look <The indigo room has a walkway across it, probably made out of blue crystal, which is suspended about four hundred feet above a roaring deep blue sea. A sharp wind blows and the nighttime sky is lit with shooting stars.>
	indescription <This is the interior of the:>
	south <Slate>
	west <Eraser>

	define object <Opal>
		alias <Opal>
		look msg <The opal is of the black opal variety, lit with an entire palette of shimmering colors. It is perfectly round.>
		take {
			msg <Your opal gleams, looking like a miniature laser show, as it slips into your pocket.|nYou picked up a treasure!>
			give <Opal>
		}
		prefix <a brilliant>
		suffix <sitting on the ground>
		drop everywhere <Your laser light show rests on the ground.>
	end define

end define

define room <Slate>
	alias <Slate Room>
	look <The slate room is rather large. There are whirring machines all around you, illuminated by harsh white light. Sparks are flying from one machine while others have conveyor belts and buttons and levers. The commotion is almost unbearable. Everything is made out of hard, cold steel, and it would be easy to get lost here. There is a blue crystal door to the north, seeming out of place.>
	indescription <You step into the:>
	north if got <Sky> then {
		msg <The sky key fades into matching the lock and dissappears. Soon, you hear a click and the key materializes in your pocket.>
		goto <Indigo>
	}
	else {
		msg <The blue crystal lock on the door holds steady.>
		goto <Slate>
	}
	south <Pine>
	west <White>
end define

define room <Rose>
	alias <Rose Room>
	look <Soft pink light illuminates a small room filled with various-sized containing various-sized fish. There is a small clock ticking on the far wall.>
	indescription <Here you find the:>
	north <White>
	south <Blank>
	east <Pine>
end define

define room <Pine>
	alias <Pine Room>
	look <The pine room has a deep green carpet on the ground. The only light is moonlight cast in through a small window on the right. A small shrine sits in front of the window, where there is insense burning slowly.>
	indescription <You walk into the:>
	north <Slate>
	south <Mauve>
	west <Rose>

	define object <Stone>
		alias <Stone Key>
		look msg <The key is large and heavy, made out of solid concrete. It is very plain, the only marks being the teeth.>
		take {
			msg <You slip it into your pocket, which you hope can take the weight.>
			give <Stone>
		}
		prefix <the>
		suffix <sitting heavily on the path.>
		drop everywhere <It dents the floor as you set it down.>
	end define

end define

define room <Blank>
	alias <Blank Room>
	look <The blank room is bright white but not like it should be... you can not see any walls or floor. You're walking on white and you see white. You can even hear white. The only object that is not white is a small metal grate set into the floor (or where the floor should be).>
	indescription <:>
	north <Rose>
	south <NW Grey>
	east <Mauve>
	west <Orange>

	define object <Emerald>
		alias <Emerald>
		look msg <It is large and perfect, with no flaws or blemishes. It is a deep green, with smooth, finely cut edges.>
		take if got <Screwdriver> then {
			msg <You unscrew the grate to remove it, and then pick it up.|nYou got a treasure!>
			give <Emerald>
		}
		else msg <The vent is screwed tightly down. You can't get the emerald.>
		prefix <a beautiful>
		suffix <sitting on the ground>
		drop everywhere <You gingerly set the emerald down on the ground.>
	end define

end define

define room <Mauve>
	alias <Mauve Room>
	look <The mauve room is peaceful and warm. There is dim torchlight over everything, and around you you can see various rivers of what looks like molasses running down carved rivets in the walls slowly. The liquid is very hot.>
	indescription <This is the:>
	north <Pine>
	south <NE Grey>
	west <Blank>
end define

define room <NE Grey>
	alias <NE Grey Cavern>
	look <This is part of the grey cavern, a large warehouse-like room with bare concrete walls, ceiling, and floor. There are large sturdy metal doors seperating it from the other rooms.>
	indescription <Your footsteps echo in the:>
	north <Mauve>
	south <SE grey>
	west <NW Grey>
end define

define room <SE grey>
	alias <SE Grey Cavern>
	look <This is part of the grey cavern, a large warehouse-like room with bare concrete walls, ceiling, and floor. There are large sturdy metal doors seperating it from the other rooms.>
	indescription <Your footsteps continue to echo in the:>
	north <NE Grey>
	west <SW Grey>
	command <flip switch> {
		msg <The switch now faces to the left. You can hear the doors out of the cavern unlatch.>
		clone <Switch Side; Switch Side; NE Grey>
		clone <Switch Side; Switch Side; NW Grey>
		clone <Switch Side; Switch Side; SW Grey>
	}

	define object <Sword>
		alias <Titanium Sword>
		look msg <It is beautiful-- It is sharp enough to cut a hair if the hair were dropped onto the blade, which is long and carved with intricate pictures of victory. There are precious stones set into the handle.>
		take if got <Stone> then {
			msg <You unlock the chain holding it to the wall and slip in into its sheath.|nYou picked up a treasure!>
			give <Sword>
		}
		else msg <The sword is chained to the wall. There is a large stone lock on the chain.>
		prefix <a>
		suffix <glistening on the ground>
		drop everywhere <You set the sword down, where it leaves a long shallow cut in the ground.>
	end define

end define

define room <NW Grey>
	alias <NW Grey Cavern>
	look <This is part of the grey cavern, a large warehouse-like room with bare concrete walls, ceiling, and floor. There are large sturdy metal doors seperating it from the other rooms.>
	indescription <Here you find the:>
	north <Blank>
	south <SW Grey>
	east <NE Grey>
	west <Blue>
end define

define room <SW Grey>
	alias <SW Grey Cavern>
	look <This is part of the grey cavern, a large warehouse-like room with bare concrete walls, ceiling, and floor. There are large sturdy metal doors seperating it from the other rooms.|n|nIn this section of the grey cavern something has been going on. In front of you are the remains of some sort of woodwind instrument and signs of something violent.>
	indescription <Your footsteps echo here in the:>
	north <NW Grey>
	east <SE grey>
	west <Celedon>

	define object <Remains>
		alias <remains>
		look msg <They are just bits and pieces of what looks like maybe a clarinet or something. There are large chunks missing out of the concrete nearby and the activity is recent.>
		prefix <some charred>
		suffix <of a woodwind instrument>
		article <them>
	end define

end define

define room <Storage>
	look <you should not read this during gameplay. If you do something is very wrong.>

	define object <Switch Side>
		hidden
	end define

	define object <Rainbow Key>
		alias <Rainbow Key>
		look msg <The rainbow key is beautiful and is constantly changing color. It is small and glows brightly. Gravity does not affect it.>
		take {
			msg <You put the key in your pocket, where it floats around, oblivious to gravity.>
			give <Rainbow Key>
		}
		prefix <the>
		suffix <shining in the air at eye level>
		drop everywhere <The rainbow key begins to float around the room.>
	end define

	define object <Prism>
		alias <Prism>
		look msg <At first it is clear, but the light makes it display its unique artwork on the walls and floor around it.>
		take {
			msg <You pick up the prism, weighing it in your hand, and hold it up to the light. A bright rainbow streaks across your face.>
			give <Prism>
		}
		prefix <a beatiful>
		suffix <displaying the rainbow>
		drop nowhere <You must always keep the prism.>
	end define

end define

define room <Hallway>
	alias <North Hallway>
	look <The north section of the hallway is very long, and as you go along the hallway it will become apparent that the hallway is in one big loop with eight corners. This is the only part that can get you back to the safe room.|n|nIt is a bland hallway, with white walls and ceiling but with a brightly colored, thick, comfy turckish carpet that goes on in either direction with the hallway. It is very, very long. There is a staircase on the north wall that leads up to the safe room.>
	indescription <You are in the:>
	north <Safe>
	east <NE Hall>
	west <NW Hall>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <NE Hall>
	alias <NE Hallway>
	look <The rainbow carpet continues with the hallway. You are standing at the NE corner of the loop. There is no noise.>
	indescription <This is the:>
	south <W Hall>
	west <Hallway>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <W Hall>
	alias <West Hallway>
	indescription <You step into the:>
	north <NE Hall>
	south <SW Hall>
	script if got <takeable cat> then {
		msg <Your cat yowls alarmingly and jumps away from the east wall. It stays at the west side in fear and when you further inspect the wall, it shows itself to be a hidden door.>
		create exit east <W Hall; entry hall>
	}
	else msg <This hall is just like the rest of it all. Colorful carpet, boring atmosphere.>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <entry hall>
	alias <Entry Hall>
	indescription <The hidden door opens and you step into the:>
	east if got <Rainbow Key> then {
		msg <The huge colorful doors swing open at the whim of your rainbow key, revealing the horrors within.>
		goto <Final Room>
	}
	else {
		msg <The doors are locked into place and do not budge in the slightest at your force.>
		goto <entry hall>
	}
	west <W Hall>
	script {
		if got <Prism> then {
			move <takeable cat; entry hall>
			msg <Your cat now waits for you here in the entry hall. There is a new, smaller doorway leading out. Bright daylight pours through it.>
		}
		else {
			lose <takeable cat>
			move <takeable cat; W Hall>
			msg <You are in a small room, where the carpet does not continue. Your cat refuses to come with you and stays in the west hallway, waiting for you to come back on a soft spot of carpet. The room has nothing in it of interest except a set of huge, colorful double doors leading further to the east.>
		}
	}
end define

define room <SW Hall>
	alias <SW Hallway>
	look <More carpet. Just boring. SW Corner of boring hallway.>
	indescription <You step further into the hallway, specifically the:>
	north <W Hall>
	west <S Hall>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <S Hall>
	alias <South Hallway>
	look <The hallway continues to be a boring hallway. Just carpet in a white hallway that's going in a loop.>
	indescription <You are in the:>
	east <SW Hall>
	west <SE Hall>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <SE Hall>
	alias <SE Hallway>
	look <This corner is just like every other corner. The hallway has no windows, nothing lively except the carpet. There is no sound at all.>
	indescription <This is the:>
	north <E Hall>
	east <S Hall>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <E Hall>
	alias <East Hallway>
	look <You are in the easternmost corner of the loop of the hallway. There is sill the same continuing colorful carpet, the same white walls. Same everything.>
	indescription <Welcome to the:>
	north <NW Hall>
	south <SE Hall>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <NW Hall>
	alias <NW Hallway>
	look <The northwest corner of the hallway is just like what you have seen: the carpet continues on and the walls stay boring white. Nothing happens.>
	indescription <You step into the:>
	south <E Hall>
	east <Hallway>
	command <hint> msg <Before you read the rest of this hint, make sure you have gone the full circle of the hallway.|n|n Still confused? Here's the hint: If you don't already have a cat, get one. Go back to the safe room and find the room with the cats, then get a cat and come back here.>
end define

define room <Beginning of Game>
	alias <Welcome to spectrum!>
	look <Spectrum is an interactive fiction game where you walk through a maze collecting treasures and dropping them off at a certain place. But there is more to it than that... as you progress in the game more and more of another conflict reveals itself...|n|nDuring gameplay, type "help" for the treasure hunt tips and "credits" for credits.|n|nFrom here, type "start" to start a new game.>
	indescription <:>
	command <start> {
		msg <Happy hunting!>
		goto <Safe>
	}
end define

define room <Final Room>
	alias <Final Room>
	look <You are standing in a huge, giant room that is completely rainbow in color. The walls are pulsating with light and are constantly cycling through the colors of all the rooms above.|n|nIn front of you stands Aargh. I can not describe aargh to you-- if I did, my keyboard would explode and your screen would sizzle and shatter. I can, however, tell you that Aargh is bigger than you, initially not very friendly, and currently mad that you stole his treasures.>
	indescription <You have walked into the:>
	west <entry hall>
	command <hint> msg <Here's your hint-- Aargh hates music. A lot.>
	command <play flute> if got <Flute> and got <Sheet Music> then {
		msg <You use the sheet music to play the eerie tune over the flute. Aargh screams his name and dissolves into a pile of ashes. In the ashes is a small prism. Your cat now waits for you in the room to the west, and there is a way out.>
		move <Aargh!!; Storage>
		move <Prism; Final Room>
		move <takeable cat; entry hall>
		create exit out <entry hall; End of Game>
	}
	else msg <You need an instrument AND you need music to read for the instrument. Try to avoid stomping feet!>

	define object <Aargh!!>
		alias <Aargh>
		look msg <As I said-- big, mean, and angry. No more is to be said.>
		speak msg <Aargh roars menacingly and you just barely avoid his foot as it tries to stomp you into the ground.>
		prefix <the creature>
		suffix <standing>
		displaytype <boss>
		gender <he>
	end define

end define

define room <End of Game>
	alias <Great Job!>
	look <You have beaten spectrum. Congratulations! You deserve a well-earned break in the hot tub.|n|n- Programming: Mocha Man|n- Software: QDK|n     www.axeuk.com/quest|n|nPress enter to end the game.>
	indescription <:>
	script {
		wait <>
		playerwin
	}
end define

define text <intro>

end define

define text <win>

end define

define text <lose>

end define


