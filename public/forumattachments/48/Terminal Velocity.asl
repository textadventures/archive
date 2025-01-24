' "Terminal Velocity"
' Created with QDK Pro 4.1.2

!include <stdverbs.lib>

define game <Terminal Velocity>
	asl-version <410>
	start <cockpit>
	game info <Created with QDK Pro 4.1.2>
	default fontsize <11>
	startscript {
		flag on <in plane>
		background <A9A9A9>
		foreground <F5F5DC>
	}
	verb <wear> msg <You can't wear that.>
	verb <shoot> msg <You can't shoot that.>
	verb <attach> msg <You can't attach that.>
	verb <fasten> msg <You can't fasten that.>
	verb <pull> msg <You can't pull that.>
	define variable <player>
		type string
		value <in plane>
	end define
	define variable <plane dive begin>
		type numeric
		value <1>
	end define
	define variable <oxygen left>
		type numeric
		value <10>
	end define
	define variable <flare ammo>
		type numeric
		value <1>
	end define
	define variable <falling>
		type numeric
		value <0>
	end define
	define variable <floating>
		type numeric
		value <0>
	end define
	define variable <floating alt>
		type numeric
		value <0>
	end define
	define variable <alt>
		type numeric
		value <40000>
	end define
	define variable <rate of decent>
		type numeric
		value <0>
	end define
	define variable <main canopy>
		type numeric
		value <20>
	end define
	define variable <free fall>
		type numeric
		value <184>
	end define
	define variable <reserve canopy>
		type numeric
		value <30>
	end define
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <cabin>
	prefix <the main>
	look <You are in the main cabin of an airplane. The side exit has been blown away and the sound of the air rushing past is blaring to a deafening level. You see 2 rows of seats here and there is a luggage rack attached to the ceiling.|n|nYou can go north to the cockpit or south to enter tail section.|s09|n|s00>
	north <cockpit>
	south <tail section>
	command <look under seats> {
		if got <harness> then msg <Nothing else under the seats.> else {
			reveal <harness>
			msg <|s00You see a black |bharness |xbstuck underneath one of the seats.> }
	}
	command <look under seat> {
		if got <harness> then msg <Nothing else under the seats.> else {
			reveal <harness>
			msg <|s00You see a black |bharness |xbstuck underneath one of the seats.> }
	}
	command <jump out> {
		if property <parachute; on> then {
			clear
			background <191970>
			foreground <DC143C>
			goto <falling>
			set <falling; 1>
			hide <parachute>
			reveal <parachute2>
			give <parachute2>
			timeroff <plane dive>
			timeron <free falling>
			timeron <alt check>
			msg <|s12You know that the sun is just passed down over the horizon, but as you get closer to the surface, the ambient sun light over the horizon will only grow dimmer...|s00> } else msg <Without a secure fastened parachute, that would be suicide!>
	}

	define object <seats>
		look msg <|s00Nothing special about the seats themselves, but you might want to |blook under|xb them.>
		displaytype <Object>
		article <them>
		gender <they>
	end define

	define object <harness>
		look <Looks like this would attach "use" to a pack of some sort, but not a typical backpack.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		use on <container pack> {
			hide <harness>
			hide <container pack>
			show <container with harness>
			give <container with harness>
			msg <You securely fastened the |bharness to the container pack. |xb>
		}
		use on <container pack loaded with a canopy> {
			hide <harness>
			hide <container pack loaded with a canopy>
			show <parachute>
			give <parachute>
			msg <You securely fastened the harness to the container pack loaded with the canopy. Making a |bparachute!|xb>
		}
		action <fasten> {
			if property <parachute; on> then {
				msg <|s00You now have the harness fasten and the |bparachute |xbis secure! Well, what are you waiting for??? >
				hide <harness> } else msg <You don't have the parachute on yet!>
		}
	end define

	define object <backpack>
		look picture <RTEmagicC_nikesb_eugene_1.jpg.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <luggage rack>
		container
		open if flag <in plane> then msg <You don’t have the time to play with the backpack contents right now!> else open <backpack>
		close
		add
		remove
	end define

	define object <luggage rack>
		look <This container stores luggage for would be passengers.>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			open <luggage rack>
			msg <|s00You see a backpack in the luggage rack.>
			exec <look rack>
		}
		close
		add
		remove
	end define

	define object <Tripod LED Flashlight>
		look picture <tripod-led-flash-light.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <backpack>
		invisible
	end define

	define object <PX4 Storm Berretta Pistol>
		look picture <px4 storm pistol.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <backpack>
		invisible
	end define

	define object <Suppressor>
		look picture <suppressor.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <backpack>
		invisible
	end define

	define object <Nylon Rope>
		look picture <rope.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <backpack>
		invisible
	end define

	define object <PX4 Magazine .40 10 Round Capacity>
		look picture <magazine.jpg>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <backpack>
		invisible
	end define

end define

define room <cockpit>
	prefix <the>
	look <|s00You are in the cockpit of the plane that’s going down! You see the pilot seat, the co-pilot seat and the flight instruments. |n|nYou can go south to the main cabin.|s09|n|n|s00>
	south <cabin>
	afterturn timeron <oxygen left>

	define object <instruments>
		look {
			if got <first aid kit> then msg <|s00Nothing else noteworthy about the #@quest.lastobject#> else {
				reveal <first aid kit>
				msg <|s00These flight instruments and controls have been damaged; this plane is not going anywhere, only down.>
				msg <|s00You do however spot a small|b first aid kit |xbfastened to the undercarriage of the instrument panel.>
				msg <|s00The altimeter still works and you also noticed your current altitude is %alt%, no worries...> }
		}
		displaytype <Object>
		article <them>
		gender <they>
	end define

	define object <pilot seat>
		look {
			if got <fire extinguisher> then msg <|s00Nothing else noteworthy about the #@quest.lastobject#> else {
				reveal <fire extinguisher>
				msg <|s00On the left side of the seat, fastened to the bulkhead, you see a |bfire extinguisher|xb.> }
		}
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <co-pilot seat>
		look {
			if got <flare gun> then msg <|s00Nothing else noteworthy about the #@quest.lastobject#> else {
				reveal <flare gun>
				msg <|s00On the right side of the seat, fastened to the bulkhead, you see a small |bflare gun|xb.> }
		}
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <fire extinguisher>
		look <Looks a bit heavy, but you can carry it around.>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <flare gun>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		open {
			if got <flare gun> and ( %flare ammo% = 1 ) then {
				open <flare gun>
				msg <|s00One flare is loaded!> } else {
				open <flare gun>
				msg <|s00Its empty.> }
		}
		close
		properties <flare ammo = 1>
		action <shoot> {
			if got <flare gun> and flag <in plane> and ( %flare ammo% = 1 ) then {
				msg <|s00You fire the flare gun and it blows up the plane. Game over!>
				dec <flare ammo; 1> } else msg <Gun does not have any more ammo loaded.>
		}
	end define

	define object <first aid kit>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		open if flag <in plane> then msg <|s00You don’t have the time to tend to your wounds right now!>
		close
		add
		remove
	end define

	define object <oxygen mask>
		look <Stop looking at it! Wear the damn thing already!!!>
		take
		prefix <an>
		displaytype <Object>
		article <it>
		gender <it>
		action <wear> {
			if got <oxygen mask> then {
				property <oxygen mask; in use>
				msg <You secure the oxygen mask tightly your mouth and now you can breathe freely again.>
				background <white>
				foreground <black>
				clear
				exec <look; normal> } else msg <You don’t have the oxygen mask.>
		}
	end define

end define

define room <tail section>
	look <|s00You are in the tail section of the plane, and you see a storage cabinet in the corner.|n|nThere is a restroom door to the southeast, and you can go north back to the main cabin.|n|s09|n|n|s00>
	north <cabin>
	southeast locked <head; The head is locked. I would hold it if I were you...>
	command <smash cabinet with fire> {
		if got <fire extinguisher> and here <storage cabinet> then {
			open <storage cabinet>
			msg <|s00You destroy the cabinet, revealing 2 items inside!|nYou see a container pack and a folded canopy.>
			exec <look cabinet>
			hide <storage cabinet> }
	}
	command <smash cabinet with extinguisher> {
		if got <fire extinguisher> and here <storage cabinet> then {
			open <storage cabinet>
			msg <|s00You destroy the cabinet, revealing 2 items inside!|nYou see a container pack and a folded canopy.>
			exec <look cabinet> }
	}
	command <smash cabinet with fire extinguisher> {
		if got <fire extinguisher> and here <storage cabinet> then {
			open <storage cabinet>
			msg <|s00You destroy the cabinet, revealing 2 items inside!|nYou see a container pack and a folded canopy.>
			exec <look cabinet> }
	}

	define object <storage cabinet>
		look <Stop looking already, find something to smash it with!>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open msg <It’s locked. You don’t have time to find the key. Just find a nice heavy object!>
		close
		add
		remove
	end define

	define object <container pack>
		look <This looks interesting. Look at 2 other items.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <storage cabinet>
	end define

	define object <canopy>
		look <This specifically folded canopy looks like it could be inserted (use) into some type of specialized container.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		parent <storage cabinet>
		use on <container pack> {
			hide <canopy>
			hide <container pack>
			show <container pack loaded with a canopy>
			give <container pack loaded with a canopy>
			msg <You successfully inserted the folded |bcanopy |xbin to the |bcontainer pack|xb. >
		}
		use on <container with harness> {
			hide <canopy>
			hide <container with harness>
			show <parachute>
			give <parachute>
			msg <You successfully inserted the folded canopy in to the container pack with the harness. Making a |bparachute!|xb>
		}
	end define

end define

define room <head>
	northwest <tail section>
end define

define room <chute parts>

	define object <container pack loaded with a canopy>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <container with harness>
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <parachute>
		look <What are you waiting for? Get the thing on and jump!>
		take
		displaytype <Object>
		article <it>
		gender <it>
		action <wear> {
			if property <parachute; on> then msg <You are already wearing the parachute!> else {
				show <harness>
				reveal <harness>
				give <harness>
				property <parachute; on>
				msg <|s12You slip both of your arms in the shoulder straps and the |bparachute |xbis now positioned on your back. |s00Now fasten that |bharness|xb!|n> }
		}
	end define

end define

define room <falling>
	look <|s09|n|s00You are now free falling rapidly toward the surface! The parachute feels secure.|n>
	indescription <You are now: >
	command <land> {
		if ( %alt% > 300 ) then msg <You are too high to attempt a landing right now.|n> else {
			if ( %alt% > 200 ) then {
				goto <beach water>
				timeroff <landing>
				set <alt; 0> }
			if ( %alt% > 100 ) then {
				goto <beach>
				timeroff <landing>
				set <alt; 0> }
			if ( %alt% > 1 ) then {
				goto <cabin>
				timeroff <landing>
				set <alt; 0> } }
	}

	define object <red rip cord>
		look <The red rip cord is positioned on your right side lower by your right hip. This can be pulled.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <pull> {
			if got <red rip cord> and got <blue rip cord> then {
				hide <blue rip cord>
				hide <red rip cord>
				timeroff <free falling>
				timeron <floating down reserve>
				msg <|s00Your folded main canopy is jettisoned out of the top of your container as the |breserve |xbcanopy deploys out of the container. It unfolds and fills with air allowing you to float downwards safely.|n|n>
				show <reserve canopy>
				give <reserve canopy> } else {
				if got <red rip cord> and ( %falling% = 1 ) then {
					hide <red rip cord>
					timeroff <free falling>
					timeron <floating down reserve>
					msg <|s12You're reserve canopy is deployed. You feel a hard snap as the reserve canopy fully inflates, rapidly decreasing your rate of decent.|n|nYou are now floating and safely descending to the surface below.|n|s00|n>
					show <reserve canopy>
					give <reserve canopy>
					set numeric <falling; 0> } else {
					timeroff <floating down>
					timeron <floating down reserve>
					hide <red rip cord>
					hide <main canopy>
					msg <|s12You here a small “pop” as your main canopy is jettisoned away from the container, while the reserve chute is deployed. You feel rapid acceleration for about 2 seconds and a hard snap as the reserve canopy fully inflates, rapidly decreasing your rate of decent.|n|nYou are now floating and safely descending to the surface below.|s00>
					show <reserve canopy>
					give <reserve canopy> } }
		}
	end define

	define object <blue rip cord>
		look <The blue rip cord is positioned on your left side up high next to your left chest. This can be pulled.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <pull> {
			if got <blue rip cord> then {
				hide <blue rip cord>
				timeroff <free falling>
				timeron <floating down>
				msg <Your'e main canopy deploys out of the container. It unfolds and fills with air perfectly. |nYou are now floating and safely descending to the surface below.|n>
				reveal <main canopy>
				give <main canopy>
				set <falling; 0> } else msg <You dont have the blue rip cord.>
		}
	end define

	define object <parachute2>
		alias <parachute>
		look {
			reveal <red rip cord>
			reveal <blue rip cord>
			give <red rip cord>
			give <blue rip cord>
			msg <|s00The harness has you securely fastened to the parachute on your back. |n|nYou notice 2 |brip cords|xb, one |bred |xband the other |bblue|xb.>
			reveal <knife>
			give <knife>
		}
		take
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <knife>
		alias <knife>
		look <The knife is attached to your parachute harness on your right side above the red rip cord. Can be used to help get untangled or out of other dicey situations. |n>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		use on <main canopy> {
			if got <main canopy> then {
				hide <main canopy>
				timeroff <floating down>
				timeron <free falling>
				msg <|s12You cut away your |bmain canopy!|xb Now you are rapidly accelerating at a free fall to reach terminal velocity. You are plummeting towards the surface!|s00|n|n>
				set <falling; 1> } else msg <|s00You don't have a main canopy.>
		}
		use on <reserve canopy> {
			if got <reserve canopy> then {
				hide <reserve canopy>
				timeroff <floating down reserve>
				timeron <free falling>
				msg <|s12You cut away your |breserve canopy!|xb Now you are rapidly accelerating at a free fall to reach terminal velocity. You are plummeting towards the surface! This time, I think you’re out of options. |bSay a prayer!|xb|s00|n|n>
				set <falling; 1> } else msg <|s00You don't have a reserve canopy.>
		}
	end define

	define object <main canopy>
		look <The main canopy above you is fully open and keeping you falling at a safe velocity.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <reserve canopy>
		look <The reserve canopy above you is fully open and keeping you falling at a safe velocity although a bit faster than if you were using your main canopy.>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <island below>
		look {
			msg <|s00You see a tiny island below you. You seem to be heading toward the south end. >
			reveal <north side>
			reveal <south side>
			reveal <east side>
			reveal <west side>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		surface
	end define

	define object <north side>
		look <The north side of the island is covered in densely thick jungle.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <island below>
		invisible
	end define

	define object <south side>
		look <The south side of the island is a small natural beach front.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <island below>
		invisible
	end define

	define object <east side>
		look <The east side of the island is the highest point, covered in jungle, but at the top eastern most point, a small clearing which is on top of a high steep cliff looking down to the ocean on the east side. >
		displaytype <Object>
		article <it>
		gender <it>
		parent <island below>
		invisible
	end define

	define object <west side>
		look <The west side of the island you can make out a small dock and wide path that leads into the jungle to the east of the dock. There is also a small boat at the dock right now.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <island below>
		invisible
	end define

end define

define room <beach>
	prefix <the>
	look <|s00To the northeast there is a rock outcropping, directly to the north is the jungle and to the northwest leads off eventually to the dock area.|n|nJust south of the jungle tree line you see a dirt road leading east and west, as well as a northern dirt road leading deep into the jungle itself. The road to the west leads off to the dock area and the same road heading east curves left turning northeast, behind large rocks and up to the eastern high point of this island.|n|s09|n|s00>
	indescription <You are at: >
	south <beach water>
end define

define room <beach water>
	look <|s09You are wading in the water about 30 meters from the beach to the north. |n|n|s00>
	north locked <beach>
	script {
		timeroff <landing>
		if got <knife> then {
			lose <knife>
			hide <knife>
			show <knife2>
			give <knife2> }
		if got <main canopy> or got <reserve canopy> then {
			msg <You are wading in the water about 30 meters from the beach to the north. |nYou parachute canopy is being dragged by the water current; you are being pulled under. |n|s00|nPress any key to continue!|n|s09|w|s00>
			set <oxygen left; 20>
			timeron <canopy drowning> }
	}

	define object <knife2>
		alias <knife>
		take
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		use on <main canopy> {
			if got <main canopy> then {
				msg <You cut the main canopy away, allowing you to swim freely.|n>
				timeroff <canopy drowning>
				hide <main canopy>
				unlock <beach water; north> } else msg <What canopy?>
		}
		use on <reserve canopy> {
			if got <main canopy> then {
				msg <|s00You cut the main canopy away, allowing you to swim freely.|n>
				timeroff <canopy drowning>
				hide <main canopy>
				unlock <beach water; north> } else msg <What canopy?>
		}
	end define

end define

define timer <plane dive>
	interval <3>
	action {
		if ( %alt% < 200 ) then {
			playerlose
			displaytext <Lose plane crash> } else {
			dec <alt; 552>
			msg <|s00The plane is free falling at Terminal Velocity, aproximately 184 ft/s. Altitude is now %alt% feet.> }
	}
	disabled
end define

define timer <oxygen left>
	interval <1>
	action {
		if property <oxygen mask; in use> then {
			timeroff <oxygen left>
			timeron <plane dive> } else {
			if ( %oxygen left% < -5 ) then {
				timeroff <oxygen left>
				displaytext <Lose oxygen>
				playerlose } else {
				dec <oxygen left; 1>
				msg <|cr|b|s00You are losing OXYGEN, you have only %oxygen left% seconds left of oxygen.|xb|cb> } }
	}
	disabled
end define

define timer <floating down>
	interval <5>
	action {
		set <rate of decent; 20>
		dec <alt; 100>
		msg <|s12You are now floating safely at approximately 20 ft/s, thats about 14 mph. Altitude is now %alt% feet.|s00>
	}
	disabled
end define

define timer <floating down reserve>
	interval <5>
	action {
		set <rate of decent; 30>
		dec <alt; 150>
		msg <|s12You are now floating at approximately 30 ft/s, thats about 21 mph. Altitude is now %alt% feet.|s00>
	}
	disabled
end define

define timer <free falling>
	interval <3>
	action {
		if ( %alt% < 10 ) then {
			playerlose
			displaytext <lose free fall> } else {
			set <rate of decent; 184>
			dec <alt; 552>
			msg <|s00You are free falling at Terminal Velocity, aproximately 184 ft/s. Altitude is now %alt% feet.> }
	}
	disabled
end define

define timer <alt check>
	interval <1>
	action {
		if ( %alt% < 7000 ) then {
			msg <You have descended below 7000 feet; you are no longer need of the oxygen mask. You can now see the surface below. It looks like you’re headed to a small Island.|n>
			timeroff <alt check>
			timeron <landing check>
			reveal <island below>
			hide <oxygen mask> }
	}
	disabled
end define

define timer <landing check>
	interval <1>
	action {
		if ( %alt% < 1000 ) then {
			timeroff <landing check>
			timeroff <floating down>
			timeroff <floating down reserve>
			msg <|s09You are about to land on the south side of the island on the beach. Be prepared to pull your risers as you get close to the ground. |n|n[You must enter the command ‘land’ between 200 and 100 feet above the beach to make a safe landing.]|n|nHit key to continue...|n|n|w|s00>
			timeron <landing> }
	}
	disabled
end define

define timer <landing>
	interval <0>
	action {
		dec <alt; %rate of decent%>
		msg <|cr|b|s00Altitude is: %alt%|xb|cb>
	}
	disabled
end define

define timer <canopy drowning>
	interval <1>
	action {
		if ( %oxygen left% = 0 ) then playerlose else {
			msg <|s00You have%oxygen left%seconds left.|n>
			dec <oxygen left; 1> }
	}
	disabled
end define

define text <intro>
|s09You are startled awake to a loud explosion sound, followed by the sound of sucking air. Your head above your left eye is burning with pain. You are standing and suddenly you feel the force of gravity changing.

You are being pulled forward, toward a set of huge windows, and you can see a cloud outside the windows, getting closer and closer and suddenly you find yourself leaning against the windows as they burst thru the cloud only to reveal more clouds you are closing in on.

You realize you’re looking at the flight instruments of a cockpit of a plane and you can see altimeter reading displays 40,000 feet.

|bYou’re having a difficult time breathing, the first thing you need now is oxygen!|xb

Press a key when ready to act fast!
|w|s00
end define

define text <Lose plane crash>
You have died in a horrific plane crash! BOOM! Try again :)
end define

define text <Lose oxygen>
You died of asphyxia, as you didn’t have enough oxygen at this altitude.

end define

define text <lose free fall>
You smacked into the ground at terminal velocity without having a full canopy/parachute deployed. You have died.

end define

