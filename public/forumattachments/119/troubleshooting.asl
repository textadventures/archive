' "School Time"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <School Time>
	asl-version <410>
	start <Roadside>
	game info <Created with QDK 4.1.5>
	startscript msg <As you awaken, you wipe some dust from your eyes and try to work up some saliva.  Your throat's parched.|n|nYour face hurts.|n|nYour arms hurt, too.  A glance at them tells you the skin on your face is red, cracked, and peeling.  |n|nYou're unsure how long you've been sleeping here.  You're unsure where "here" is.>
	verb <throw> msg <You can't throw that.>
	verb <rip open; tear open; destroy; pull apart; take apart; cut> msg <You can't seem to take it apart that way.>
	verb <pull> msg <You can't pull that.>
	verb <break> msg <You can't break that.>
	verb <wear; put on> msg <You can't wear that.>
	verb <take off> msg <You can't take off that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Roadside>
	alias <the side of a road>
	prefix <the dust at >
	indescription <You are:>
	north <Road 3>
	south <Road 1>
	west <Plains>
	description <You find yourself in the dust to the side of what looks to be a remote two-lane highway.  The details of the surrounding landscape are unfamiliar and equally uninteresting.  You're prevented from moving east by some well-kept barbed wire, indicating that the arid golden fields in that direction are private property.  Opposite you, maybe a kilometer away, are a few hills, but very little greenery.  What trees there are nearby look to be none but the hardiest evergreens.  The road runs north-south from here.>

	define object <Fields>
		alias <fields>
		alt <field; plains; landscape; scenery>
		look <The landscape to the east is devoid of notable features.  Dry grass and brush for miles.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Hills>
		alias <hills>
		alt <hill; mountains>
		look <The hills in the distance look too far to reach on foot from here.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Road>
		alias <road>
		alt <street; highway; pavement; freeway>
		look <It's a paved two-lane highway at a high level of disrepair.  It runs north and south, and disappears both ends into the dark, overcast horizon.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
	end define

end define

define room <Road 1>
	alias <along the side of the road>
	look <The road seems to go on forever.  There's very little around, apart from the occasional low-flying bird.  Heavy clouds mute the colors of the landscape in every direction.>
	indescription <You are:>
	north <Roadside>
	south <Road 2>
	northwest <Plains>

	define object <baseball>
		alias <baseball>
		alt <ball; base ball>
		look {
			msg <The baseball, once white, is now tan and scuffed with wear.  The stitching, however, is still in good condition.  Upon closer examination, you notice that it's autographed.>
			property <baseball; examined>
		}
		take
		prefix <a well-used>
		displaytype <Object>
		article <it>
		gender <it>
		surface
		transparent
		action <throw> {
			msg <You huck the baseball like a nine year-old girl.>
			move <baseball; Plains>
		}
		action <rip open> if got <folding knife> then msg <Done.> else msg <You can't do that with your bare hands.>
	end define

	define object <autograph>
		alias <autograph>
		alt <signature; monogram>
		look if property <baseball; examined> and got <baseball> then msg <The baseball you found appears to have been autographed in black ink by a woman named Cecelia Schnerzer.> else msg <What autograph are you talking about?>
		prefix <an>
		displaytype <Object>
		article <it>
		gender <it>
		parent <baseball>
		invisible
	end define

end define

define room <Road 2>
	alias <along the side of the road>
	north <Road 1>
	southeast <Bus Depot>
	description if flag <Visited Bus Depot> then msg <You're standing along the side of a seemingly endless road.  Heavy clouds mute the colors of the landscape in every direction, and drizzling droplets of moisture cling to your olive-colored T-shirt and grey chinos.  It feels fantastic on your sunburned skin.  To the southeast, you can see the bus depot.> else msg <You're standing along the side of a seemingly endless road.    Heavy clouds mute the colors of the landscape in every direction, and drizzling droplets of moisture cling to your olive-colored T-shirt and grey chinos.  It feels fantastic on your sunburned skin.  To the southeast, you can see what looks like a prefabricated building, maybe a model trailer home or temporary highway patrol station.>
end define

define room <Bus Depot>
	prefix <a>
	indescription <You are:>
	northwest <Road 2>
	description {
		if real <token machine> then flag on <visited bus depot>
		msg <You're standing in front of a portable prefabricated building.  It looks to have steel thermal-efficient panel walls made with expanded polystyrene with an extra layer of batt insulation and insulation-wrapped roof joists.  The roof is topped with standing-seam metal and the exterior finished with HardieBoard and corrugated sheet metal.  The building looks like it was recently delivered to its current location.|n|nUp a couple steps to the porch area, you can see the front door, which is padlocked shut, and a window.  Opposite the window is a skillfully handpainted sign that reads "|cg|bBus Depot|cb|xb."|n|nAt the roadside, where most buildings might have a mailbox, you can see an oddly-shaped |bvending machine|xb.>
		msg <>
	}

	define object <Token Machine>
		alias <vending machine>
		alt <ticket machine; station machine; token machine>
		look <A squat, round little thing made mostly of hardwood and brass, it looks a little like the love child of an old cigarette vending machine and a Japanese pachinko game.|n|nThe machine's contents are visible through opposite glass windows in front.  The right side contains flat, black, rounded stones or tokens, all about the size of a quarter.  On the left are the same sort of tokens, only white.|n|nGilt lettering across the top reads "Fare - 5 cents - Self Service" alongside a coin slot and a casino slot-style lever, which has been carefully carved to resemble an ear of corn.  >
		prefix <an odd-looking>
		displaytype <Object>
		article <it>
		gender <it>
		container
		transparent
		list off
	end define

	define object <Token lever>
		alias <lever>
		look <It's made of stained hardwood, and has been painstakingly handcrafted to resemble a newly-harvested ear of corn.  It's attached to the side of the machine on one end by a polished brass arm. >
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <pull = It won't budge.>
	end define

	define object <Prefab Depot>
		alias <depot>
		alt <building; bud deopt; bus depot; trailer; modular building; prefab; prefabricated building; prefab building; house>
		look msg < It looks to have steel thermal efficient panel walls made with expanded polystyrene with an extra layer of batt insulation and insulation-wrapped roof joists  The roof is topped with standing-seam metal and the exterior finished with HardieBoard and corrugated sheet metal.  The building looks like it was recently delivered to its current location.|n|nUp a couple steps to the porch area, you can see the front door, which is padlocked shut, and a window.  Opposite the window is a skillfully handpainted sign that reads "|cg|bBus Depot|cb|xb.">
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <enter>
	end define

	define object <Prefab window>
		alias <window>
		alt <out window; in window; through window; through glass; through the glass; out the window; in the window; through the window>
		look <It's mostly dark inside, though you can tell the building is vacant.  The floor is concrete, but a roll of new carpeting rests upright in the back corner.  Lying in the center of the floor, you can see what looks like a large manila envelope.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		action <break> {
			msg <Overcome with the urge to destroy private property, you smash your fist through the pane of glass, shattering the window and tearing your arm to shreds in the process.  Your knuckes, wrist, and forearm are ripped and lacerated nearly to the bone in some places.  |n|nI certainly hope you know first aid.>
			do <Bleedout>
		}
	end define

	define object <prefab carpet>
		alias <carpeting>
		alt <carpet; rug; roll of carpet; roll>
		look <It's sort of hard to see from here, but it looks like a neutral color.  Perhaps.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Manila envelope>
		alias <envelope>
		alt <envelope; manila envelope; vanilla envelope; large envelope>
		look <It's too difficult to see it much better from here.>
		prefix <an>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <prefab door padlock>
		alias <padlock>
		alt <padlock; lock>
		look <It's a heavy-duty industrial padlock.  I don't think you're getting in without a key.>
		prefix <the>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <prefab front door>
		alias <door>
		alt <door; front door; locked door>
		look <The door is secured with a pretty serious padlock.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

end define

define room <Plains>
	east <Roadside>
	northeast <Road 3>
	southeast <Road 1>
end define

define room <Road 3>
	alias <along the side of the road>
	look <The road seems to go on forever.  There's very little around, apart from the occasional low-flying bird.  Heavy clouds mute the colors of the landscape in every direction.>
	indescription <You are:>
	north <Jerky Shop>
	south <Roadside>
	southwest <Plains>
end define

define room <Jerky Shop>
	alias <outside a Trading Post>
	look <The sweet smell of peppered smoke fills your nostrils.  Across the road, you can see a narrow unpaved driveway and parking area leading to a well-kept but humble establishment built in the style of a log cabin.  Its entrance is located to the west. |n|n A tall post at the roadside supports some ad hoc-cum-permanent signage- high above, painted actoss a wedge of whitewashed plywood, is the word |cg|bJERKY|cb|xb.  Perhaps as an afterthought, a second sign is nailed below.   |cg|bBeef!  Elk!  Buffalo!  Venison! |cb|xb Below the signs, you see a mailbox.>
	indescription <You are:>
	south <Road 3>

	define object <Mailbox 417>
		alias <mailbox>
		look <It's an ordinary mailbox, painted black.  On one side, three metallic decals read "417.">
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		open
		close
		add
		remove
	end define

	define object <Campaign pin>
		alias <campaign pin>
		alt <pin; button; campaign button>
		look <It's a round, lime green button emblazoned with the slogan "Vote Mi Wada."  Ostensibly created for some sort of election, this pin prominently features a picture of a five-armed candlestick.>
		take
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Mailbox 417>
		action <wear> {
			if got <Campaign pin> and property <Campaign pin; not worn> then {
				property <Campaign pin; worn>
				msg <Quick to jump on the bandwagon, aren't we?  |n|nYou carefully pin the button to your shirt just above your heart.  You're now proudly supporting Mi Wada for something or other.> } else msg <You don't have the pin.>
		}
		action <take off> {
			if property <Campaign pin; worn> then {
				property <Campaign pin; not worn>
				msg <You remove the pin from your shirt and place it back in your pocket.> } else msg <You aren't wearing it.>
		}
	end define

end define

define procedure <Bleedout>
	timeron <Bleeding 1>
	timeron <Bleeding 2>
	timeron <Bleeding 3>
	timeron <Death from bleedout>
end define

define timer <Bleeding 3>
	interval <16>
	action msg <You're still bleeding very heavily, and you feel a bit faint.  If you can't stop it, you're going to be in big trouble.>
	disabled
end define

define timer <Death from bleedout>
	interval <60>
	action {
		msg <Having lost a lot of blood, and still bleeding out, you fall unconscious.|n|nIt's a shame you had to go and do that.|n|n|jc|cr|s12**YOU HAVE DIED**|cb|s00|n>
		playerlose
	}
	disabled
end define

define text <lose>
I'm sorry, but this is the end for you.  Try again?
end define

