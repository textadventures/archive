' "Zombie Apocalypse"
' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <Zombie Apocalypse>
	asl-version <410>
	start <Living Room>
	game info <Created with QDK 4.1.5>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Living Room>

	define object <Zombie>
		alias <Zombie>
		look {
			property <Zombie; look=Disgusting...>
			timeron <ZombieAttacking>
		}
		speak <Shush!!! It might hear you!!>
		prefix <a>
		displaytype <Character>
		article <him>
		gender <he>
		use <Magnum> {
			if property <Zombie; alive> then {
				timeroff <ZombieAttacking>
				property <Zombie; look=Disgusting dead zombie.>
				property <Zombie; not alive> }
		}
		properties <Alive>
	end define

	define object <Magnum>
		look <Magnificent weapon, isn't it?>
		take give <Magnum>
		speak <Don't speak to guns. They might backfire.>
		prefix <a>
		displaytype <Object>
		article <it>
		gender <it>
		use on <Zombie> {
			if property <Zombie; alive> then {
				timeroff <ZombieAttacking>
				property <Zombie; look=Disgusting dead zombie.> }
		}
	end define

end define

define timer <ZombieAttacking>
	interval <15>
	action playerlose
	enabled
end define

