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
	verb <taste> msg <You can't taste that.>
	verb <break> msg <You can't break that.>
	verb <kill> msg <You can't kill that.>
	verb <step forward> msg <You can't step forward that.>
	verb <identify> msg <You can't identify that.>
	verb <dodge> msg <You can't dodge that.>
	verb <chair leg> msg <You can't chair leg that.>
	define variable <Health !>
		type numeric
		value <100>
		display nozero <Health !>
	end define
	define variable <fear !>
		type numeric
		value <25>
		display nozero <Fear !>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Outside house>
	alias <Outside house>
	look <you are standing outside of a big house with a  a beutiful garden. you have lost your memory and all you remember is that your name is Joe Hannington, you find a note in your pocket while searching yourself for clues.>
	indescription <outside house>
	north <Entry hall>

	define object <Note>
		alias <note>
		alt <note>
		look <"I am writing this note to myself, no time to explain, search the house.">
		take <You keep the note in your pocket.>
		speak <Had it been able to speak, it had probably said - to lazy to read?>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <read = " I am writing this note to myself, no time to explain, search the house.">
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
		look <The house is big and seems like it's made in the 1800 era.>
		speak <No response.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <watch = The house is big and seems like it's made in the 1800 era.>
	end define

end define

define room <Entry hall>
	prefix <the>
	look <You are standing in the entry hall, there is a desk to the left and there are paintings on the walls. The room is unlit but you can see a lamp in the celing. There are also some shoes to the right of the door you just came from. To the west of where you stand is the kitchen and to the east is a closed door.>
	north <Kitchen1>
	south <Outside house>
	east locked <Strange room>

	define object <Painting>
		alias <painting>
		alt <painting>
		look <As you watch the painting for a few seconds you get more and more creeped about your current situation and look away.>
		speak <You can't speak to a painting how dumb are you?>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <watch = As you watch the painting for a few seconds you get more and more creeped about your current situation and look away.; examine = You note that the painting is extremely well made, and that it's probably worth a lot of money.>
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
			dec <fear !; 15>
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
	look <you enter the kitchen, the first thing you notice is that it smells really bad, like the smell from oil or gas, sharp and annoying to the nose. A pot with cold soup is on the table, along with a newspaper and a lighter. Around the table are four chairs, one thing of notice is that there are no windows in the room. There is also an oven, and a storage of what you assume are stuff like forks, glasses and plates. there is also a working bench with eggs on it. to the right of the working bench is a storage for what might be food or vegetables. As you enter the kitchen you also hear a strange noise from one of the upper floors. To the west of where you stand is the study.>
	south <Entry hall>
	east <Entry hall>
	west <Working room.>

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
		action <open> {
			dec <health !; 5>
			msg <As you open the kitchen storage, an unbearable smell breaks out, before you shut the door in panic you saw that there were crushed bottles of poisons and possibly antidotes inside. You start coughing and does so for about half a minute.>
			inc <fear !; 3>
		}
	end define

	define object <Chairs>
		alias <chairs>
		alt <chair>
		look <you get the idea that you could break off a leg from one of the chairs and use it as a weapon, whether for fighting or feeling safer.>
		take {
			msg <You smash one of the chairs against the fllor and one of the legs break off and you take it in your hand. Now you could use it as a weapon or break locks with it.>
			give <Chairs>
			unlock <Entry hall; east>
			unlock <Strange room; west>
		}
		speak <It doesn't respond.|n|nHow strange.>
		prefix <some>
		displaytype <Object>
		article <it>
		gender <it>
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

	define object <ceiling1>
		look <It's an ordinary ceiling except that it is highly burnt, of what you assume are chemical substances moving upwards. These substances would be extremely poisonus, possibly even the strongest ever made.>
		speak <It doesn't respond, to be honest.>
		displaytype <Object>
		article <it>
		gender <it>
		properties <listen = You hear the strange noise once again but it seems to be stationary at about the same point right above you. You get the idea that it might be something moving back and forth, probably a human or an animal.>
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

	define object <upwards>
		alias <upwards>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <listen = You hear the same noise as when you entered the kitchen, it is close to stationary there though just moving a few meters back and forth, and you  can make out that it is a person or an animal.>
	end define

end define

define room <Working room.>
	alias <study>
	prefix <study>
	look <As you enter the study you see it's a complete mess, chairs upside down, papers all over the place, closets opened wide. You begin searching the room for clues of what happened. There are a couple of crushed bottles of what you assume are chemical substances. A windows stand open towards the garden outside. The only thing normal seems to be the desk which is not affected by the chaos. There is also a smell similar to the one in the kitchen, though much weaker  To the south of where you stand is what you assume is the bathroom, and to the right is a stairwell leading up.>
	indescription <the study>
	south <bathroom>
	east <Kitchen1>

	define object <Crushed bottles>
		look <it seems that they were both containing chemical substances, which are now on the floor beside the  pieces of glass. You could taste just a small bit of the substances just to identify them or gain knowledge.  Though it might be a bad idea.>
		speak <They doesnt seem hostile in their response, neither friendly.>
		prefix <seven>
		suffix <sending out a foul smell>
		displaytype <Object>
		article <it>
		gender <it>
		properties <examine = on closer look you see that they are all of the same type. Which means they carried the same substance.>
	end define

	define object <wall1>
		alias <wall>
		look <It is an ordinary wall, just barely affected by the posions.>
		speak <No response>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <break = Fore some odd reason, your'e not strong enough.>
	end define

	define object <window>
		look <the window seems normal, you look outside it and see a beutiful garden.>
		speak <yay for non-responding windows>
		displaytype <Object>
		article <it>
		gender <it>
		properties <break = Do you really wanna do that? no.>
	end define

	define object <desk1>
		look <It's an ordinary desk, you could always open it.>
		take <you pick up the notes and keep them in your pocket.>
		speak <No response.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <open = There are a collection of papers inside. You examine them and you understand that the owner of the house is some sort of scientist, rich and probably the creator of all the poisons.; kill = You can't kill a desk for christs sake.>
		action <open> {
			msg <There are a collection of papers inside, you examine them and come to the conclusion that the owner of the house must be very rish, and probably the creator of all the poisons, as he is a scientist. You also find some musical notes inside the desk.>
			show <musical notes>
		}
	end define

	define object <musical notes>
		look <they are musical notes,  of what you assume is piano piano music. As you look at them, you remember that you had piano playing as a hobby before you lost your memory. You remember sitting at the piano trying not to do anything wrong in front of your mean teacher.>
		speak <they don't respond>
		prefix <some>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
		properties <examine = it is classical music, and you notice they are strange, some notes look like nothing you have seen before, and you realise the sound they must make when played must be truly revolutionary.>
	end define

end define

define room <Strange room>
	alias <strange room>
	prefix <a>
	look <You break open the lock with your chair leg and find it completely empty, except for eight bottles of poison standing on the floor and a corpse. The room feels strange, like there's something wrong with it.>
	west locked <Entry hall>

	define object <poison>
		look <the bottles of poison seem new, a bit to new, it looks like they descended upon the earth from a perfect world just a second ago no matter hor long you look upon them. >
		speak <As you speak to the poison>
		displaytype <Object>
		article <it>
		gender <it>
		properties <examine = the bottles of poison seem strange, like you shouldn't interact with them. you could "step forward poison" to interact further with them.>
		action <step forward> {
			msg <As you step forward against the poison you feel rather than see something emerge between you and the bottles. You stop dead in your tracks as a cold hand grabs around your heart and squeezes it hard. Just as you think it's about to break you feel the hand let go off your heart. And notice that the being points a finger towards the door you came from. You better leave. Now.>
			dec <health !; 15>
		}
	end define

	define object <wall2>
		alias <wall>
		look <the walls seems completely ordinary, but it feels strange, like something is wrong with it.>
		speak <the wall doesn't respond, but it feels like what you did had an effect on the room, maybe it's dangerous to interact with it.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <corpse>
		look <the corpse seem fresh and the dead face shows signs of fears not of this world.>
		speak <No reponse.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <examine = you examine the corpse and come to the conclusion that it didn't die of natural reasons, at least not as you can see. The corpse has a pistol on it but it isn't loaded, you could pick it up in case you would find bullets later though.; identify = you can't identify the corpse, it seems to be an ordinary man, very well-built though.>
		action <examine> {
			msg <You cannot see anything wrong with the person and you assume that he either died of sickness or something you have overlooked. The corpse has a pistol on it but it is emptied. >
			show <pistol>
		}
	end define

	define object <pistol>
		alt <shoot>
		look <the pistol is emptied, and you can see the cartridge cases all around in the room. the pistol must have been fired in panic, but you can't see what would cause it. You could pick up the weapon if you would find ammunition later on.>
		take msg <you pick up the gun and you weigh it in your hand, you get vague memories of shooting someone in the past, though the shot didn't kill.>
		speak <There is actually no respose from the pistol>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

end define

define room <Bathroom>
	alias <bathroom>
	look <as you enter the bathroom you notice something strange with it, that its completely normal, it has a shower, a toilet and a basin. It also has a window facing the street behind the mansion. As you enter it you also hear the strange noise above you again, it has moved location.>

	define object <wall3>
		alias <wall>
		look <The wall is ordinary.>
		speak <no response actually.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <ceiling>
		look <it's an ordinary ceiling, you hear the strange sound from above.>
		speak <the noise upstairs stops for a moment, and then continues its sounds.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <listen = the noise is quite clear when you listen, and you realise the sounds are from an animal.>
		action <listen> {
			inc <fear !; 5>
			msg <You once again hear the strange sound from above, and you listen carefully. You realise it must be some sort of animal which crawls around and snurvles, it sounds like a dog, but not quite like it. There's something wrong.... After hearing the sound you get a bit scared of going up to the second floor. As you hear the noise you draw the conclusion that the best weapon to use would be a long weapon, not a short one, maybe a stick from one of the trees outside?>
		}
	end define

	define object <basin>
		look <the basin looks ordinary, it's quite fine work though. >
		speak <No, basins don't speak, you misunderstand.>
		displaytype <Object>
		article <it>
		gender <it>
		properties <use = You clean your hands and your face and feel a bit better.>
	end define

	define object <bath tub>
		alias <shower>
		look <It's an expensive shower, but it's not in gold or anything, you feel it would be quite nice with a bath or a shower. You feel a bit safe in the bathroom, away from poisons and messy rooms.>
		speak <no response.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		properties <use = you enter the shower and use it for about ten minutes, it's so nice you even take 5 minutes extra after drying yourself.>
	end define

	define object <toilet>
		look <it looks like an exensive toilet, no blood, no poison, just an expensive toilet.>
		speak <no response>
		displaytype <Object>
		article <it>
		gender <it>
		properties <use = you do your business at the toilet for a couple of minutes.>
	end define

	define object <mirror>
		look <You are a man in your lower 30's, dark hair. well-built but no bodyguard, about 175 centimeters long, big hands, well dressed but with dirty clothes, and with a ring on your left finger, you are appearently married or engaged. If you just had to guess you would say you were a businessman who suddently did something putting him in trouble.>
		speak <You speak into the mirror and see someone speak back, you immidieatly realise that it's you.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <stairwell>
	look <You enter the stairwellroom, it's dark in here and there are no lamps, you get a feeling about not wanting to go up to the second floor, the sound you heard earlier gets even stronger now. To the north of where you stand is the stairwell.>
end define

define room <corridor>
	look <When you have climbed up the stairs you find yourself in a long corridor, with one door at the end. But before you are given time to think a giant dog runs towards you, what do you do?>

	define object <Dog>
		look <The dog looks furious and is running straight at you.>
		speak <No time to do that.>
		displaytype <Object>
		article <it>
		gender <it>
		properties <dodge = The dog lunges at you but you sidestep just before it reaches you and it falls down the steps of the stair, it will be up soon though and if you want to attack the dog, now is the time.; chair leg>
		action <dodge> msg <The dog lunges straight at you but you manage to sidestep it just in time, the dog falls down the steps of the stairs. It will be up soon however, and you probably won't get a better chance at attacking it.>
	end define

end define

