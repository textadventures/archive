' "QRD2 The Beginning"
' Created with QDK Pro 4.0.5

!include <stdverbs.lib>

define game <QRD2 The Beginning>
	asl-version <400>
	gametype singleplayer
	start <portal>
	game author <Verbojuice>
	game copyright <©2009>
	game info <Created with QDK Pro 4.0.5>
	startscript {
		set numeric <idlast; 0>
		property <portal; id=$IdGenerate$>
		property <portal; x=0>
		property <portal; y=0>
		property <portal; z=0>
		property <portal; TypeOf=portal>
		do <RoomGenerate(portal)>
	}
	properties <IdLast=0>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define type <RoomInfo>
	Id = -1
	X = -1
	Y = -1
	Z = -1
	TypeOf = *
	not Generated
end define

define room <portal>
	alias <Arrival Portal>
	prefix <the>
	description msg <The portal has $RoomInfoStr(portal)$>
	type <RoomInfo>
end define

define room <Elsewhere>
	look <Elsewhere is a place where things can be when they aren't anywhere else.>
end define

define procedure <RoomGenerate>
	set string <rmwk; $parameter(1)$>
	property <(rmWk); generated>
end define

define function <IdGenerate>
	inc <idlast>
	return <%idlast%>
end define

define function <RoomInfoStr>
	set string <rmWk; $parameter(1)$>
	return <Id: #(rmwk):id#, coords(#(rmWk):X#, #(rmWk):Y#, #(rmWk):z#)>
end define

define text <intro>
Welcome to QRD2 - The Beginning.
end define


