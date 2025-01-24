' Created with QDK 4.1.5

!include <stdverbs.lib>

define game <>
	asl-version <410>
	start <Camera 1>
	game info <Created with QDK 4.1.5>
	verb <prive?te> msg <You can't prive?te that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define room <Camera 1>
	look <O camera cu diacritice (A room with diacritics): a î â ? ? (The last two should be s and t with comma below)|n>

	define object <TV>
		look <Un televizor obi?nuit (Here should appear an s with comma below)>
		prefix <un>
		displaytype <Object>
		article <îl>
		gender <el>
		properties <prive?te = A verb equivalent to 'look'.>
	end define

end define

