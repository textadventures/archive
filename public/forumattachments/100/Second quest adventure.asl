' "house"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <house>
	asl-version <410>
	start <Outside house>
	game author <Fritiof>
	game info <Created with QDK 4.1.5>
	startscript background <red%32%>
	command <> 
	verb <read> msg <You can't read that.>
	verb <watch> msg <You can't watch that.>
	verb <look closer;examine> msg <You can't look closer that.>
	verb <use> msg <You can't use that.>
	verb <light;turn on> msg <you can't light that>
	verb <examine> msg <You can't examine that.>
	verb <open> msg <You can't open that.>
	verb <weapon > msg <You can't weapon  that.>
	verb <smash> msg <You can't smash that.>
	verb <pick up> msg <You can't pick up that.>
	verb <listen> msg <You can't listen that.>
	define variable <Health>
		type numeric
		value <100>
		display nozero <Health:100>
		onchange msg <You lose health.>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Outside house>
	alias <Outside house>
	look <you are standing outside of a big house, you have lost your memory and all you remember is that your name is Joe Hannington, you find a note in your pocket while searching yourself for clues.>
	indescription <outside house>
	north <Entry hall>

	define object <Note>
		alias <note>
		alt <note>
		look <"I am writing this note to myself, no time to explain, search the house">
		take <You keep the note in your pocket.>
		speak <Had it been able to speak, it had probably said - to lazy to read?>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <read = " I am writing this note to myself, no time to explain, search the house">
	end define

	define object <Tree outside house>
		alias <Tree>
		alt <tree>
		look <It doesn't look like a tree you would be able to climb without the proper gear.>
		speak <It answers with silence, quite natural for a tree.>
		prefix <a huge>
		displaytype <Object>
		article <it>
		gender <it>
		properties <examine = On closer look you see that the tree looks unpropotional, the upper part of the tree trunk is way  bigger than the lower part, which, of course, you find out of the ordinary>
	end define

	define object <house>
		look <The house is big and seems like it's made in the 1800 era>
		speak <no response>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <watch = The house is big and seems like it's made in the 1800 era>
	end define

end define

define room <Entry hall>
	prefix <the>
	look <You are standing in the entry hall, there is a desk to the left and there are paintings on the walls. The room is unlit but you can see a lamp in the celing. There are also some shoes to the right of the door you just came from.>
	south <Outside house>
	west <Kitchen1>

	define object <Painting>
		alias <painting>
		alt <painting>
		look <As you watch the painting for a few seconds you get more and more creeped about your current situation and look away.>
		speak <You can't speak to a painting how dumb are you?>
		displaytype <Object>
		article <it>
		gender <it>
		properties <watch = As you watch the painting for a few seconds you get more and more creeped about your current situation and look away.>
	end define

	define object <lamp>
		alt <light>
		look <The lamp is unlit>
		speak <You say something to the the lamp and it gives no response>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <use = You light the lamp, the darkness fades and you feel a bit more safe>
		action <use> {
			property <lamp; look=the lamp is now lit and you feel a bit more safe>
			msg <you light the lamp>
		}
		action <light> {
			property <lamp; look=the lamp is now lit and emits light into the now welcoming entry hall>
			msg <you switch on the lamp>
		}
	end define

	define object <wall>
		look <You see nothing of notice>
		speak <no response,naturally>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <watch = it is a very ordinary wall and you get quite bored by watching it>
	end define

	define object <shoes1>
		alias <shoes>
		look <It's four pair of shoes, you could pick up a pair to use as primitve boxing gloves or as a throwing weapon.>
		take <you pick up the biggest pair of shoes.>
		speak <No response from the shoes.>
		prefix <some>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <Kitchen1>
	alias <kitchen>
	prefix <the>
	look <you enter the kitchen, the first thing you notice is that it smells really bad, like the smell from oil or gas, sharp and annoying to the nose. A pot with cold soup is on the table, along with a newspaper and a lighter. Around the table are four chairs, one thing of notice is that there are no windows in the room. There is also an oven, and a storage of what you assume are stuff like forks, glasses and plates. there is also a working bench with eggs on it. to the right of the working bench is a storage for what might be food or vegetables. As you enter the kitchen you also hear a strange noise from one of the upper floors.>
	east <Entry hall>

	define object <oven>
		look <There seems to be nothing of interest with the oven>
		speak <It doesn't respond.>
		prefix <an>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Kitchen storage>
		look <It looks like a kitchen storage>
		speak <It responds with a creepy voice: No it doesn't respond what did you expect?>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <open = what you assumed whas a kitchen storage was actually a storage with chemical substances, you are no chemitrist, (at least you don't remember being one) but you can  make out that there are all from medicine to poisons inside. As you open the food storage the bad smell is becoming much mor intense and you lose 5 hit points before closing the door.>
		action <open> dec <health; 5>
	end define

	define object <Chairs>
		alias <chairs>
		alt <chair>
		look <you get the idea that you could break off a leg from one of the chairs and use it as a weapon, whether for fighting or feeling safer.>
		take <You hit the chair against the floor until a leg breaks off, you take it in your hand, ready to use it as a weapon.>
		speak <It doesn't respond.|n|nHow strange.>
		prefix <some>
		displaytype <Object>
		article <it>
		gender <it>
		properties <take = you smash one of the chairs against the floor until one of the legs break. You take it in your hand and get a weak feeling about being dangerous.>
	end define

	define object <working bench>
		look <There seems to be nothing of importance on the working bench, though you could use it as a shield,using a chair leg as a weapon seems like a better idea.>
		take msg <You find it meaningless to pick up the working bench, it's quite heavy and less usefull than a chair leg as a weapon.>
		speak <Nothing happens.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <eggs>
		alt <egg>
		look <they are eggs, you really wanna smash them against the floor, don't you?>
		speak <no response, even if it had been a chicken inside one of the eggs it had probably just shut up.>
		prefix <some>
		displaytype <Object>
		article <them>
		gender <they>
		properties <weight = 400>
		action <smash> {
			property <eggs; look=the eggs are now on the floor,smashed>
			msg <you smash the eggs against the floor, the only thing you might have achieved is making it clearer that you are in the house and you get a feeling that maybe you shouldn't had smashed the eggs.>
		}
	end define

	define object <Ceiling>
		look <It's an ordinary ceiling except that it seems a little bit burnt, of what you assume are chemical substances moving upwards.>
		speak <It doesn't respond, to be honest.>
		displaytype <Object>
		article <it>
		gender <it>
		properties <listen = You hear the strange noise once again but it seems to be stationary at about the same point right above you. You get the idea that it might be something moving back and forth.>
	end define

	define object <Newspaper>
		look <The front cover of the newspaper says "Joe Hannington found dead the night to this day, Joe was shot in an open street and then thrown in a river nearby.>
		take <you pick up the newspaper>
		speak <No response.>
		prefix <a>
		suffix <with a quite interesting front page>
		displaytype <Object>
		article <it>
		gender <it>
		properties <examine = On the inside of the newspaper there is a short poem written by you to explain your person. While reading it you see that the handwriting of it is not the same as the one on your note, whether it is the poem or the note which is fake remains to be seen.>
	end define

	define object <lighter>
		look <You look at the lighter, on first glance it seems ordinary.>
		take <you pick up the lighter>
		speak <the lighter gives no response.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <examine = on second look you see that the lighter is made in solid gold, probably worth a lot of money.>
	end define

	define object <Food storage>
		look <It looks like a food storage.>
		speak <It doesn't speak back.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <open = inside the food storage there are all from carrots to sugar, nothing interesting.>
	end define

end define

define room <Working room.>
	alias <study>
	prefix <study>
	look <As you enter the study you see it's a complete mess, chairs upside down, papers all over the place, closets opened wide. You begin searching the room for clues of what happened.>
end define

