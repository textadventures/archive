' "VELDA: Girl Detective"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <VELDA: Girl Detective>
	asl-version <410>
	start <living room>
	game version <2.0>
	game info <Created with QDK 4.1.5>
	verb <open> msg <You can't open that.>
	verb <take> msg <You can't take that.>
	verb <turn on> msg <You can't turn on that.>
	verb <turn off> msg <You can't turn off that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <living room>
	prefix <the>
	look <|cr|b|s24VELDA: GIRL DETECTIVE|cb|xb|s12|n|n|iMy name is |bVelda Bellinghausen|xb. I'm a private eye. I used to be the headliner at Slotnik's Follies until I found a matchbook cover advertising a course on detection. I sent in my twenty dollars, took the course and got my license. I work out of my apartment in the Zenobia Arms in Greenwich Village. For a while, you are going to have the thrill of becoming me. All you have to do is imagine you're a 6-foot leggy ex-showgirl with a nickel-plated .45 automatic in New York in 1954. How much easier could it be?|xi|n|s00|n|n|n|s12You are in your living room. It's not too much to look at, just a three-room apartment on the third floor of the Zenobia Arms. The whole place had been built some time during the Garfield administration and has aged just as successfully. The only window overlooks Pith Street, near the middle of Greenwich Village. All of the furniture either came with the place or you got it second-hand. There is a table under the bow window, an overstuffed easy chair, an understuffed couch and a side table with a radio. Some magazines and newspaper clippings are scatttered around. The plaster walls are covered with posters and photos. To the East is the kitchenette and beyond that the bedroom.|n|nIt's not much, but it|i is |xihome.|n|nJobs, though, have been pretty scarce lately and as you stand there wondering where your next cheeseburger is coming from there is a knock at the door. Hoping maybe there's been a good axe murder somewhere, you go to the door.|n|n|s00>
	out <Slotnik's Follies, backstage>
	east <kitchen>
	script picture <apt2.jpg>

	define object <radio>
		look <It's an old Atwater-Kent. You turn it on because it's time for your favorite radio show.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		action <turn on> playmp3 <Veldaradio.mp3>
		action <turn off> playmp3 <>
	end define

	define object <table>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		surface
	end define

	define object <magazine>
		alias <magazine>
		look picture popup <life cover 1B 2.jpg>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <table>
		invisible
	end define

	define object <magazine2>
		alias <magazine>
		look picture popup <hush 2.jpg>
		prefix <the>
		displaytype <Object>
		detail <other magazine>
		article <it>
		gender <it>
		parent <table>
		invisible
	end define

	define object <poster>
		look picture popup <stripper poster0000.jpg>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <photo>
		look picture popup <stripper 7.jpg>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <newspaper clipping>
		alias <newspaper clipping>
		alt <clipping>
		look picture popup <clipping2.jpg; The day you became a real detective!>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <table>
		invisible
	end define

	define object <newspaper clipping2>
		alias <newspaper clipping>
		alt <clipping>
		look picture popup <mom and dad papers.jpg@The sad fates of your Mom and Dad.>
		displaytype <Object>
		detail <the other clipping>
		article <it>
		gender <it>
		parent <table>
		invisible
	end define

	define object <newspaper clipping3>
		alias <newspaper clipping>
		look picture popup <noorvikpaper.jpg; The crooked DA, King Noorvik, is the one person in the world you hate most!>
		prefix <the>
		displaytype <Object>
		detail <the third clipping>
		article <it>
		gender <it>
		parent <table>
		invisible
	end define

	define object <door>
		speak <It's Maxim Slotnik! >
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <open = It's Maxim Slotnik! You haven't seen Max in two or three months, not since you left Slotnik's Follies.  Not that you didn't like the Follies, which you didn't, or don't like Slotnik, which you don't just on principle, you just needed to do something a little more useful with your life than shedding feathers four times a night, not counting weekends, with matinees, when you shed them six times.|n|nYou look at the fat little butterball standing outside your door for a good fifteen seconds---not so surprised to see him as surprised he'd made it up five floors. He is red as a beet and puffing like a steam engine, so you invite him in before he dies there in the hallway.|n    "Jesus, Max, you want some water? You better sit down or something, you don't look so hot."|n    "Thanks, Velda. My God, did you have to find a place so far above the street?"|n    "Do you good, Maxim, God knows you need the exercise."|n    "Exercise, schmexercise.  Why don't you come on back to the show, Velda? The girls miss you. The boys miss you. I miss you."|n    "Gee, I'm sure sorry I'm breaking your heart, Maxim," you say, handing him his water. "You want a Kleenex?"|n    "I mean, Jesus, Velda, look at this place."|n    "What's wrong with it?" you ask, hoping he won't start listing its faults, but he did. When he finished you say, "Look, Maxim, I'm sure I appreciate your deep concern for me, but I can't believe you came all the way up here just to say 'howya doin' Velda'. Forgive me if I'm misjudging you."|n    "Aww, look, Velda, there's no need to talk like that. Haven't I always been square with you?"|n    "Yeah, sure, sure you have. I got no complaints about you Maxim. So what're you doing here, if you don't mind getting to the point."|n    He started wringing his hands, which you know means he is going to talk about something he really wants to avoid, like turning on the heat in the dressing rooms before Thanksgiving or giving someone a ten-cent raise. |n    "You remember a girl named Monica? Started a month, maybe two, before you left?"|n    "Monica? Sure, I think. Cute blonde, eyes like bottle caps?"|n    He nods and swallows. |n    "Well, what about her? Don't tell me she's your new girlfriend. Jesus, Maxim, she's right off the farm."|n    "No, Velda. She's dead."|n    "Dead?"|n    "Dead."|n    "Dead how?"|n    "Murdered, Velda. Someone killed her.  The janitor, McWhorter, found her yesterday afternoon in the dressing room. Jesus. Someone'd stabbed her, stabbed her in the heart."|n    "Good God, Max, why would someone do that?"|n    "That's why I came to see you, Velda?"|n    "Pardon?"|n    "Well, you're a detective aren't you?"|n    "I, well, yeah, but---"  |n    "Look, Velda, this detective thing, you know what I think about it. A private eye? You're a great showgirl, Velda, a star.  What do you want to be a detective for? It's crazy. But there you are, you got a license and everything and, well, we're friends, ain't we, Velda?"|n    "Yeah, sure, we're pals, Maxim."|n    "Well, you see, Velda, this thing could ruin me. The new DA, he ran on that morals platform. Clean up the burlesques he promised, run the strip joints out of town---he's been trying to close us down for months. This's all he needs.  Murder for God's sake. Can you imagine what he's gonna do with the headlines? 'Naked Teenage Stripper Murdered at Slotnik's?' I gotta find out what happened quick, Velda.  He's gonna shut us down any day."|n    "Calm down.  You're going to give yourself an embolism."|n    "You gotta help me.  You know your way around.  You know the girls. And, and, well I can trust you, Velda, You'll keep things quiet." He knew I'd work cheap, too, but neither of us wanted to say that.|n    "But what do you want me to do?"|n    "I don't know...but you gotta clear me of this, Velda. There's gotta be something."|n|nYeah. But what did he expect you to do? Still, it was a case, such as it was, and it doesn't seem right to turn it down. Besides, you do owe Maxim.  No matter how much you hate to admit it, he was really all right even if he was a slimeball.  And you certainly owed the girls something. You have a lot of friends in the show and it'd be awful tough on them if Slotnik's Follies closed. So you tell him sure.  You'll just get your fingerprint kit and magnifying glass and bloodhound and follow him over to the theater. What the hell, if nothing else you'll be able to pay the rent that month.>
	end define

	define object <Maxim Slotnik>
		look picture popup <slotsky.jpg; Maxim Slotnik>
		displaytype <Character>
		article <him>
		gender <he>
		invisible
	end define

end define

define room <bedroom>
	prefix <the>
	look <|s12Not a lot to look at: just a twelve-by-twelve room with an old brass bed with a night stand next to it, a dresser with a mirror over it and a closet. There's only one window, opposite the door, outside of which is the fire escape leading to the alley behind the Zenobia Arms.|s00>
	west <kitchen>

	define object <bed>
		look <Just an old brass bed. >
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <dresser>
		look <Just another piece of beat-up furniture with a big mirror over it. Hardly any point in looking inside: all that's there is your underwear and stockings.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <closet>
		look <Nothing in there but your clothes, most of which you got from the thrift shop around the corner. The trench coat always makes a pretty good impression on clients.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <mirror>
		look picture popup <v face 12 black sweater b.jpg; Your reflection looks back at you.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <book>
		alias <book>
		look picture popup <veldalulu1.jpg>
		take
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <night stand>
	end define

	define object <night stand>
		look <Just a little table with a reading lamp an alarm clock and a book. Somewhere around here is your gun.>
		displaytype <Object>
		article <it>
		gender <it>
		surface
		remove
	end define

	define object <gun>
		look picture popup <colt_45_automatic_1911-10892.jpg; It's your Dad's nickel-plated Colt .45 automatic.>
		take <You never know when it might come in handy!>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <night stand>
	end define

end define

define room <kitchen>
	prefix <the>
	look <|s12It's called a "kitchenette" in the lease, but it's just a space between the living room and bedroom barely large enough for my hot plate and a little Frigidaire.|s00>
	east <bedroom>
	west <living room>

	define object <hot plate>
		look <Pretty good for heating up a can of beans or Campbell's soup.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <refrigerator>
		look <Just an old Frigidaire. >
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open
		close
		remove
	end define

	define object <beer>
		look <Pabst Blue Ribbon!>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <refrigerator>
	end define

	define object <eggs>
		look <Hmmm...only two left in the carton. Better add eggs to the grocery list.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <refrigerator>
	end define

	define object <bologna>
		look <It might be the bologna you bought last month, but you don't remember it being that color.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		parent <refrigerator>
	end define

end define

define room <Slotnik's Follies, backstage>
	alias <Slotnik's Follies, backstage>
	look <|s12It is strange, being back in the theater, knowing you are there as an outsider, no longer part of the show. You'd spent the last five years there, seven days a week, had been gone only a couple of months and now everything feels new. Sure, the girls all wave and say, Hi, Velda, howya doin'? but something's been broken and you aren't so sure but that you regret it more than you thought you would. |n|nMaxim takes you down to the dressing room, which has been off limits since the murder. There is a cop on the door and when he sees you coming he raises his hand to stop you. |n|n|s00>
	out <Joe's Diner>
	north <second dressing room>
	south <Monica's apartment>
	west <dressing room>
	northwest <McWhorter's apartment>
	northeast <back alley>
	southeast <morgue>
	down <boiler room>

	define object <Cop>
		look picture popup <copandstrippers.jpg>
		displaytype <Character>
		article <him>
		gender <he>
		invisible
	end define

	define object <Gernly>
		look picture popup <3a51658r.jpg>
		speak <Gernly, the stage manager, was an octogenarian who must've been dug up when they laid the foundation of the building. He's the only one who would've been anywhere near the stairs and back entrance, so if anyone'd seen anything out of the way it would've been him.|n    "Say! Hiya Velda! Good to see ya, kid!"|n    "Howya been doin'? How's the psiatica?"|n    "Aw, it's okay, I guess. Thanks for sending that ointment, that helped a lot."|n    "Sure, glad to hear it. Say, about yesterday..."|n    "Yeah, wasn't that somethin'? Awful shame. Sweet little kid she was. You ever know 'er? What a shame..."|n    "Yeah. I'd met her a couple of times. She started just before I left, so we never got to do much more than say hello. But she seemed nice."|n    "Yeah."|n    "Look, you were backstage yesterday afternoon weren't you?"|n    "Yup, just where I always am."|n    "You see anything funny? Anyone who shouldn't have been around?"|n    "Nope. You know no gets in or out of that door without me seein' 'em."|n    "Didn't see or hear anything at all?"|n    "Well, I did hear somethin' a kind o'crash, I guess. Like someone dropped somethin' heavy it wasn't loud, I dint think nothin' of it. You think it had somethin' to do with what happened to that poor kid?"|n    You tell him that you haven't the slightest idea. By this time most of the girls had arrived for the afternoon matinee so you go to the second dressing room, where all the girls have to crowd themselves now that the other room had been sealed, more or less, by the cops.>
		prefix <Mr.>
		displaytype <Character>
		article <him>
		gender <he>
	end define

	define object <Wobbles>
		look picture popup <Mazurki.jpg; Wobbles>
		speak <Wobbles gives you an address on Bumpass Street, which you think is funny until you discovered it's pronounced "Bumpus." >
		displaytype <Character>
		article <him>
		gender <he>
	end define

	define object <Max Slotnik>
		speak <                "What's wrong now?" you ask. |n    "People are starting to quit on me."|n    "Quitting? Who?"|n    "McWhorter for starters. Just up and walked out on me, just like that."|n    "McWhorter? Hardly counts as a 'people.'" |n    "It's just a start, you'll see. Just handed over his keys and said he wasn't coming back. He's been here nearly thirty years, twenty with me."|n    "Strange, but I guess after thirty years maybe he just felt like a change of scenery."|n    "I told him that if he'd give me two weeks' notice to find another man, I'd give him two months' salary, but he turned me down. Said today was his last day and that was that."|n    "Turned down two month's pay? That hardly sounds likely."|n    He buries his face in his hands again. "It's all a conspiracy, I tell you. Someone's out to ruin me."|n    You ask him where McWhorter lives. He tells you, wondering why I wanted to know.|n    "I got a couple more questions for him."|n    "Well, you'd better catch him soon.  I have the distinct impression he was thinking about taking a long vacation."|n    You just bet he is.|n>
		displaytype <Character>
		article <him>
		gender <he>
	end define

end define

define room <drug store>
	prefix <the>
	look <|s11You get a couple of bottles off the shelf and take them to the pharmacist to be rung up. He is just handing me my change when it dawns on me to ask, "What's Febatol for?"|n    "It's an anti-seizure medication. Usually for controlling epilepsy."|n    "You mean that thing that makes people fall on the sidewalk and foam at the mouth?"|n    He nods.|n    You thank him absently and deliver Joe's aspirin.  |s00>
	out <Joe's Diner>
	script picture popup <5a12513r.jpg>
end define

define room <dressing room>
	prefix <the>
	look <|s12The room is dark and you flip the switch, turning on the pair of bare bulbs that hang from the ceiling. There isn't anything in here you haven't seen a hundred times. A row of makeup tables---just cheap vanities with big mirrors, rimmed with a couple dozen light bulbs, half of which don't work.  Wooden chairs, a couple wardrobes, clothes racks with costumes hanging from them. All so familiar. The end table was---had been---Monica's. The first thing you see is that it has no mirror and most of its bulbs are broken. All of her makeup and things are gone, too. You guess the police have taken it all for evidence. You glance down at the floor in front of the table and see the huge, dark red stain, as big as a rug.  Jesus Christ, someone had died right there and |ispilled|xi all that blood!|n|n    |n   |s00>
	east <Slotnik's Follies, backstage>

	define object <dressing table>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Max Slotnik2>
		alias <Maxim Slotnik>
		speak <    "What happened, Max?"|n    "McWhorter found her right there. She was already dead. He took one look and called the cops."|n    "Where's McWhorter now?"|n    "Where he usually is, I guess, down in the boiler room."|n    "All right, Max, you go and take some aspirins and try to relax."  You try to sound as confident as you can, which seemed to be enough to calm Max down anyway.|n    "You all done in there?" Buzz asked from the doorway.|n    "Yeah, I guess so."|n    "The show's not been the same since you left, Velda."|n    "Lots of things haven't been the same since I left, Buzz.">
		displaytype <Character>
		detail <Maxim Slotnik>
		article <him>
		gender <he>
	end define

end define

define room <boiler room>
	prefix <the>
	look <|s12McWhorter has a kind of nest behind the furnace in the sub-basement. You'd never had much to do with him, even though he'd been working in the theater long before Max took it over and Max'd been there for a couple decades. None of the girls ever had anything to do with him, for that matter, mainly because he was more than a little creepy.|n    For most of us he was just this greasy ball of rags that hovered around in the background making sure the toilets worked and the light bulbs got changed, neither of which happened very often.  You track him down by following the sniffling sound of his perpetually running nose, which leads you to a cozy little den consisting of a table with a hotplate, a chair, a cot and McWhorter, who was sitting on the cot, snuffling and hacking. He had some sort of chronic nasal thing.|n|s11    |s00>
	up <Slotnik's Follies, backstage>

	define object <McWhorter>
		look picture popup <boilerroom.jpg; You interview McWhorter>
		speak <    "Mr. McWhorter?"|n    "Yeah?"|n    "I'm Velda, Velda Bellinghausen."|n    "I know who you are. You the doll what used to be the headliner. Too skinny I always thought. Damned Olive Oyl, you ask me. Don't know what the shows're comin' to, girls got no meat on 'em no more."|n    "Well, ah, thanks. Look, Mr. McWhorter, if I'm not interrupting anything, I'd like to ask you a few questions."|n    "Like what?"|n    "Well, about the girl who got killed yesterday."|n    "What about her?"|n    "Max Mr. Slotnik told me you found her.  The body?"|n    "So?"|n    "Well, I was wondering if you could tell me about that."|n    "Why?"|n    "Max asked me to help him out. I, ah, I got a private investigator's license, to look into things like this."|n    "A dick? You a dick? Har."|n    You aren't sure what that last sound meant. It might have been a snort of derision; it might have been just some phlegm coming loose from its moorings.|n    "Is it okay if I ask you about the girl? About finding her?"|n    "Ain't much to tell. She was layin' there on the floor, dead as mackerel, that's all."|n    "How'd you know she was dead?"|n    "How about a hole in the middle of 'er, big enough to stick my hand into, leaking like a plugged toilet? She were dead all right."|n    "A hole? What kind of a hole, Mr. McWhorter?"|n    "A hole. Like someone'd stuck an axe in her, for Christ's sake." He made that awful har sound a couple more times. Fumbling under his pillow, he brought out a mason jar, unscrewed the lid and spit what looked like a piece of lung into it. He glanced up at me as he was screwing the lid back on and saw what must have been an expression of disgust on my face. "Waste not want not," he said, shoving the jar back under the pillow. |n    You don't know what to say, so you ask: "Didn't you see anyone else?"|n    "She were there all by herself."|n    "No one else around? No one else in the basement?"|n    "Nope. She'd come in early, 'bout a half hour or so before the others usually show up. No one there but her."|n    "Well, I'm sure you didn't kill her, so I suppose there must've been someone else in the building."|n    "I didn't say there was no one else in the whole building, I said there was no one else in the basement. Most of the musicians was in by then and the stage manager and who knows who else. I meant no one else was downstairs, naturally."|n    "How do you know that?"|n    "'Cause I was fixin' the light over the callboard right by the stairs. No one been up or down the whole time I was there but that girl."|n    "Monica?"|n    "Yeah, she was the dead'un all right."|n    "Well, the murderer might have been down there all along, before you showed up."|n    "Maybe, but what's that to me? I only know what I know and can't say nothin' about nothin' else."|n    "You didn't hear anything? The dressing room's not far from the bottom of the stairs."|n    "You mean like screams or somethin'?"|n    "Whatever."|n    "No screams or nothin', nothin' at all."|n    "So how long was it, after Monica went downstairs that you went down?"|n    "I dunno. Half hour? Mebbe longer? I talked to the boy what brings in the afternoon papers 'cause I'd asked him to bring me some donuts and I ate a donut but I never was more'n ten feet from the door the whole time."|n    "So it was quite a while before you went downstairs? Half an hour at least? Maybe forty-five minutes?"|n    "I guess how am I supposed to know? Next time some bimbo decides to get herself knocked off I'll be sure she lets me know in advance and I'll check my watch."|n    "What'd you do after you found the body?"|n    "What do you think I did? I got the hell out of there and called the stage manager, Old Man Gernly. He called the cops and there you are."|n|nWell, it all beats the hell out of you.>
		displaytype <Character>
		article <him>
		gender <he>
	end define

end define

define room <Monica's apartment>
	look <|s12The room itself is about twelve by twelve, a bed in one corner next to the only window, a dresser, a chair and a couple of tables. There is a hot plate on the table and above that a couple of homemade shelves with some cans of soup, beans, condensed milk and spaghetti. There is no bathroom. She had to go down the hall for that. It doesn't take more than fifteen minutes to toss the room---there is hardly anything of the girl there. She'd had only enough clothes to fill three of the dresser's five drawers and although you go through everything, it was the usual stuff you'd find in any teenager's dresser, except maybe less of it. The only things on the table are some cheap plates and cups and a set of mismatched utensils. The only scrap of paper you can find is a receipt for some sort of prescription. |n    There is a small closet in the corner opposite the bed, but this only holds a collection of cheap blouses, skirts, a pair of slacks, a couple of dowdy-looking dresses and a sweater or two. So far the only impression you get is was poverty. You'd be willing to bet she'd arrived with hardly a dime to spare. On a little table beside the bed is a picture frame---the kind that unfolds so you can have two photos in them. One is of a man and woman who looks straight out of a Ma and Pa Kettle movie, the other is the same old couple, this time with a girl who you recognize as Monica age twelve or thirteen and a goofy-looking boy a few years younger.  Her brother, you figure. Finally, there was a photo of Monica herself. |n    That was it. You sit on the edge of the bed, astonished at the anonymity of Monica's life. In a week the room would be cleared of her things given away to some charity or taken by the other tenants more likely.  It would be as though she never existed. Rather than depress yourself further, you go home and take a long hot shower.  |s00>
	out <Slotnik's Follies, backstage>
	down <Joe's Diner>

	define object <photo of Monica>
		look picture popup <ipheginia30000.jpg>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <receipt>
		look picture popup <rx.jpg; What the hell is "febatol"?>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <McWhorter's apartment>
	look <|s11McWhorter's room is on the sixth floor of a walk-up tenement next to the elevated. By the time you get up there you are in no particularly good mood. You are glad to hear stirring behind the door in response to your knock because you'd neglected to find out first whether he was even there.|n|n            The door opens a crack, and he gets as far as "H---" before you kick as hard as you can. The edge of the door hits him square between the eyes.  He takes two flailing steps backward. You are over him as he hits the floor. You slam the door shut behind you. As he lays groaning on the floor, you kick him in the ribs. He says something pretty rude and tries to move, but finds the muzzle of your Dad's nickel-plated .45 discouraging, especially when he hears the hammer click back.|n    "Why don't you just sit right back down," you say, waving the gun just to see his eyes follow it.  He sits as requested and, with the back of his hand, swipes at the blood that drips from his nose. This smears a mix of blood and snot.  Disgusting. You squat on your haunches a few feet away.|n|n  |n|n|n|s00>
	out <Slotnik's office>
	southeast <Slotnik's Follies, backstage>
	script picture popup <slum 2ff.jpg>

	define object <McWhorter2>
		alias <McWhorter>
		look <                   "You can't do this," he says.|n    "Looks pretty much like I already did."|n    "What d'ya want? I ain't done nothin'."|n    "Who said you had? You're not suffering from a guilty conscience, are you? If so, confession's good for the soul."|n    "I ain't got nothin' t' confess to."|n    "Planning a trip?" you ask, gesturing to the open suitcase on the bed behind him, which is filled with what looks like everything he owned, such as it was.|n    "What's it t' you?"|n    "I want to know what you did when you found Monica's body."|n    "I dint do nothin'. Like I told ya, I called th' cops. That's all." You raise the gun and he flinches. "All right all right. Jesus, lady, try t' control yourself."|n    "She was dead when you found her, wasn't she? But not like you told the cops."|n    He tells you to do something not only rude, but probably physiologically impossible if physiologically is the word you want. You pop him on the head.|n    "Jesus, lady, stop that!"|n    "Look, I'll tell you what I think you did, and you tell me where I get it wrong? Doesn't that sound like fun?"|n    "#$%%# you!"  |n    You raise the gun and he says, "Yeah, yeah, it sounds like a load of laughs. Sure."|n    "You lied to me. You did hear something, something like a crash, and you went down to see what it was.  Anyone would have. And you found Monica there, on the floor, stabbed and bleeding."|n    "Well, ain't that pretty much what I've been saying all along?"|n    "I'm not finished yet. What you didn't bother to tell anyone is that you found the makeup table tipped over on her. She'd had a fit, epilepsy. That's the disease that makes you fall down on sidewalks "|n    "I know what it is."|n    "Excellent.  She'd had one of these fits and grabbed the table to steady herself, but it fell on top of her.  The mirror broke and drove a shard of glass straight into her heart."|n    "That's stupid."|n    "No it's not. It actually happened to someone a long time ago. It was on the radio. You set the table back on its feet, pulled the glass dagger out of her heart, cleaned up the rest of the glass and then called the police. I don't know when you called the DA, but it must've been right after that, huh?"|n    "#@?!!**% you! Hey, no!" But it was too late, you crack him over the head so hard your arm hurts clear to your shoulder. Teach him to use a word like that to a lady!|n    You think maybe you've killed him, but he's blowing little red bubbles from his nose, so you guess he's all right.|n>
		displaytype <Character>
		detail <McWhorter>
		article <him>
		gender <he>
	end define

end define

define room <morgue>
	prefix <the>
	look <|s11The room is covered entirely in white tiles, like a subway restroom, except that it smells like a hospital.  In the middle of the room is a little cart with a something on it covered with a dingy white sheet. It is a body. You don't know what you'd been expecting.  You know you hadn't really thought this through, but now it hits you. You feel a little funny and aren't sure if you want to go through with this. Like the first time you stripped.  The attendant, however, who hasn't been paying you the least bit of attention, makes the whole argument moot by whipping off the sheet with the flourish of a magician doing a table trick. |n    Jesus Christ almighty.|n|s00>
	west <Joe's Diner>
	northwest <Slotnik's Follies, backstage>
	script picture popup <morgue3.jpg; In the morgue.>

	define object <Monica's body>
		look <    You swallow hard. There isn't much for it but to get it over with. Somehow this is made easier by Monica herself, or what remains of her. She doesn't look like anything at all---anything living, that is. She could have been a department store mannequin for all you can tell, as white and stiff and with the same blank, flat eyes staring at nothing in particular. All except for the hole, of course. You get as close as you dare and make yourself look. She'd been a beautiful girl. She had been strikingly pretty in the cornfed girl-next-door Doris Day mold and even death fails to dim her loveliness. She couldn't have been more than seventeen or eighteen. Who could have brought themselves to destroy something like this?|n                The wound itself is just a slit, about a half-inch wide and maybe four inches long, directly between her breasts. You wonder what kind of knife could have done something like that. An awful big one you decide. It was the last thing you want to do, but you give Monica a good look-see from her head of curly blonde hair to the soles of her feet. You don't see much---don't even know what you are looking for, but you don't feel as though you could say you'd done a thorough job if you hadn't. Well, there was one thing you notice, though you keep it to yourself: some tiny fragments of thin glass in the girl's hair.>
		speak <               >
		displaytype <Character>
		article <her>
		gender <she>
	end define

	define object <attendant>
		speak <    "What happened to her?" you ask.|n    "Stabbed's all I know. Ain't been an autopsy yet. The assistant pathologist oughtta be coming back from lunch anytime. You c'n ask him, I guess."|n    "Can I look at the body more closely?"|n    "Knock yourself out lady. Don't mind looking at her myself, know what I mean?"|n    "What about this wound?"|n    "Stab wound," he says. "Went straight through the heart. Killed her instantly."|n    "Stabbed with what, do you think?"|n    "The blade or whatever was triangular. That is, the wound tapers from about ten point six centimeters to a point nearly twelve point seven centimeters in the chest cavity.  Sharp as hell, razor-sharp, but I can't think of anything shaped like that, no knife I know of."|n    What the hell is a centimeter? you want to ask, but instead say, "Did anyone, ah, that is, was she..."|n    "Raped? No. There's no sign of any sexual assault. Someone did assault her, however, though in what way rather puzzles me. See those bruises across her thighs and shins? It looks as though someone swung a two-by-four at her a couple of times, but how, I don't know. Both lines of bruises are perfect horizontal."|n    You thank the attendant and beat it the hell out of there. You'd originally planned to go over to Monica's place next but instead you go straight to Joe's and have a couple cups of hot black java to steady your nerves, and your stomach. Jesus, the jobs some people have.>
		prefix <the>
		displaytype <Character>
		article <him>
		gender <he>
	end define

end define

define room <Joe's Diner>
	look <|s12 You walk a couple of blocks over to Joe's, a diner you'd frequented since your time at Slotnik's.  Captain Joe grins as you come in.  Always does. A castoff from the Merchant Marine, he is a hugely powerful man gone to flab. He is behind the counter no matter when you wander in, which was as likely to be one o'clock in the morning as noon.|n|nThe first cup of Joe's corrosive brew gets you seeing in color again and makes a dent in the splitting headache you'd developed. While you suck on your second cup and wolf down a couple of sinkers, you think about the murder at Slotnik's. Your detective course books have been no help at all. According to |iVolume Four, Advanced Deductive Method|xi, the case made no sense at all. |n            The girl had only been in town a month or so, had no enemies.  Killed by an assailant no one saw, with a weapon no one could identify. Was it just a random murder committed by some lunatic who just happened to have wandered into the basement dressing rooms?  "The Phantom of Slotnik's Follies?"|n    Sure looked bad for poor old Max.  If the DA could link a murder with his usual anti-burlesque campaign, it would be the beginning of the end for everyone, not just Slotnik's.|n|nYour headache still throbs. There are few ills that are immune to Joe's coffee but this seems to be one of them. |s00>
	out <drug store>
	south <living room>
	east <Slotnik's Follies>

	define object <Joe>
		speak <                "You look like something a cat coughed up," he says as he places a mug of black coffee in front of you. "You really ought to get more sleep."|n                "You think if I do I'd get to be half as gorgeous as you?"|n                "Worth a shot, I say."|n                "I guess this case is driving you nuts, huh?"|n                "Yeah. There's something that's been bothering the hell out of me. Here, let me show you the set-up."|n                 You take a napkin and do a little sketch for him so he can see what you mean.|n    |nYour headache still throbs. There were few ills that were immune to Joe's coffee and this seemed to be one of them. "Say, Joe, you got any aspirins?"|n                "Naw, sorry.  Took the last one an hour ago. Say, if you're going next door, will you pick me up a bottle, too?"|n                 He gives you a dollar to cover both his and yours.|n>
		displaytype <Character>
		article <him>
		gender <he>
	end define

	define object <sketch>
		look picture popup <makeupnote.jpg; The sketch I made for Joe.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Velda at Joe's>
		look picture popup <life velda 4.jpg; Me and my headache.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <second dressing room>
	look <|s12You are mobbed as soon as you enter the dressing room. It is kind of nice to see all your old friends again well, not that any of them were really friends.  There had never been anyone youd'd ever felt close to or hung around with outside the theater, but it was hard to work with people for so long without forming some sort of bond, even if it's that same sort of link that connects survivors of a hotel fire. But what is funny was how|i they |xilooked. You realize that nothing looks any different than it did five years ago. Nothing is any cheesier, more tawdry or cheaper than it had ever been.  Then you are suddenly self-conscious about how you are dressed: a sweater and capri pants among g-strings and pasties. You are the outsider. It is like |iyou|xi are the one who is naked. Looking at the girls you wonder, did |iyou|xi ever look that tired, hopeless, hard- edged and garish?|n    Everyone was all agog about the murder, if agog is the word you want.  Once they hear what you are doing, they have more questions for you than you have for them. Everyone had known the new girl, Monica, and had liked her, even given her short run with the show. No one knows where she was from exactly---somewhere in the Midwest, they say---but she seemed to be a genuinely sweet kid.  Not an enemy in the world. |n             Well, one, evidently.|n    "Trish'd know something about her," says Gloria, who is not only one of the dancers but does a pretty neat bit with one of the baggy pants. She has aspirations of being an actress and has a chance of making it. She is a natural comedienne. "Trish and Monica spent a lot of time together."|n    Trish the Dish is the stripper who'd moved up to take my place. |s00>
	south <Slotnik's Follies, backstage>

	define object <Trish the Dish>
		look picture popup <trishthedish2.jpg; Trish the Dish>
		speak <You are engulfed in feathers and a couple square yards of bare skin. "Velda! What the hell're you doing here? Don't tell me old Maxie's talked you into coming back."|n    "Hell no. I'm just passing through." |n    She looked relieved. Trish was a statuesque woman who gave whole new meaning to the adjective voluptuous. Four fingers taller than your six feet, she had more curves than a bowl of spaghetti. She makes you feel dumpy. Worse, she makes you feel short and you just hate that.|n    "Well, it's great to see you. Come on in and have a drink."|n     Trish was already dressed for her first show, only a half hour from now.  She was wearing no more feathers than would cover a young canary. Trish picks a bottle off the table beside her and swings it over to you. It is a pretty expensive-looking brandy and for that reason, if for no other, you take a good swig. It's not half bad.|n    "I suppose you've heard the big news," she says.|n    "About Monica being killed?"|n    "Yeah. Ain't that sumthin'?"|n    "Got Maxie all in a swivet."|n    "Nothin' makes him more nervous than havin' cops runnin' all around the place."|n    "He's worried this'll give the DA cause to shut the place down."|n    "Shit. Wouldn't it just figger? Finally get myself on the marquee and look what happens. You had all the luck, Velda."|n    "Yeah, I sure did."|n    "And you're a what now? A private eye?"|n    You nod and show her your ticket.|n    "Jesus, don't that just about beat all. Jesus."|n    "Well, that's why I'm here today, Trish."|n    "Because of Jesus?"|n    "No, because of the murder Maxie's asked me to look into it, maybe find something to keep the DA off his back.  Trish---the other girls said you and Monica got along."|n    "Sure. She was a sweet little kid. Been in the city, I don't know, maybe a month or two. I showed her the ropes.  She was good, really.  She had a lotta potential, you know? Worked like a demon.  Could dance, even sing a little. Just busted out with personality and, you know, that's what guys go for. Anyone can go out on a runway and take their clothes off, but personality that's what gives you style, gives you class. But I don't hafta to tell you that, Velda.  You and me, we got personality. Monica had personality in spades. And a body to go with it.  She was on stage, the other girls might've been a row of penguins as far as the audience cared. I could see that Maxie had his eye on her.  She wasn't going to be in the chorus much longer. I guess she's never going to make it, now, is she?"|n    "Guess not."|n    "What a cryin' shame." She takes another slug of brandy. "What a lousy racket."|n    "Know anything else about her? Did she have any friends, I mean outside the theater? Guys, maybe?"|n    "I don't think so. Like I said, she hadn't been in town all that long. She was pretty focused on her work and didn't have time for much else. Lotsa wolves sniffing 'round her, course, but I kept an eye on her. Spent pretty much all her time here so far as I could tell."|n    "She had to be sleeping somewhere. You know where she lived?"|n    "Somewhere in the Village. Found herself a room, I know. You talk to Wobbles yet?"|n    "Wobbles" Sploon ran the ticket booth. He'd been a boxer once, just after World War I, and had had one knock-out too many.|n    "I will, thanks. Anything else you can think of?"|n    "Nope. I think she'd run away and dint like talkin' about home very much. I got the impression she hadn't been real happy."|n    "Well, thanks, Trish." I give her one of my cards, which seems to impress her no end. "It's been great seeing you. I really wish you all the success in the world, you deserve it."|n    "Thanks, Velda. You always were a square shooter.">
		prefix <Miss>
		displaytype <Character>
		article <her>
		gender <she>
	end define

	define object <photo2>
		alias <photo>
		look picture popup <slotnik girls 2.jpg; You, back in the day.>
		prefix <the>
		displaytype <Object>
		detail <photo>
		article <it>
		gender <it>
	end define

end define

define room <Slotnik's office>
	look <|s11       "I went through his stuff," you tell Max, "and found a whole wad of money. Brand-new bills, all with consecutive serial numbers, so it probably won't be too hard to find what bank they came from and who withdrew them. I gave just about all of them to a friend of mine on the|i Graphic. |xi"|n    "'Just about all?'"|n    "Give me a break, Max. Anyway, you remember Chip Finney?"|n    "Sure, my old publicity man."|n    "The same. He's with the |iGraphic|xi now, and thinks he can really put the screws to Noorvik with this. I hope so. That hypocritical do-gooder has irked me since the day he took office."|n    "I gotta say I'm pretty damned impressed, Velda. I'm sorry I ever said anything about you being a detective."|n    "Hell, don't let it worry you."|n    "But how'd you figure it out? I don't get it."|n    "Elementary, my dear Maxie. The missing mirror bothered me from the get-go. I mean, there were no mirrors in her room at all, not even a hand mirror.  There must have been one when Monica got there. There'd've been hell to pay if she used another girl's mirror.|n    "I know she put her makeup on before she died.  It was still on her face in the morgue, so she must've used her table.|n    "I have to admit, though, that the mirror was just something that nagged at me until I noticed something glinting in her hair. When I looked closely, I could see they were pieces of broken glass little thin curved pieces.  Like from light bulbs. They had to've come from the broken bulbs on her vanity. I figured whatever'd broken the bulbs had broken the mirror too maybe there'd been a struggle? Maybe...but there were those strange bruises across her legs.|n    "The medical examiner couldn't quite figure those out. Neither could I until I talked to a pharmacist about some pills I saw at Monica's place. Then I remembered this radio show I'd heard a few months ago.  This woman had some sort of fainting spell and grabbed at a mirror.  It fell over on her and the broken glass cut her throat and killed her. I figured something like that happened to Monica. She had one of her fits and somehow tipped her makeup table over onto herself. When everything went crashing down on top of her, the mirror broke and one of the pieces of glass stabbed her. There was no murderer, it was just an accident."|n    "But when McWhorter found her," Max said, "there was nothing like that. Sure, the mirror was gone like you say, but so what? There was no mess, I mean, other than the girl of course."|n    "McWhorter lied. He found her lying there with the vanity on top of her and a piece of glass sticking out of her chest. He put the vanity back, picked up the glass and pulled the shard out of her. I found the bloody glass under some newspapers in a box out back. He called the cops, sure, but he called the DA first."|n    "But why? Why would McWhorter do that? I don't get it."|n    "He was pissed off because he thought you were going to fire him."|n    "Fire him? What for? He's been working for me twenty years...Oh...oh, he must've heard I was going to fire |iMcWhirter|xi, the trombonist...Jesus, when he finds out it was all a mistake..."|n    "Yeah, can you just imagine his chagrin?"|n|s00>
	script picture popup <v glass 2.jpg>

	define object <newspaper clipping4>
		alias <newspaper clipping>
		prefix <the>
		displaytype <Object>
		detail <Monica clipping>
		article <it>
		gender <it>
		invisible
	end define

	define object <newspaper clipping5>
		alias <newspaper clipping>
		look picture popup <mcwhorter article.jpg; You're a hero!>
		prefix <the>
		displaytype <Object>
		detail <Velda clipping>
		article <it>
		gender <it>
	end define

	define object <bill>
		alias <bill>
		look picture popup <velda bill.jpg; Hopefully Max won't try to slip out of this!>
		prefix <the>
		displaytype <Object>
		detail <bill>
		article <it>
		gender <it>
	end define

end define

define room <back alley>
	look <|s12You have a hunch and decide to check out the alley behind the theater. Five minutes of digging into trash cans and you find what you were looking for wrapped up in some old newspapers: shards of a broken mirror and pieces of shattered light bulbs.|s00>
	southwest <Slotnik's Follies, backstage>
	script picture popup <8a00338r.jpg>
end define

