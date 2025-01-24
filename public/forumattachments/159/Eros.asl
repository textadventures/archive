' "The Dead Man Of Eros"
' Created with QDK 4.1.4

!include <stdverbs.lib>

define game <The Dead Man Of Eros>
	asl-version <410>
	start <ForestEleven>
	game info <Created with QDK 4.1.4>
	command <examine bushes;x bushes> {
		if not here <bushes> then msg <You find nothing useful in the bushes.> else {
			if got <branch> then {
				msg <The branch reveals gaping holes within the bushes and out pops a keyring full of metallic keys.>
				show <metal keys>
				give <metal keys> } else msg <You search futilly with your bare hands and find nothing.> }
	}
	command <examine twigs;x twigs> {
		if not here <twigs> then msg <You ruffle through the twigs and find nothing.> else {
			msg <On a hunch, you scramble through the twigs and grab a brass key caught on the stalks.>
			show <brass key>
			give <brass key> }
	}
	command <use motor boat;use boat> {
		if flag <padlockisopen> then {
			msg <You open the padlock. and soon you are on the boat and away from the shore and are on the lake and streaming toward the mainland.. As soon as you arrive on the mainland, you exit the boat and  stumble through some thickets and clear your way onto a driveway.>
			goto <Driveway> } else msg <You can't access the boat unless the padlock is opened.>
	}
	command <> 
	command <examine coating;x coating;examine paint;x paint> {
		if here <garage door> then {
			msg <The painting is uneven in spots revealing slivers of wood. You pull a small knife from your pocket and  cut a thin piece of wood from the garage door.>
			show <sliver of wood>
			give <sliver of wood>
			flag on <sliverGot> }
	}
	verb <examine> msg <You can't examine that.>
	verb <open> msg <You can't open that.>
	verb <use> msg <You can't use that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <ForestEleven>
	alias <Thick Forest>
	prefix <the>
	look <Twigs and bushes tickle your face in all directions.>
	east <ForestTwelve>
	west msg <The scrubs and bushes suddenly become impassable...|n>
end define

define room <ForestTwelve>
	alias <Thick Forest>
	prefix <the>
	look <Twigs and bushes tickle your face in all directions.>
	east <ForestThirteen>
	west msg <The scrubs and bushes suddenly become impassable...>
end define

define room <ForestThirteen>
	alias <Thick Forest>
	prefix <the>
	look <Twigs and bushes tickle your face in all directions.>
	east <ForestFourteen>
	west msg <The scrubs and bushes suddenly become impassable...|n>
end define

define room <ForestFourteen>
	alias <Thick Forest>
	prefix <the>
	look <Twigs and bushes tickle your face in all directions.>
	east <ForestFifteen>
	west msg <The scrubs and bushes suddenly become impassable...|n>
end define

define room <ForestFifteen>
	alias <Thick Forest>
	prefix <a>
	look <Twigs and bushes tickle your face in all directions.>
	east <ForestSixteen>
	west msg <The scrubs and bushes suddenly become impassable...|n>
end define

define room <ForestSixteen>
	alias <Thick Forest>
	prefix <a>
	look <Twigs and bushes tickle your face in all directions.>
	north <ForestTwentySix>
	east msg <The scrubs and bushes suddenly become impassable...|n>
	west msg <The scrubs and bushes suddenly become impassable...|n>
end define

define room <ForestTwentyOne>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously.|n>
	north <ForestThirtyOne>
	east msg <A wall of brush and twigs blocks your way.>
	west msg <A wall of brush and twigs blocks your way.|n>
end define

define room <ForestTwentyTwo>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously.|n>
	east msg <A wall of brush and twigs blocks your way.|n>
	west <ForestTwentyOne>
end define

define room <ForestTwentyThree>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously.|n>
	east msg <A wall of brush and twigs blocks your way.|n>
	west <ForestTwentyTwo>
end define

define room <ForestTwentyFour>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously.|n>
	east msg <A wall of brush and twigs blocks your way.|n>
	west <ForestTwentyThree>
end define

define room <ForestTwentyFive>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously. There is a dull flash in the bushes.>
	east msg <A wall of brush and twigs blocks your way.|n>
	west <ForestTwentyFour>

	define object <bushes>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <examine> 
	end define

	define object <metal keys>
		take
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

	define object <brass key>
		take
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

	define object <twigs>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <examine> 
	end define

end define

define room <ForestTwentySix>
	alias <Thicker Forest>
	prefix <a>
	look <The twigs and bushes are indiscriminately slapping you about mercilously.|n>
	south <ForestSixteen>
	east msg <A wall of brush and twigs blocks your way.|n>
	west <ForestTwentyFive>
end define

define room <ForestThirtyOne>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.>
	south <ForestTwentySix>
	east <ForestThirtyTwo>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>
end define

define room <ForestThirtyTwo>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.|n>
	east <ForestThirtyThree>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>

	define object <branch>
		look <It is a sharp branch.>
		take {
			give <branch>
			msg <You find that your surroudings have changed...>
			goto <ForestTwentyFive>
		}
		prefix <a gnarly>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <ForestThirtyThree>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.|n>
	east <ForestThirtyFour>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>
end define

define room <ForestThirtyFour>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.|n>
	east <ForestThirtyFive>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>
end define

define room <ForestThirtyFive>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.|n>
	east <ForestThirtySix>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>
end define

define room <ForestThirtySix>
	alias <Thickest Forest>
	prefix <the>
	look <The twigs and branches are clawing at your face drawing welts of blood.|n>
	north <Wooden Dock>
	west msg <You writhe in agony as a thorn lashes across your forehead, making progress in that direction very difficult.|n>
end define

define room <Wooden Dock>
	look <The wooden dock is abutting a lake shore. A small motor boat is moored to the wooden dock.  You can see the mainliand in the distance.>
	indescription <You are on:>
	south <ForestThirtySix>

	define object <padlock>
		look <You can open the  padlock with the proper key.>
		prefix <hugh>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <open> {
			if got <brass key> then {
				msg <The brass key fits the lock, The padlock is open.>
				flag on <PadlockIsOpen> } else msg <The key doesn't fit try again.>
		}
	end define

	define object <motor boat>
		look <The motor boat looks servicable. Once the padlock is opened it can be used.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <dock>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <mainland>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Driveway>
	prefix <a>
	look <You are next to a closed garage door and a a stone pathway leading to the front door.>
	indescription <You are standing on:>
	northeast <Front Door>

	define object <garage door>
		look <The garage door is brand new. It has been painted over with a new coating of paint. The garage door is currently closed.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <open = Try as you might, the garage door won't budge.>
	end define

	define object <sliver of wood>
		look <It is long and thin, good for reaching into small places.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		hidden
		action <use> {
			if ( #quest.currentroom# = Treasure Room ) then {
				msg <The dais divides into three pieces and you find a gold bar in your hands!!!>
				playerwin }
		}
	end define

end define

define room <Outer EntranceWay South Siide>
	prefix <the>
	look <You are in what could be descibed as the outside rim of a bicycle wheel. Various rooms lead from the outside rim. There is a cathedral ceiling above the central area which comprises the Living Room. In front of you and to the right , a flight of stairs leads to the basement.|n>
	north <Living Room>
	south <Front Door>
	west <Short Hallway>
	southeast <Computer Room>
	down <Basement Stairs>
end define

define room <Outer EntranceWay North Side>
	look <You are in what could be descibed as the outside rim of a bicycle wheel.   Various rooms lead from the outside rim. There is a cathedral ceiling above the central area which comprises the Living Room.  You are standing in front of an artificial fireplace.>
	north <Four Seasons Room>
	south <Living Room>
	northwest <Dining Room>
	northeast <Master Bedroom>
end define

define room <Short Hallway>
	prefix <a>
	look <The floor is creaking in some spots.>
	north <Hallway Bathroom>
	south <Hallway Closet>
	east <Outer EntranceWay South Siide>
	west <Laundry Room>
end define

define room <Computer Room>
	prefix <a>
	look <There is a maroon couch with flecks of white on one side of the room. On the other side is a desk with a computer on it.>
	northwest <Outer EntranceWay South Siide>

	define object <couch>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <desk>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <computer>
		look <It is a Compac Presario brand computer.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Front Door>
	prefix <the>
	indescription <You are at:>
	north {
		msg <You open the front door and walk through.>
		goto <Outer EntranceWay South Siide>
	}
	southwest <Driveway>
end define

define room <Living Room>
	prefix <the>
	look <An onyx table is placed on the center of an oriental rug. There is a white sectional couch on the south end. Individual ottomans separated by small circualar tables  cover the remaining sides. The small tables contain small metallic containers filled with sweets and condiments. >
	north <Outer EntranceWay North Side>
	south <Outer EntranceWay South Siide>
end define

define room <Basement Stairs>
	prefix <the>
	look <Something brushes past your legs emitting a loud meow.>
	indescription <You are entering:>
	up <Outer EntranceWay South Siide>
	down <baseOne>
end define

define room <Dining Room>
	prefix <the>
	look <A bright chandalier is shining over a mahaghany table with seats eight. There are cupboards with fresh dishes, glasses and cuttlery.>
	south <Kitchen>
	southeast <Outer EntranceWay North Side>

	define object <chandalier>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <mahaghany table>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <cupboards>
		look <There is nothing special about the cupboards and its cuttllery and assorted dishes and glasses.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Four Seasons Room>
	prefix <the>
	look <You are in an all purpose den combination tv room. There are couches surrounded with magazines and newspapers>
	south <Outer EntranceWay North Side>

	define object <couches>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <magazines>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <newspapers>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Master Bedroom>
	prefix <the>
	look <There is a double bed across from a bureau in front of which is a footlocker.>
	south <Master Bathroom>
	southwest <Outer EntranceWay North Side>

	define object <double bed>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <bureau>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <footlocker>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Master Bathroom>
	north <Master Bedroom>
end define

define room <baseOne>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough once.>
	east <baseTwo>
	up <Basement Stairs>
	script timeron <dark116>
end define

define room <baseTwo>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough twice.>
	south <basementSix>
	east <baseThree>
	west <baseOne>
	script timeron <dark214>
end define

define room <baseThree>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough three times.>
	south <basementSeven>
	east <basementFour>
	west <baseTwo>
	script timeron <dark315>
end define

define room <basementFour>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough four times.>
	west <baseThree>
	script timeron <dark413>
end define

define room <basementFive>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough five times.>
	script timeron <dark58>
end define

define room <basementSix>
	alias <Dark and Dingy BaseMent>
	prefix <a>
	look <It is dark in here!!! You cough six times.>
	north <baseTwo>
	script timeron <dark611>
end define

define room <basementSeven>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough seven times.>
	north <baseThree>
	script timeron <dark7treas>
end define

define room <basementEight>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It dark in here!!! You cough eight times.>
end define

define room <basementNine>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough nine times.>
	script timeron <dark92>
end define

define room <basementTen>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough ten times.>
	south <basementFourteen>
	script timeron <dark107>
end define

define room <basementEleven>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough eleven times.>
	south <basementFifteen>
	script timeron <dark117>
end define

define room <basementTwelve>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough 12 times.>
end define

define room <basementThirteen>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough thirteen times.>
	east <basementFourteen>
end define

define room <basementFourteen>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough fourteen times.>
	north <basementTen>
	west <basementThirteen>
end define

define room <basementFifteen>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough fifteen times.>
	north <basementEleven>
	east <basementSixteen>
end define

define room <basementSixteen>
	alias <Dark and Dingy Basement>
	prefix <a>
	look <It is dark in here!!! You cough sixteen times.>
	west <basementFifteen>
end define

define room <Treasure Room>
	prefix <the>
	look <You are facing a hole in a raised dais. You place your hand in the hole and turn it a bit and almost come up with some thing but not quite. Perhaps you need a thin implement of some type.|n>
	script timeron <dragon>
end define

define room <Hallway Closet>
	prefix <a>
	look <Hats top the shelfs. Coats hang on hangers. Shoes line the floors.>
	north <Short Hallway>

	define object <hats>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <coats>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <shoes>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Hallway Bathroom>
	look <You are in a small bathroom.>
	south <Short Hallway>
end define

define room <Laundry Room>
	prefix <the>
	look <You see a cupboard beneath which is a washer and dryer. Behind you is the door to the garage which is locked and closed.>
	north <Kitchen>
	east <Short Hallway>

	define object <cupboard>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <washer>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <dryer>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <door>
		look <The garage area has no meaning in this adventure.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Kitchen>
	prefix <the>
	look <As of now you have entererd a clean and tidy kitchen.>
	north <Dining Room>
	south <Laundry Room>
end define

define timer <dark116>
	interval <10>
	action {
		if ( #quest.currentroom# = baseOne ) then {
			msg <You stumble around in the darkness...>
			goto <basementSixteen> }
	}
	disabled
end define

define timer <dark413>
	interval <10>
	action {
		if ( #quest.currentroom# = basementFour ) then {
			msg <You stumble around in the darkness...>
			goto <basementThirteen> }
	}
	disabled
end define

define timer <dark58>
	interval <10>
	action {
		if ( #quest.currentroom# = basementFive ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementEight> }
	}
	disabled
end define

define timer <dark92>
	interval <10>
	action {
		if ( #quest.currentroom# = basementNine ) then {
			msg <You stumble around in the darkness...|n>
			goto <baseTwo> }
	}
	disabled
end define

define timer <dark214>
	interval <10>
	action {
		if ( #quest.currentroom# = baseTwo ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementFourteen> }
	}
	disabled
end define

define timer <dark315>
	interval <10>
	action {
		if ( #quest.currentroom# = basementThree ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementFifteen> }
	}
	disabled
end define

define timer <dark611>
	interval <10>
	action {
		if ( #quest.currentroom# = basementSix ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementEleven> }
	}
	disabled
end define

define timer <dark7treas>
	interval <10>
	action {
		if ( #quest.currentroom# = basementSeven ) then {
			msg <You stumble around in the darkness...|n>
			goto <Treasure Room> }
	}
	disabled
end define

define timer <dark107>
	interval <10>
	action {
		if ( #quest.currentroom# = basementTen ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementSeven> }
	}
	disabled
end define

define timer <dark117>
	interval <10>
	action {
		if ( #quest.currentroom# = basementEleven ) then {
			msg <You stumble around in the darkness...|n>
			goto <basementSeven> }
	}
	disabled
end define

define timer <dragon>
	interval <20>
	action {
		if ( #quest.currentroom# = Treasure Room ) and not flag <slivergot> then {
			msg <A dragon sees you fiddling at the dais and opens its mouth...>
			playerlose }
	}
	disabled
end define

define text <intro>
Welcome to my first adventure. Here are a few pointers to keep you alive and healthy.

1) Unless the text explicitly states not , you are maiking progress. Look for changes in wording in locations for progress changes.

2) There ARE unwinnable situations in the game. In that case, simply restart the game.

3)  The game can be solved by clever use of the verbs e(x)amine and use.

4)  Finally, solve the game in terms of the descriptions given in the game.


And now on with the adventure...
end define

define text <win>
Good job, you have won the game!!!
end define

define text <lose>
You have just lost the game, try again.
end define

