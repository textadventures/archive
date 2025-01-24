' "Zones"
' Created with QDK Lite 4.1.2

!include <stdverbs.lib>

define game <Zones>
	asl-version <410>
	start <Start>
	game info <Created with QDK Lite 4.1.2>
	afterturn do <moveObjects>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Start>
	south <s1_2>
	east <s4_1>
end define

define room <s1_2>
	north <Start>
	south <s2_2>
	east <s1_3>
	west <s1_1>
	properties <zone = s1_1,s2_2,s1_3>
end define

define room <s1_1>
	south <s2_1>
	east <s1_2>
	properties <zone = s2_1,s1_2>
end define

define room <s1_3>
	south <s2_3>
	west <s1_2>
	properties <zone = s2_3,s1_2>
end define

define room <s2_1>
	north <s1_1>
	south <s3_1>
	east <s2_2>
	properties <zone = s1_1,s3_1,s2_2>
end define

define room <s2_2>
	north <s1_2>
	south <s3_2>
	east <s2_3>
	west <s2_1>
	properties <zone = s1_2,s3_2,s2_1,s2_3>

	define object <monster>
		prefix <the >
		displaytype <Character>
		article <him>
		gender <he>
		properties <move = 1; move_percent = 100>
	end define

end define

define room <s2_3>
	north <s1_3>
	south <s3_3>
	west <s2_2>
	properties <zone = s1_3,s2_2,s3_3>
end define

define room <s3_1>
	north <s2_1>
	east <s3_2>
	properties <zone = s2_1,s3_2>
end define

define room <s3_2>
	north <s2_2>
	east <s3_3>
	west <s3_1>
	properties <zone = s2_2,s3_1,s3_3>
end define

define room <s3_3>
	north <s2_3>
	west <s3_2>
	properties <zone = s2_3,s3_2>
end define

define room <s4_1>
	north <s4_2>
	west <Start>
	properties <zone = s4_2>
end define

define room <s4_2>
	north <s4_3>
	south <s4_1>
	properties <zone = s4_3>
end define

define room <s4_3>
	south <s4_2>
	properties <zone = s4_1>

	define object <guard>
		displaytype <Character>
		article <him>
		gender <he>
		properties <move = 1; move_percent = 50>
	end define

end define

define procedure <moveObjects>
	set string <mraum; >
	set string <objectDone; >
	for each room in game {
		set string <raum_name; #quest.thing#>
		for each object in <#quest.thing#> {
			set string <actualObject; #quest.thing#>
			if ( #(actualobject):move# = 1 ) and ( #actualobject# <> #objectdone# ) then {
				set string <mraum; #raum_name#>
				if ( #mraum# <>  ) then {
					set string <mExits; #(mraum):zone#>
					set numeric <numberExits; $countChar(#mExits#;,)$>
					inc <numberExits>
					set numeric <currentRandom; $rand(1; %numberexits%)$>
					set numeric <k; 0>
					for <k; 1; %numberexits%> {
						if ( %k% = %currentRandom% ) then {
							set string <roomdestination; $getRoom(#mexits#;%k%)$>
							set numeric <currentRandom; $rand(1; 100)$>
							if ( %currentRandom% < #(actualobject):move_percent# ) then {
								move <#actualobject#; #roomdestination#>
								msg <#actualobject# goes to: #roomdestination# >
								set string <objectDone; #actualobject#>} else msg <#actualobject# does not move> } }
					} } } }
end define

define function <countChar>
	set numeric <j; 0>
	set string <para1; $parameter(1)$>
	for <i; 1; $lengthof(#para1#)$> if ( $mid(#para1#; %i%; 1)$ = $parameter(2)$ ) then inc <j>
	return <%j%>
end define

define function <getRoom>
	set numeric <j; 0>
	set string <para1; $parameter(1)$>
	set numeric <para2; $parameter(2)$>
	repeat while ( %para2% > 0 ) {
		dec <para2>
		set numeric <pos; $instr(1; #para1#; ,)$>
		dec <pos>
		if ( %pos% < 0 ) then set string <roomdestination; #para1#> else set string <roomdestination; $left(#para1#; %pos%)$>
		inc <pos; 2>
		set string <para1; $mid(#para1#; %pos%;)$> }
	return <#roomdestination#>
end define

