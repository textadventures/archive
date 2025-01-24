' "RLD v01"
' Created with QDK Pro 4.0.5

!include <stdverbs.lib>

define game <RLD v01>
	asl-version <400>
	gametype singleplayer
	start <Portal>
	game author <Verbojuice>
	game copyright <©2009>
	game info <Created with QDK Pro 4.0.5>
	startscript {
		set string <retval; $VU_Generate(32; 32)$>
		if ( #retval# <>  ) then {
			msg <Error creating VU: #retval#>
			stop }
	}
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Portal>
	prefix <the>
	look <The Portal is where you can create your character and select where to go.>
end define

define function <VU_Generate>
	set numeric <Map_X_Max; $parameter(1)$>
	set numeric <Map_X_Min; 1>
	set numeric <Map_Y_Max; $parameter(2)$>
	set numeric <Map_Y_Min; 1>
	set string <retval; $Map_Generate$>
	return <#retval#>
end define

define function <Map_Generate>
	' *** This gives the wrong value: set numeric <elemTot; (%Map_X_Max% - %Map_X_Min% + 1) * (%Map_Y_Max% - %Map_Y_Min% + 1)>
	set numeric <elemTot; (1 + %Map_X_Max% - %Map_X_Min%) * (1 + %Map_Y_Max% - %Map_Y_Min%)>
	' *** The following apparently does not execute?
	for <elemPtr; 1; elemTot> {
		set string <Map_Locn[elemPtr]; TEST-VALUE>
		msg <Element %elemPtr% is #Map_Locn[elemPtr]#>
		}
	msg <Element %elemTot% is #Map_Locn[elemTot]#>
	wait <Map Generation Complete - Press a key>
end define


