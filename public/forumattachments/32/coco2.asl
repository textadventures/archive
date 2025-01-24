' "Der zwanzigste Oktober"
' Created with QDK Pro 4.1.1

!include <stdverbs.lib>

define game <Der zwanzigste Oktober>
	asl-version <410>
	start <Schlafzimmer>
	game version <1.1>
	game info <Created with QDK Pro 4.1.1>
	default fontname <Primitive>
	default fontsize <16>
	startscript {
		give <Noch nicht verf�gbar.>
		flag on <Fe-R�tsel 1>
	}
	command <handtasche> exec <inventory>
	command <raum> exec <l; normal>
	verb <h�r> msg <You can't h�r that.>
	verb <f�hl> msg <You can't f�hl that.>
	verb <such> msg <You can't such that.>
	verb <schalt ein> msg <You can't schalt ein that.>
	verb <schalt aus> msg <You can't schalt aus that.>
	verb <zieh> msg <You can't zieh that.>
	verb <dr�ck> msg <You can't dr�ck that.>
	verb <durchsuche> msg <You can't durchsuche that.>
	verb <riech> msg <You can't riech that.>
	verb <untersuche> msg <You can't untersuche that.>
	verb <f�ll> msg <You can't f�ll that.>
	verb <falte> msg <You can't falte that.>
end define

define options
	debug on
	panes on
	abbreviations on
end define

define synonyms
	an = to
	mit = with
	schau; sieh; betrachte = look
	�ffne; mach auf; mache auf; sperr auf ; sperre auf ; schlie� auf ; schlie�e auf = open
	schlie�e ; mach zu ; mache zu = close
	nimm ; heb auf ; hebe auf = take
	ben�tze ; n�tze ; verwende = use
	h�re; horch; h�r zu; h�re zu; horche; horche hin; horch hin; horch zu; horche zu; h�r hin; h�re hin = h�r
	f�hle = f�hl
	suche = such
	schalte ein; dreh auf; drehe auf; schalt auf; schalte auf = schalt ein
	schalte aus; dreh aus; drehe aus; dreh ab; drehe ab; schalte ab; schalt ab; mach aus; mache aus; mach ab; mache ab = schalt aus
	ziehe = zieh
	dr�cke ; press ; presse ; schieb ; schiebe = dr�ck
	durchsuch ; untersuche ; untersuch ; erforsche ; forsche ; erforsch ; forsch ; durchw�hl ; durchw�hle = durchsuche
	drehe auf; drehe an; schalte auf; schalt auf; schalt ein; schalte ein; mach ein; mache ein = dreh auf
	drehe ab ; dreh ab ; drehe aus ; dreh aus ; schalte aus ; schalt aus ; schalt ab ; schalte ab ; mach ab ; mache ab ; mach aus ; mache aus = dreh ab
	s�den = south
	gehe nach ; gehe zu ; geh nach ; geh zu = go to
	rieche; schnupper; schnuppere; schn�ffel; schn�ffle = riech
	sprich mit = speak
	sprich ; red ; rede = speak
	gib = give
	f�lle; bef�lle; bef�ll = f�ll
end define

define room <Schlafzimmer>
	prefix <Cocos>
	look <|nEs ist sp�rlich eingerichtet, besteht lediglich aus einem Bett, einem Nachtk�stchen und einem gro�en Kleiderschrank. Auf der altmodischen Tapete sind Wasserflecken zu sehen. An der Wand h�ngt ein seltsamer Spiegel und am Boden liegt ein Teppich mit einigen Flecken drauf - woher die wohl stammen? T�re und Fenster sind verschlossen und in einer Ecke f�llt dir ein Hundek�rbchen auf.>
	south locked <Vorzimmer; Die T�r ist zu.>

	define object <Bett>
		look <Es ist ein Stahlger�st im IKEA-Jugendstil. Darauf liegen zwei hauchd�nne Matrazen und einige Decken.>
		prefix <ein>
		displaytype <Object>
		article <Es>
		gender <Es>
		properties <untersuche = Eine genauere Untersuchung best�tigt: Es ist ein Stahlger�st im IKEA-Jugendstil. Darauf liegen zwei hauchd�nne Matrazen und einige Decken.>
	end define

	define object <Nachtk�stchen>
		alt <Nachtkasterl; kasterl; k�stchen; schublade; lade; nachtk�stchenlade; nachtkasterllade>
		look <Es ist ein altes Nachtk�stchen aus Holz.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			if property <Nachtk�stchen; geschlossen> then {
				msg <|s00Erwartungsvoll �ffnest du die Schublade deines Nachtk�stchens. Was da wohl drinnen ist?>
				property <Nachtk�stchen; not geschlossen>
				property <Nachtk�stchen; ge�ffnet>
				open <Nachtk�stchen> } else msg <Die Lade ist schon offen.>
		}
		close {
			if property <Nachtk�stchen; ge�ffnet> then {
				msg <|s00Ordungsliebend wie du bist schlie�t du die Schublade auch wieder.>
				property <Nachtk�stchen; not ge�ffnet>
				property <Nachtk�stchen; geschlossen>
				close <Nachtk�stchen> } else msg <Sie ist schon geschlossen und bewegt sich keinen Centimeter.>
		}
		add msg <Du legst folgenden Gegenstand in die Schublade: #quest.lastobject#.>
		remove
		list empty <Die Lade ist leer.>
		list closed <Die Schublade ist im Moment geschlossen.>
		properties <geschlossen>
		action <zieh> exec <�ffne nachtk�stchen>
		action <dr�ck> exec <schlie�e nachtk�stchen>
	end define

	define object <Kleiderschrank>
		alt <schrank; kasten>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Das Knarzen des antiken Holzes w�hrend du ihn �ffnest vermittelt eine gruselige Atmosph�re.>
		close <Es knarzt und quietscht, als du die T�re wieder schlie�t.>
		list empty <Tr�gerleibchen lang, sortiert in erster Instanz nach Gr��e, in zweiter Instanz nach Farbe und in dritter Instanz alphabethisch nach dem Ort des Kaufs. Ebenso die Tr�gerleibchen kurz, normale Leibchen lang, normale Leibchen kurz, lang�rmlige Leibchen lang, lang�rmlige Leibchen kurz undsoweiter.. �hnlich penibel sortiert die St��e der Hosen, der Pullover, der Blusen, der Blazer, der R�cke, der Kleider, der Jacken, der Anz�ge, der Str�mpfe, der Socken und der Unterh�schen. Daneben ein Fach mit Kleidungsst�cken, die sich nicht einordnen lassen (unter anderem ein mexikanischer Poncho, ein israelischer Talah und ein kongolesischer Lendenschurz. Und als du also deine Blicke so �ber deine Sammlung schweifen l�sst f�llt dir auf, dass du dringend neue Kleider brauchst.>
		list closed <Es ist gro�er, h�lzerner ehrw�rdiger Kleiderschrank.>
	end define

	define object <Spiegel>
		look <Er zeigt das Bild eines bildh�bschen M�dchens.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Er>
	end define

	define object <Teppich>
		look if flag <gute fe am boden> then msg <|s00Am Boden liegt ein alter Teppich mit merkw�rdigen Flecken - woher die wohl stammen? Ein kleines lockiges Etwas liegt darauf und zittert und hustet.> else msg <|s00Auf dem Boden liegt ein alter Teppich mit sehr merkw�rdigen Flecken - woher die wohl stammen?>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Er>
		properties <untersuche = Ein strohiger alter Teppich, etwas ausgefranst an den Seiten. Nichts weiter ungew�hnliches, wenn da nicht dieser Fleck w�re, der verdammt wie ein Urinfleck aussieht.>
	end define

	define object <T�r>
		alt <t�re; ausgang>
		look {
			if got <Handtasche> then {
				if property <T�r; geschlossen> then msg <Eine wei�gestrichene T�re, an der an einigen Stellen der Lack abbr�ckelt. Sie ist zu.> else msg <Eine wei�gestrichene T�re, an der an einigen Stellen der Lack abbr�ckelt. Sie ist offen.> } else {
				if property <T�r; geschlossen> then {
					msg <|s00Eine wei�gestrichene T�re, an der an einigen Stellen der Lack abbr�ckelt. Sie ist zu. Deine Handtasche h�ngt dar�ber.>
					reveal <Handtasche> } else msg <Eine wei�gestrichene T�re, an der an einigen Stellen der Lack abbr�ckelt. Sie ist offen.> }
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <Sie>
		container
		open {
			if property <T�r; geschlossen> then {
				if got <Zimmerschl�ssel> then {
					msg <|s00Mit dem kleinen Schl�ssel �ffnest du die T�re.>
					property <T�r; not geschlossen>
					property <T�r; ge�ffnet>
					open <T�r>
					unlock <Schlafzimmer; south> } else msg <Hm, versperrt. Ohne Zimmerschl�ssel wirds verdammt schwer da rauszukommen.> } else msg <Die T�re ist schon offen.>
		}
		close {
			if property <T�r; geschlossen> then msg <Die T�re ist schon zu.> else {
				msg <|s00Du schlie�t die T�re.>
				property <T�r; not ge�ffnet>
				property <T�r; geschlossen>
				close <T�r>
				lock <Schlafzimmer; south> }
		}
		properties <geschlossen>
	end define

	define object <Fenster>
		look if property <Fenster; geschlossen> then msg <|s00Das Fenster ist zwar sehr d�nn und alles andere als dicht, aber immerhin zu. Drau�en herrscht ein grausiger Sturm.> else msg <|s00Das Fenster ist offen und immer wieder h�mmert der Wind seine Fl�gel kraftvoll gegen die W�nde. Selten hast du so einen grausigen Sturm erlebt.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Es>
		container
		open {
			if property <Fenster; verriegelt> then {
				msg <|s00Du zerrst an den Riegeln doch das Fenster �ffnet sich nicht. Du wunderst dich etwas, doch dann f�llt dir ein kleiner Holzkeil auf, der unten im Rahmen klemmt.>
				reveal <Holzkeil> } else {
				if property <Fenster; geschlossen> then {
					property <Fenster; not geschlossen>
					property <Fenster; ge�ffnet>
					msg <|s00Du drehst die beiden Riegel und sofort dr�ckt dir der Wind die Fl�gel entgegen. Mit viel Geschick weichst du ihnen aus - das ging gerade noch einmal gut.>
					open <Fenster>
					if here <gute Fe> and property <Fenster; ge�ffnet> then msg <|s00Ein d�nnes Stimmchen zischelt: "Bitte schnell wieder zumachen...!"> else {
						timeroff <gute Fe>
						timeroff <gute Fe2>
						timeroff <gute Fe3>
						timeroff <gute Fe4>
						msg <|s00Ein kleines, lockiges und ganz offensichtlich hustendes und frierendes Etwas wird vom Wind hereingeblasen und landet unsaft am Boden. Wer oder was ist das?>
						flag on <gute Fe am Boden>
						show <gute Fe>
						hide <stimme> }
					timeron <fenster offen - sturm> } else msg <Das Fenster ist bereits offen.> }
		}
		close {
			if property <Fenster; ge�ffnet> then {
				property <Fenster; not ge�ffnet>
				property <Fenster; geschlossen>
				msg <Unter gr��ter Anstrengung schlie�t du das Fenster und augenblicklich kehrt wieder Stille ein.>
				close <Fenster>
				timeroff <fenster offen - sturm> } else msg <Es ist doch noch immer zu.>
		}
		properties <geschlossen; verriegelt>
		action <�ffne> {
			if property <Fenster; geschlossen> then {
				property <Fenster; ge�ffnet>
				msg <Du �ffnest das Fenster.> } else msg <Das Fenster ist bereits offen.>
		}
	end define

	define object <Holzkeil>
		alt <keil; holz>
		look if property <Fenster; verriegelt> then msg <Ein kleiner Holzkeil steckt unten im Rahmen und verhindert, dass der Wind das Fenster aufdr�ckt.> else msg <Es ist ein kleiner Holzkeil. Man wei� nie, wozu man ihn noch brauchen kann.>
		take {
			if property <Fenster; verriegelt> then msg <|s00Du versuchst den Keil herauszuziehen doch er klemmt fest.> else {
				if flag <inventar an> then {
					msg <|s00Du hebst den Keil auf und steckst ihn in deine Handtasche.>
					give <Holzkeil> } else {
					msg <|s00Du hebst ihn auf, �berlegst kurz, wo du ihn hinstecken sollst und legst ihn dann auf die Ablage.>
					add <Holzkeil; Ablage> } }
		}
		prefix <ein kleiner>
		displaytype <Object>
		article <it>
		gender <Er>
		invisible
	end define

	define object <Handtasche>
		look <Der Kernbestandteil weiblicher Identit�t. Kann man sich eine Frau ohne ihre Handtasche �berhaupt vorstellen?>
		take {
			msg <|s00Du nimmst die Handtasche auf, darin findest du auch eine Nagelfeile und einen kleinen Schl�ssel.|nDu kannst ab jetzt auch andere Dinge einsammeln und mitnehmen.|nMit dem Befehl "Handtasche" kannst du ab sofort jederzeit deine Inventarliste abrufen.>
			give <Handtasche>
			show <Nagelfeile>
			give <Nagelfeile>
			hide <Handtasche>
			flag on <Inventar an>
			hide <Noch nicht verf�gbar.>
			show <Zimmerschl�ssel>
			give <Zimmerschl�ssel>
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <Sie>
		invisible
		container
	end define

	define object <Nagelfeile>
		alt <feile>
		look <Eine kleine, handliche Nagelfeile. Ein Accessoire, das in keiner Damenhandtasche fehlen darf. Und in keinem Adventurespiel.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <Sie>
		hidden
		use msg <|s00Du nimmst dir kurz Zeit und f�hrst kleinere kosmetische Korrekturarbeiten an deinen Fingern�geln durch. Sofort f�hlst du dich etwas besser.>
		use on <Teppich> msg <Und wo willst damit anfangen?>
		use on <fleck> {
			msg <|s00Sorgf�ltig schabst du den Urinsalzrand ab. Gut gemacht. Doch was nun? Du kannst ja nicht einfach das Salz in deiner Handtasche verstreuen.>
			show <Salz>
			property <fleck; not mit salzrand>
		}
	end define

	define object <Noch nicht verf�gbar.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Schlafzimmerboden>
		alias <Boden>
		alt <grund; hinunter; unten; boden>
		look <Ein alter, v�llig zerfuchter Holzboden bildet den Grund. Darauf liegt ein ausgefranster Teppich voller Flecken.>
		prefix <der>
		displaytype <Object>
		article <it>
		gender <Er>
		invisible
	end define

	define object <stimme>
		look do <stimme h�ren sehen f�hlen>
		speak <Du m�chtest also eine Stimma ansprechen.. Such dir lieber zuerst mal, wem diese Stimme geh�rt! (Vielleicht m�chtest du ja nachher garnicht mehr mit ihr sprechen...)>
		displaytype <Object>
		article <it>
		gender <Sie>
		invisible
		properties <such; f�hl = Ein sehr esoterischer Ansatz. Toller Einfall, zugegeben, aber wenig zielf�hrend.; h�r = Du strengst dich an, aber im Moment kannst du nichts h�ren.>
		action <f�hl> do <stimme h�ren sehen f�hlen>
		action <such> do <stimme h�ren sehen f�hlen>
	end define

	define object <Radio>
		alt <kasettenradio; deck; kasettendeck>
		take msg <Es ist einfach zu schwer. Und zu sinnlos. Lieber nicht.>
		prefix <ein altes>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Nachtk�stchen>
		container
		open <Du dr�ckst den Stoppknopf und �ffnest das Kasettendeck.>
		close
		list closed if got <Antenne> then msg <Es ist ein altes Kasettenradio. Vielleicht ist ja noch eine Kasette drinnen?> else msg <Es ist ein altes Kasettenradio. Vielleicht ist ja noch eine Kasette drinnen. Au�erdem ist die Antenne abgebrochen, unter Umst�nden liegt die auch noch irgendwo herum.>
		properties <schalt ein; schalt aus>
		action <schalt ein> do <radiotext>
	end define

	define object <Antenne>
		look <Es die Antenne deines alten Radios, die du in deinem Bett gefunden hast.>
		take {
			if flag <inventar an> then {
				msg <|s00Du steckst die Antenne in deine Handtasche. Gottseidank kann man das Ding einfahren.>
				give <Antenne> } else msg <Um Gottes Willen wohin denn damit?>
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

	define object <Kasette>
		look <"Das Liebeskraut" aus der Bibi & Tina Serie. Hast du das wirklich angeh�rt? An der Seite scheint sie einen kleinen Sprung zu haben, als ob irgendjemand versucht h�tte sie aufzubrechen.>
		take {
			if flag <inventar an> then {
				if here <Radio> then {
					msg <|s00Du willst gerade die Kasette herausziehen, da f�llt dir das Radio hinunter. Irgendwie sieht es nicht mehr besonders funktionst�chtig aus. Du beschlie�t es einfach unters Bett zu schieben - aus den Augen, aus dem Spiel.>
					remove <Kasette>
					remove <Radio>
					hide <Radio>
					give <Kasette> } else {
					msg <|s00Du nimmst die Kasette aus der Lade und steckst sie in deine Handtasche.>
					remove <Kasette>
					give <Kasette> } } else {
				if here <Radio> then {
					msg <|s00Du willst gerade die Kasette herausziehen, da f�llt dir das Radio hinunter. Irgendwie sieht es nicht mehr besonders funktionst�chtig aus. Du beschlie�t es einfach unters Bett zu schieben - aus den Augen, aus dem Spiel.|nDa du nicht wei�t, wohin du die Kasette geben sollst, legst du es einfach wieder in die Lade.>
					remove <Radio>
					remove <Kasette>
					hide <Radio>
					open <Nachtk�stchen>
					show <Tonband>
					add <Kasette; Nachtk�stchen> } else msg <Da du keine passende Tasche hast, wo du sie hingeben k�nntest, l�sst du sie erstmal in der Lade liegen.> }
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Radio>
		use <Nagelfeile> do <ben�tze nagelfeile mit kasette>
		use on <Nagelfeile> do <ben�tze nagelfeile mit kasette>
		use on anything msg <|s00Die einzig sinnvolle Art eine Kasette zu ben�tzen, ist mit einem passenden Abspielger�t. Und das hast du gerade zertr�mmert.>
		container
		open msg <Mit deinen blo�en Damenfingern schaffst du das einfach nicht.>
	end define

	define object <Tonband>
		look <Es ist ein mit feinem Eisenpulver beschichtetes Plastikband.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

	define object <Matrazen>
		alt <matraze; matratze; matratzen; matr�zchen; matr�tzchen>
		look <Auf dem Bett liegen zwei hauchd�nne, viel zu kurze Matr�zchen. Keinn Wunder, dass du du so schlecht geschlafen hast.>
		prefix <zwei>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <durchsuche>
		action <durchsuche> {
			if flag <antenne entnommen> then msg <Hm, zwei Matrazen. Nicht mehr.> else {
				if flag <inventar an> then {
					msg <|s00Hey, zwischen den beiden Matrazen steckt eine alte Antenne. Vermutlich geh�rte die mal zu einem Radio. Du steckst sie vorsichtshalber mal ein.>
					show <Antenne>
					give <Antenne>
					flag on <antenne entnommen> } else {
					msg <|s00Hey, zwischen den beiden Matrazen steckt eine alte Antenne! Vermutlich geh�rte die mal zu einem Radio. Leider wei�t du nicht, wo du sie hingeben sollst und legst sie einfach mal in das Nachtk�stchen.>
					show <Antenne>
					open <Nachtk�stchen>
					add <Antenne; Nachtk�stchen>
					flag on <antenne entnommen>
					property <Nachtk�stchen; not geschlossen>
					property <Nachtk�stchen; ge�ffnet> } }
		}
	end define

	define object <gute Fe>
		alt <fee; wesen; seltsames wesen; kleines wesen; etwas; kleines etwas; lockiges etwas; kleines, lockiges etwas; stimme; stimmchen>
		look {
			if flag <gute fe am boden> then msg <Ein kleines, lockiges Feenwesen liegt am Boden und zittert und hustet.> else {
				if flag <fe-r�tsel 1> then msg <Eine kleine, lockige Fe. Sie zittert und bibbert und h�stelt und r�chelt. Offenbar ist die �rmste schwer erk�ltet.> }
		}
		take {
			if flag <fe im hundek�rbchen> then msg <Besser sie bleibt erstmal in ihrem Bettchen und ruht sich aus.> else {
				msg <|s00Du steckst die gute Fe in deine Handtasche und nimmst sie erstmal mit. Du solltest aber dringend ein besseres (=w�rmeres) Pl�tzchen f�r sie finden.>
				flag off <gute fe am boden>
				give <gute Fe> }
		}
		speak {
			if flag <fe-r�tsel 1> then msg <-Wer bist du?|n-Die gute Fe..|nMehr bringt sie vor lauter Zittern und R�cheln und Z�hneklappern nicht hervor. Die �rmste scheint sich eine saftige Verk�hlung eingefangen zu haben.> else {
				if flag <fe-r�tsel 2> then choose <Fe-R�tsel 2 Dialog> else {
					if flag <fe-r�tsel 3> then msg <blu> } }
		}
		displaytype <Character>
		article <ihr>
		gender <sie>
		hidden
		use on <Hundek�rbchen> {
			if flag <w�rmflasche im hundek�rbchen> and flag <polster im hundek�rbchen> then {
				if flag <w�rmflasche im hundek�rbchen> and flag <polster im hundek�rbchen> then {
					msg <|s00Du legst die bibberende gute Fe in das warme und flauschige Hundek�rbchen. Das scheint ihr wirklich gut zu tun (zum Beispiel h�rt sie endlich mit dem l�stigen Z�hneklappern auf.)>
					flag off <fe-r�tsel 1>
					flag on <fe-r�tsel 2>
					lose <gute Fe>
					flag on <fe im hundek�rbchen> } } else {
				if flag <w�rmflasche im hundek�rbchen> then msg <Es ist jetzt zwar warm, aber noch recht hart und ungem�tlich. Du mu�t dir noch irgendetwas �berlegen, wie du das gem�tlicher gestalten kannst.> else {
					if flag <polster im hundek�rbchen> then msg <Es ist jetzt zwar weich aber immer noch arschkalt. Du mu�t dir noch irgendetwas einfallen lassen, wie du das Bettchen w�rmen kannst.> else msg <Gute Idee, nur im Moment ist das nur ein Strohgeflecht - hart und kalt. Das solltest du erstmal irgendwie pr�parieren.> } }
		}
		give to <Hundek�rbchen> {
			if flag <w�rmflasche im hundek�rbchen> and flag <polster im hundek�rbchen> then {
				if flag <w�rmflasche im hundek�rbchen> and flag <polster im hundek�rbchen> then {
					msg <|s00Du legst die bibberende gute Fe in das warme und flauschige Hundek�rbchen. Das scheint ihr wirklich gut zu tun (zum Beispiel h�rt sie endlich mit dem l�stigen Z�hneklappern auf.)>
					flag off <fe-r�tsel 1>
					flag on <fe-r�tsel 2>
					lose <gute Fe>
					flag on <fe im hundek�rbchen> } } else {
				if flag <w�rmflasche im hundek�rbchen> then msg <Es ist jetzt zwar warm, aber noch recht hart und ungem�tlich. Du mu�t dir noch irgendetwas �berlegen, wie du das gem�tlicher gestalten kannst.> else {
					if flag <polster im hundek�rbchen> then msg <Es ist jetzt zwar weich aber immer noch arschkalt. Du mu�t dir noch irgendetwas einfallen lassen, wie du das Bettchen w�rmen kannst.> else msg <Gute Idee, nur im Moment ist das nur ein Strohgeflecht - hart und kalt. Das solltest du erstmal irgendwie pr�parieren.> } }
		}
		give anything msg <Das will sie nicht.>
		action <sprich mit> if flag <fe-r�tsel 1> then msg <|s00-Wer bist du?|n-Die gute Fe...|nMehr bringt sie im Moment vor lauter zittern und husten nicht �ber die Lippen. Sie sieht wirklich erb�rmlich aus, du solltest sie irgendwie w�rmen.>
		action <red mit> if flag <fe-r�tsel 1> then msg <-Wer bist du?|n-Die gute Fe..|nMehr bringt sie vor lauter Zittern und R�cheln und Z�hneklappern nicht hervor. Die �rmste scheint sich eine saftige Verk�hlung eingefangen zu haben.>
	end define

	define object <Kleider>
		look <Kleider. Viele Kleider. Eine Menge Kleider. Sch�tzungsweise um die 2 Tonnen Kleider. Und trotzdem kein einziges Leibchen, das farblich zu deinen Schuhen passen w�rde..>
		take msg <Es ist einfach nicht der richtige Zeitpunkt um dich jetzt durch deine Garderobe zu w�hlen.>
		prefix <jede Menge>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Kleiderschrank>
	end define

	define object <Tapete>
		look <Die Tapete zeigt in ausgebleichten Farben ein nicht mehr ganz modernes Strichmuster. Der Zahn der Zeit macht auch vor Papier nicht halt.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Hundek�rbchen>
		alt <k�rbchen; hundekorb; korb; polster>
		look {
			if flag <fe im hundek�rbchen> then msg <Die gute Fe liegt im pudelwarmen Hundek�rbchen. Ein unrealistisches, aber doch sehr, sehr nettes Bild.> else {
				if flag <w�rmflasche im hundek�rbchen> and flag <polster im hundek�rbchen> then msg <Es ist ein aus Stroh geflechtetes Hundek�rbchen, in dem ein Polster und eine W�rmflasche liegen - ein richtig gem�tliches Bettchen hast du da konstruiert.> else {
					if flag <w�rmflasche im hundek�rbchen> then msg <Die W�rmflasche liegt in dem aus Stroh geflochtenen Hundek�rbchen. Recht gem�tlich sieht das ganze aber trotzdem noch nicht aus.> else {
						if flag <polster im hundek�rbchen> then msg <Es liegt ein Polster in dem aus Stroh geflochtenen Hundek�rbchen.> else msg <Es ist ein leeres, aus Stroh geflochtenes Hundek�rbchen. Im Moment sieht das nicht besonders gem�tlich aus.> } } }
		}
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Zimmerschl�ssel>
		alt <schl�ssel; kleiner schl�ssel; kleinen schl�ssel>
		look <Es ist dein kleiner silberner Zimmerschl�ssel.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Handtasche>
		hidden
		use on <T�r> msg <Du probierst aus, ob der Schl�ssel aus deiner Handtasche auch tats�chlich ins Schloss passt - das tut er.>
	end define

	define object <fleck>
		look if property <fleck; mit salzrand> then msg <Er sieht aus, als ob hier einmal eine Fl�ssigkeit ausgeronnen w�re. Vielleicht hat der Hund..? Oder etwa.. Nein!> else msg <Es ist der Urinfleck, von dem du das Salz abgeschabt hast.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <riech = Das riecht irgendwie salzig. Vielleicht wirklich ein Urinfleck?; untersuche = Der Fleck ist von einer wei�lichen Umrandung umgeben. Salz. Der Verdacht eines Urinflecks erh�rtet sich.>
		action <riech> if property <fleck; mit salzrand> then msg <Das riecht irgendwie salzig. Vielleicht wirklich ein Urinfleck?> else msg <Nachdem du bereits die Salzprobe durchgef�hrt hast, ist auch der Geruchseindruck recht klar: Urin. Nur: von wem?>
		action <untersuche> if property <fleck; mit salzrand> then msg <Der Fleck ist von einer wei�lichen Umrandung umgeben. Salz? Der Verdacht eines Urinflecks erh�rtet sich.> else msg <Du hast bereits gekl�rt, dass es sich hierbei um einen Urinfleck handeln mu�. Die Frage jedoch, von wem er stammt, wir schwerer zu beantworten sein.>
	end define

	define object <Salz>
		prefix <ein wenig>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

end define

define room <Vorzimmer>
	north <Schlafzimmer>
	east <Wohnzimmer>
	west <K�che>
end define

define room <K�che>
	look <|s09|nDie K�che ist ein Schlauch, an dessen einem Ende ein alter Kohleofen steht. Daneben stehen aufgef�delt ein Elektroherd, ein Geschirrk�stchen und einen K�hlschrank, eine Eckbank umrahmt den Esstisch.|s00>
	south <Badezimmer>
	east <Vorzimmer>

	define object <Kohleofen>
		alt <ofen>
		look <Es ist der Kohleofen, mit dem du die K�che heizen w�rdest, wenn du Kohlen h�ttest... Beim Anblick des leeren Ofens wird dir schlagartig wieder bewusst, wie bitterkalt dir eigentlich ist.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Elektroherd>
		alt <e-herd; herd; herdplatte; platte; rohr; ofenrohr>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			msg <|s00Du �ffnest das Rohr.>
			property <Elektroherd; ge�ffnet>
			property <Elektroherd; not geschlossen>
		}
		close {
			msg <|s00Du schlie�t den Herd wieder.>
			property <Elektroherd; not ge�ffnet>
			property <Elektroherd; geschlossen>
		}
		list empty <Der Herd ist leer.>
		list closed <Es ist ein funktionst�chtiger Elektroherd mit einem Ceranfeld mit vier Platten, der Stolz der K�che.>
		properties <geschlossen>
	end define

	define object <Geschirrk�stchen>
		alt <Geschirrkasterl; k�stchen; kasterl>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Langsam �ffnest du das K�stchen.>
		close <Du schlie�t das K�stchen wieder.>
		add
		remove
		list closed {
			msg <|s00Es ist ein schlichtes Geschirrk�stchen. Es ist im Moment geschlossen. Darauf stehen ein Messerblock, eine Caf�maschine mit Kanne und ein Korb mit Fr�chten.>
			reveal <Messerblock>
			reveal <Cafemaschine>
			reveal <Kanne>
			reveal <Obstkorb>
		}
	end define

	define object <K�hlschrank>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Wenig hoffnungsvoll �ffnest du den K�hlschrank. Er bringt selten freudige �berraschungen.>
		close <Du schlie�t den K�hlschrank wieder und fragst dich, ob das kleine Lichtlein wohl noch immer brennt?>
		add
		remove
		list empty <Es l�sst sich eine faszinierende Beziehung zwischen deinem K�hlschrank und einem St�ck Leder beobachten: Je leerer deine Geldtasche desto leerer dein K�hlschrank.>
		list closed <Dein K�hlschrank ist im Moment geschlossen. Du hast dir abgew�hnt ihn immer wieder zu �ffnen, er ist doch immer leer.>
	end define

	define object <Eckbank>
		alt <Bank; bl�mchenbezug; bezug; sitzfl�che; k�chenbank>
		look <Eine Eckbank mit Bl�mchenbezug. Vielleicht ist es eine dieser alten B�nke, wo man eine Sitzfl�che anheben kann und sich darunter ein geheimes Fach verbirgt?>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open
		close
		add
		remove
	end define

	define object <Esstisch>
		alt <Tisch>
		look <Eine rechteckige Platte auf vier F��en - ein klassischer Esstisch.>
		take msg <Vielleicht, wenn du eine etwas gr��ere Handtasche h�ttest.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Messerblock>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		opened
		remove < >
		list {
			msg <|s00Ein Messerblock aus einer dieser Werbesendungen. Von wegen 24-teiliges Edelstahl-Messerset, und wenn sie jetzt anrufen, bekommen sie noch diese einzigartige Bio-Fruchtsaftpresse gratis dazu! Und das ganze f�r nur unschlagbare 249,90 Euro! Und von dem ganzen blieb dann irgendwie nur noch ein Messer �brig, dass da jetzt so alleine drinnen steckt.>
			reveal <Messer>
		}
		list empty <Ein Messerblock aus einer dieser Werbesendungen. Von wegen 24-teiliges Edelstahl-Messerset, und wenn sie jetzt anrufen, bekommen sie noch diese einzigartige Bio-Fruchtsaftpresse gratis dazu! Und das ganze f�r nur unschlagbare 249,90 Euro! Kein einziges mehr der 24 Super-Edelstahlmesser ist noch �brig, wie traurig.>
	end define

	define object <Cafemaschine>
		alt <Caf�maschine; Kaffeemaschine; caffeemaschine; Kaffemaschine; Kafeemaschine; maschine>
		look <Es ist eine organge Filtercaf�maschine. Es scheint, als h�tte sie in ihrem langen Leben schon sehr, sehr viel Caf� gekocht.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <schalt ein; schalt ab = Sie ist schon ausgeschaltet, sie schaltet sich automatisch ab.; schalt aus = Sie ist schon ausgeschaltet, sie schaltet sich automatisch ab.>
		action <schalt ein> {
			if flag <cafemaschine bereit> then {
				if here <Kanne> or got <Kanne> then {
					if not property <Kanne; voll> then {
						msg <|s00Du schaltest die Maschine ein und wartest, bis das hei�e Wasser durch den leeren Caf�filter in die Kanne tropft. Jetzt hast du eine Kanne, die mit hei�em Wasser gef�llt ist.>
						property <Kanne; voll mit hei�em wasser>
						flag off <cafemaschine bereit>
						lose <Kanne> } else msg <Deine Kanne ist doch schon voll mit Wasser, das solltest du erstmal wegleeren.> } else msg <Hm, und wo soll dann das hei�e Wasser hin? Erstmal brauchst du die Kanne, die in diese Maschine passt...> } else msg <Du k�nntest die Maschine jetzt nat�rlich einschalten, aber es w�rde sich anbieten vorher noch Wasser hineinzuleeren.>
		}
	end define

	define object <Kanne>
		alt <Kaffeekanne; caf�kanne; caffeekanne>
		look {
			if property <Kanne; voll> then msg <Sie ist gef�llt mit Wasser.> else {
				if property <Kanne; voll mit hei�em wasser> then msg <Deine Kanne ist voll mit hei�em Wasser.> else msg <|s00Eine Caf�- oder Teekanne. Sie ist leer.> }
		}
		take
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		use on <Dusche> {
			if flag <warmes duschwasser> or flag <kaltes duschwasser> then {
				if property <Kanne; voll> then msg <Sie ist doch schon voll.> else {
					msg <|s00Du bef�llst die Kanne mit Wasser. Sie ist jetzt voll.>
					property <Kanne; voll> } } else msg <Du solltest erstmal Wasser aufdrehen, vorher geht da garnichts.>
		}
		use on <Abwasch> {
			if flag <kaltes abwaschwasser an> then {
				if property <Kanne; voll> then msg <Sie ist doch schon voll.> else {
					msg <|s00Du bef�llst die Kanne mit Wasser.>
					property <Kanne; voll> } } else msg <Dazu solltest du erstmal Wasser aufdrehen.>
		}
		use on <Cafemaschine> {
			if property <Kanne; voll> then {
				msg <|s00Du sch�ttest das Wasser aus der Kanne in die Maschine und stellst sie hin.>
				flag on <Cafemaschine bereit>
				property <Kanne; not voll>
				lose <Kanne> } else {
				msg <|s00Du stellst die leere Kanne wieder in die Maschine.>
				lose <Kanne> }
		}
		use on <Tigertasse> do <tigertasse mit hei�em wasser bef�llen>
		use on <Elektroherd> msg <Lieber nicht, sie k�nnte springen.>
		action <f�ll> {
			if here <Dusche> then {
				if flag <warmes duschwasser> then {
					msg <|s00Du f�llst die Kanne mit dem hei�en Wasser aus der Dusche.>
					property <Kanne; voll mit hei�em wasser> } else {
					if flag <kaltes duschwasser> or flag <kaltes abwaschwasser an> then {
						msg <|s00Du bef�llst die Kanne mit kaltem Wasser.>
						property <Kanne; voll> } else msg <Dazu brauchst du erstmal flie�endes Wasser.> } } else msg <Dazu br�uchtest du zuerst mal Wasser, oder?>
		}
	end define

	define object <Obstkorb>
		alt <Fruchkorb; Korb>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Teller & Tassen>
		alt <teller; tassen; untertasse; untertassen; suppenteller; dessertteller>
		look {
			if flag <tasse aufgenommen> then msg <|s00Jede Menge Teller und Tassen in den verschiedensten Formen und Farben. Nur deine Tigertasse fehlt hier.> else {
				msg <|s00Jede Menge Teller und Tassen in den verschiedensten Formen und Farben. Besonders eine Tasse mit dem Aufdruck eines Tigers sticht dir besonders ins Auge.>
				reveal <Tigertasse> }
		}
		take msg <Wozu?>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Geschirrk�stchen>
	end define

	define object <Besteck>
		alt <gabel; gabeln; messer; l�ffel; messern; l�ffeln>
		look <Ein Sammelsurium von Messern, Gabeln und L�ffeln.>
		take msg <Das w�rde am Ende noch die Handtasche besch�digen.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Geschirrk�stchen>
	end define

	define object <Teesackerl>
		alt <sackerl; tees�ckchen; s�ckchen>
		look <Ein einzelnes Teesackerl "Erk�ltungstee" aus dem Hause "Natur aktiv". Wie das wohl in den K�hlschrank geraten ist?>
		take <Du steckst das Teesackerl ein.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		parent <K�hlschrank>
		use <Kanne> msg <|s00Das w�re zwar m�glich, aber du tust es trotzdem nicht. Es w�re dir einfach lieber, wenn das Tees�ckchen direkt in die Tasse kommt.>
		use on <Kanne> msg <|s00Das w�re zwar m�glich, aber du tust es trotzdem nicht. Es w�re dir einfach lieber, wenn das Tees�ckchen direkt in die Tasse kommt.>
		use on <Tigertasse> {
			if property <Tigertasse; voll mit hei�em wasser> then {
				msg <|s00Du h�ngst das Teesackerl mit dem Erk�ltungstee in die Tasse und beobachtest, wie gr�nliche Farbe als kleine Tentakel daraus hervortritt und das Wasser mehr und mehr einf�rbt. Nach etwas Warten hast du nun fertigen Erk�ltungstee.>
				hide <Teesackerl>
				property <Tigertasse; voll mit Tee>
				property <Tigertasse; not voll mit hei�em wasser> } else msg <Erst sollte da mal hei�es Wasser rein.>
		}
		give to <Tigertasse> {
			if property <Tigertasse; voll mit hei�em wasser> then {
				msg <|s00Du h�ngst das Teesackerl mit dem Erk�ltungstee in die Tasse und beobachtest, wie gr�nliche Farbe als kleine Tentakel daraus hervortritt und das Wasser mehr und mehr einf�rbt. Nach etwas Warten hast du nun fertigen Erk�ltungstee.>
				hide <Teesackerl>
				property <Tigertasse; voll mit Tee>
				property <Tigertasse; not voll mit hei�em wasser> } else msg <Erst sollte da mal hei�es Wasser rein.>
		}
		give to <Kanne> msg <|s00Das w�re zwar m�glich, aber du tust es trotzdem nicht. Es w�re dir einfach lieber, wenn das Tees�ckchen direkt in die Tasse kommt.>
	end define

	define object <Tigertasse>
		alt <tasse; heferl; tee; erk�ltungstee>
		look {
			if property <Tigertasse; voll mit tee> then msg <Die Tigertasse ist jetzt voll mit Erk�ltungstee.> else {
				if property <Tigertasse; voll mit hei�em wasser> then msg <Deine Tigertasse ist im Moment voll mit hei�em Wasser.> else msg <|s00Es ist eine eine deiner Lieblingstassen, die mit einem Tigermotiv. Au�erdem besteht der Henkel aus einem sich schl�ngelndem Tiger.> }
		}
		take {
			msg <|s00Du nimmst die Tigertasse auf.>
			give <Tigertasse>
			flag on <tasse aufgenommen>
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Geschirrk�stchen>
		invisible
		use on <Dusche> {
			if flag <warmes duschwasser> then {
				msg <|s00Du bef�llst die Tasse mit hei�em Wasser aus der Dusche.>
				property <Tigertasse; voll mit hei�em wasser> } else {
				if flag <kaltes duschwasser> then msg <N�, lieber nicht.> else msg <Lieber nicht.> }
		}
		use on <Waschbecken> msg <Zuerst mal brauchst du dazu flie�endes Wasser.>
		use on <Abwasch> if flag <kaltes abwaschwasser an> then msg <N�, lieber nicht.> else msg <Erst mal brauchst du dazu flie�endes Wasser.>
		opened
		list empty <Es ist eine leere Tasse mit einer Darstellung eines Tigers. Den Henkel bildet ebenfalls ein sich schl�ngelnder Tiger.>
		action <f�ll> {
			if property <Kanne; voll mit hei�em wasser> then {
				msg <|s00Du f�llst das hei�e Wasser aus der Kanne in die Tigertasse.>
				property <Kanne; not voll mit hei�em wasser>
				property <Tigertasse; voll mit hei�em wasser> } else {
				if here <Dusche> then {
					if flag <warmes duschwasser> then {
						msg <|s00Du f�llst die Tigertasse mit hei�em Wasser aus der Dusche.>
						property <Tigertasse; voll mit hei�em wasser> } else {
						if flag <kaltes duschwasser> or flag <kaltes abwaschwasser an> then msg <Da kommt nur hei�es Wasser rein, sonst nichts.> else msg <Mit welchem Wasser m�chtest du die Tasse bef�llen?> } } else msg <Dazu solltest du erstmal wo hingehen, wo es auch tats�chlich Wasser gibt.> }
		}
	end define

	define object <Messer>
		alt <Edelstahlmesser; stahlmesser>
		look <Das Edelstahlmesser aus der einzigartigen 24teiligen Serie f�r nur unschlagbare 249,90 Euro!>
		take
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Messerblock>
		invisible
		use on <Holzkeil> do <ben�tze nagelfeile mit holzkeil>
	end define

	define object <Papier>
		alt <blatt; bogen; bl�tter; b�gen; papiere>
		look {
			if flag <papier entnommen> then {
				msg <|s00Es ist der Bogen Papier, den du aus der Eckbank genommen hast. Endlose M�glichkeiten tun sich auf: Papierflieger, Schiffchen, H�te...> } else msg <|s00Da liegt jede Menge Papier in der Bank. Du fragst dich, warum du eigentlich dein Papier in der Eckbank hortest?>
		}
		take {
			msg <|s00Du nimmst dir ein Blatt.>
			give <Papier>
			flag on <papier entnommen>
		}
		displaytype <Object>
		article <it>
		gender <it>
		parent <Eckbank>
		use msg <Wof�r willst du das Papier ben�tzen? Ein Flieger, ein Schiffchen, ein H�tchen?>
		use on <Salz> msg <Hm.. Dann h�ttest du das Salz auf einem Blatt Papier. Es w�re wohl g�nstiger, wenn du das Papier zuerst falten w�rdest...>
		action <falte> {
			msg <|s00Du faltest das Papier und formst ein kleines Briefchen daraus. Das funktioniert erstaunlich gut und schnell. Nur: Wozu brauchst du denn ein kleines Papierbriefchen?>
			hide <Papier>
			show <Briefchen>
			give <Briefchen>
		}
	end define

	define object <Briefchen>
		displaytype <Object>
		article <it>
		gender <it>
		hidden
	end define

	define object <Krimskrams>
		alt <zeugs; sachen; kram; krams; krimskram; zeug>
		look <Jede Menge sinnloses Zeugs, das deswegen in einer K�chenbank landet, weil man nicht wei�, wo man es sonst hingeben sollte.>
		prefix <ein Haufen>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Eckbank>
	end define

end define

define room <Badezimmer>
	look <|s09|nDas Badezimmer ist nicht mehr als ein kleines Hinterzimmer der K�che. Auff�llig ist, dass Waschbecken und die Abwasch direkt nebeneinander ihr Dasein fristen. Au�erdem freust du dich jedesmal wieder �ber den neuen Duschvorhang, wenn du das Bad betrittst. Es stehen einige deiner Waschutensilien, Cremchen undsoweiter herum, ansonsten wenig Au�ergew�hnliches.|s00>
	north <K�che>

	define object <Dusche>
		alt <wasser; wasserhahn; hahn; duschkopf>
		look {
			if flag <warmes duschwasser> then msg <Warmes Wasser flie�t aus dem Duschkopf deiner Dusche.> else {
				if flag <kaltes duschwasser> then msg <Kaltes Wasser flie�t aus dem Duschkopf deiner alten Dusche.> else msg <Sie scheint funktionsf�hig.> }
		}
		prefix <die>
		displaytype <Object>
		article <it>
		gender <it>
		properties <dreh auf; dreh ab>
		action <dreh auf> choose <Duschwasser>
		action <dreh ab> {
			if flag <warmes duschwasser> or flag <kaltes duschwasser> then {
				msg <|s00Du drehst das Wasser wieder ab. Sehr sparsam  - sehr l�blich.>
				flag off <warmes duschwasser>
				flag off <kaltes duschwasser> } else msg <Wenn kein Wasser aufgedreht ist, kann man auch kein Wasser aufdrehen. (Und sowas geht studieren..)>
		}
		action <schalt ein> choose <Duschwasser>
		action <schalt aus> {
			if flag <warmes duschwasser> or flag <kaltes duschwasser> then {
				msg <|s00Du drehst das Wasser wieder ab - sehr ressourcenbewusst, sehr l�blich.>
				flag off <warmes duschwasser>
				flag off <kaltes duschwasser> } else msg <Du hast doch das Wasser noch garnicht aufgedreht.>
		}
	end define

	define object <Waschbecken>
		alt <wasser; wasserhahn; hahn>
		look <Ideal Standard. Ein �lteres Modell. Der St�psel fehlt. Das ist irgendsoeine Logiksache>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		properties <dreh  auf = Da kommt kein Wasser. Seltsam.; dreh auf; dreh ab; schalt ein = Da kommt nichts. Seltsam.; schalt aus = Wo kein Wasser l�uft, kann man dessen Lauf auch nicht stoppen.>
	end define

	define object <Abwasch>
		alt <wasser; wasserhahn; hahn>
		look if flag <kaltes abwaschwasser an> then msg <Eine alte, tiefe Abwasch mit zwei Becken. Sie sind ziemlich verschmutzt, haben den Teint einer h�ufig gebrauchten Porzellanteekanne. Du hast kaltes Wasser aufgedreht, das gerade sinnlos in den Abfluss pl�tschert.> else msg <Eine alte, tiefe Abwasch mit zwei Becken. Sie sind ziemlich verschmutzt, haben den Teint einer h�ufig gebrauchten Porzellanteekanne.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		action <dreh auf> choose <Abwaschwasser>
		action <dreh ab> {
			if flag <kaltes abwaschwasser an> then {
				flag off <kaltes abwaschwasser an>
				msg <Du drehst das Wasser wieder ab. Sehr vern�nftig.> } else msg <Wenn kein Wasser l�uft, dann kannst du es auch nicht abdrehen. Irgendwie logisch.>
		}
		action <schalt aus> {
			if flag <kaltes abwaschwasser an> then {
				flag off <kaltes abwaschwasser an>
				msg <Du drehst das Wasser wieder ab. Sehr vern�nftig.> } else msg <Wenn kein Wasser l�uft, dann kannst du es auch nicht abdrehen. Irgendwie logisch.>
		}
		action <schalt ein> choose <Abwaschwasser>
	end define

	define object <Abwaschkasterl>
		alt <Abwaschkasten; Abwaschk�stchen; kasterl; kasten; k�stchen>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Du �ffnest die Fl�gelt�ren des Abwaschkasterls.>
		close <Du schlie�t das Kasterl wieder.>
		add
		remove
		list empty <Das K�stchen ist jetzt leer.>
		list closed <Unter der Abwasch befindet sich ein K�stchen mit zwei Fl�gelt�ren.>
	end define

	define object <W�rmflasche>
		look {
			if property <W�rmflasche; leer> then msg <Deine W�rmflasche ist in einer wei�en, pelzigen Stoffh�lle. Im Moment ist sie nicht bef�llt.> else {
				if property <W�rmflasche; voll> then msg <Sie ist jetzt bef�llt und warm.> }
		}
		take <Du steckst die W�rmflasche ein.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Abwaschkasterl>
		use msg <Du schiebst die W�rmflasche f�r einen Moment unter deinen Pullover und f�hlst die W�rme auf deinem B�uchlein. Ein recht behagliches Gef�hl.>
		use on <Dusche> {
			if flag <warmes duschwasser> then {
				if property <W�rmflasche; voll> then msg <Sie ist doch schon voll!> else {
					msg <|s00Du f�llst die W�rmflasche mit dem hei�en Wasser aus der Dusche. Jetzt hast du eine pudelwarme W�rmflasche.>
					property <W�rmflasche; not leer>
					property <W�rmflasche; voll> } } else {
				if flag <kaltes duschwasser> then msg <Eine W�RMflasche mit KALTEM Wasser zu f�llen erscheint irgendwie wenig sinnvoll, oder?> else msg <Dazu brauchst du zuerst mal sch�n warmes Wasser.> }
		}
		use on <Hundek�rbchen> {
			msg <|s00Du legst die W�rmflasche in das Hundek�rbchen.>
			hide <W�rmflasche>
			flag on <W�rmflasche im Hundek�rbchen>
		}
		use on <Abwasch> if flag <kaltes abwaschwasser an> then msg <Und wieso m�chtest du KALTES Wasser in eine W�RMflasche geben?> else msg <So ein F�llvorgang kann ohne Wasser schon ziemlich lange dauern..>
		use on <Waschbecken> msg <Du brauchst erstmal flie�endes Wasser.>
		give to <Hundek�rbchen> {
			msg <|s00Du legst die W�rmflasche in das Hundek�rbchen.>
			hide <W�rmflasche>
			flag on <W�rmflasche im Hundek�rbchen>
		}
		properties <leer; f�ll>
		action <f�ll> 
	end define

	define object <Badezimmerschr�nkchen>
		alt <Badezimmerschrank; Schr�nkchen; Schrank>
		look <Es ist ein bideres Badezimmerschr�nkchen mit einem Glast�rchen und zwei Laden.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		transparent
		open <Du �ffnest die Glast�re des Badezimmerschr�nkchens.>
		close <Du schlie�t die Glast�r des Badezimmerschr�nkchens wieder.>
		add
		remove
		list empty <Der Schrank ist leer.>
	end define

	define object <obere Lade>
		alt <lade>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <untere Lade>
		alt <lade>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Badezimmerspiegel>
		alias <Spiegel>
		look <Dein Badezimmerspiegel zeigt dir das Bild eines wundersch�nen, bettelarmen Studentenaschenputtels.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Cremchen>
		alt <Reinigungsmilch; Gesichtswasser; Waschgel; Peeling; Utensilien; waschutensilien>
		look <Die t�glich� Chemie einer Frau: Reinigungsmilch (mit Alantonin), Gesichtswasser (mit Fruchs�ure - verfeinert die Poren), mild sch�umendes Waschgel (-zarte Gesichtspflege f�r jeden Hauttyp, pH-neutral), tiefenreinigendes Peeling (mit kl�render Minze und Joghurt-Extrakt - antibakterielles Wirksystem) und Lavendelseife. Daneben steht ein Linsenbeh�lter.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Lavendelseife>
		alt <fl�ssigseife; seife>
		look {
			msg <|s00Fl�ssigseife mit Lavendelgeruch.>
			reveal <Lavendelseife>
		}
		take {
			msg <|s00Du nimmst die Lavendelseife einfach mal mit, wer wei� wozu man sie noch brauchen kann.>
			reveal <Lavendelseife>
			give <Lavendelseife>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Duschvorhang>
		look <Duschvorhang PISSE, das wei�e Duschwunder. 100 Prozent wasserabweisendes, leichtes und stabiles Gewebe. Und das um nur 2,50 Euro!>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Linsenbeh�lter>
		take msg <Das willst du nicht mitnehmen.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		open <Du schraubst den Kontaktlinsenbeh�lter auf.>
		close <Du schraubst den Kontaktlinsenbeh�lter wieder zu.>
		remove
		list empty <Er ist leer.>
		list closed {
			msg <|s00Es ist ein Kontaktlinsenbeh�lter.>
			reveal <Linsenbeh�lter>
		}
	end define

	define object <Kontaktlinse>
		alt <Linse>
		look <Es ist eine rechte, handels�bliche Kontaktlinse von Hartlauer.>
		take <Wer wei�, ob man eine rechte Kontaktlinse nicht noch brauchen kann? Man sollte es jedenfalls nicht kategorisch ausschlie�en.>
		prefix <eine rechte>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Linsenbeh�lter>
	end define

end define

define room <Wohnzimmer>
	west <Vorzimmer>

	define object <Polster>
		look <Es ist ein etwas zerschlissener Polster mit einem aufgedruckten Blumenmuster.>
		take <Du steckst den Polster ein.>
		displaytype <Object>
		article <it>
		gender <it>
		use msg <Du �berlegst, ob du kurz einfach dein Gesicht in den Polster legen sollst. Aber dann denkst du: Warum eigentlich?>
		use <Hundek�rbchen> {
			msg <|s00Du legst den Polster in das Hundek�rbchen. Jetzt sieht es schon richtig gem�tlich aus.>
			flag on <Polster im Hundek�rbchen>
			hide <Polster>
		}
		use on <Hundek�rbchen> {
			msg <|s00Du legst den Polster in das Hundek�rbchen. Jetzt sieht es schon richtig gem�tlich aus.>
			flag on <Polster im Hundek�rbchen>
			hide <Polster>
		}
		use on anything msg <Du legst den Polster kurz darauf, h�lst kurz inne und denkst "Wow!". Dann nimmst du den Polster wieder und alles ist wieder, wie es vorher war.>
		give <Hundek�rbchen> {
			msg <|s00Du legst den Polster in das Hundek�rbchen. Jetzt sieht es schon richtig gem�tlich aus.>
			flag on <Polster im Hundek�rbchen>
			hide <Polster>
		}
		give to <Hundek�rbchen> {
			msg <|s00Du legst den Polster in das Hundek�rbchen. Jetzt sieht es schon richtig gem�tlich aus.>
			flag on <Polster im Hundek�rbchen>
			hide <Polster>
		}
	end define

end define

define procedure <start>
	msg <|s18Es war einmal vor langer, langer Zeit...|s00>
	pause <6000>
	msg <|s18in einem fernen, fernen Land in einem bitterkalten Bettchen...|s00>
	pause <6000>
	msg <|s18in den Morgenstunden eines grausigen, feuchtkalten Herbsttages...|s00>
	pause <6000>
	msg <|s18da w�lzte sich ein kleines, bettelarmes Studentenm�dchen unruhig in ihrem seichten Schlaf hin und her...|s00>
	pause <6000>
	msg <|s18und tr�umte von �ppig gef�llten K�hlschr�nken...|s00>
	pause <4000>
	msg <|s18von funktionierenden Heizungen...|s00>
	pause <4000>
	msg <|s18von dem Tag, an dem ihre Diplomarbeit abgeschlossen sein und ihr so entbehrungsreiche Studentendasein endlich ein Ende haben w�rde.|s00>
	pause <6000>
	msg <|s18Mit einem Wort: Die bettelarme Coco tr�umte von besseren Zeiten.|s00>
	pause <6000>
	msg <|s18Und im Traum klagte sie...|s00>
	pause <4000>
	msg <|s18und weinte sie bitterlich...|s00>
	pause <4000>
	msg <|s18und sie rief verzweifelt um Hilfe...|s00>
	pause <4000>
	msg <|s18doch ihre Rufe verhallten scheinbar ungeh�rt im Nirgendwo...|s00>
	pause <6000>
	msg <|s18w�hrend von drau�en dieser grausige, feuchtkalte Herbstmorgen...|s00>
	pause <6000>
	msg <|s18unbarmherzig den Weg durch die Ritzen in den Fensterscheiben in ihre unwirtliche Studentenbude fand...|s00>
	pause <6000>
	msg <|s18und irgendwo wie jeden Morgen eine Turmuhr gewissenhaft die Morgenstunden abschlug.|s00>
	pause <10000>
	msg <|s18Doch pl�tzlich schrickt sie hoch.|s00>
	pause <6000>
	msg <|s18Eine Stimme...|s00>
	pause <4000>
	msg <|s18ganz nah...|s00>
	pause <4000>
	msg <|s18irgendwo...|s00>
	pause <4000>
	msg <|s18War es im Traum oder in Wirklichkeit gewesen?|s00>
	pause <6000>
	msg <|s18War es ihre eigene...|s00>
	pause <4000>
	msg <|s18oder etwa die eines Fremden gewesen?|s00>
	pause <10000>
	msg <|s18|nIn diesem Moment ahnte die bettelarme Studentin noch nicht, dass soeben ein ganz besonderer Tag begonnen hatte, der mit einem Schlag alles �ndern sollte...|s00>
	pause <10000>
	msg <|jc|cr|s36|n|nDer zwanzigste Oktober|s00|n|jl|n|n|cb|n>
	pause <10000>
end define

define procedure <ben�tze nagelfeile mit holzkeil>
	if property <Fenster; verriegelt> then {
		msg <|s00Du stocherst einige male mit dem Edelstahlmesser an dem Holzkeil herum bis dieser zu Boden f�llt. Leider bricht dir dabei das Messer ab. Aber immerhin sollte sich jetzt das Fenster �ffnen lassen.>
		property <Fenster; not verriegelt>
		hide <Messer> }
end define

define procedure <stimme h�ren sehen f�hlen>
	msg <Scherzkeks, eine Stimme kann man weder suchen noch ansehen noch sonstwas - sondern ausschlie�lich h�ren. Daf�r m��te sie aber erstmal da sein.>
end define

define procedure <radiotext>
	speak <Dear Coco. I wish you all the best for your birthday, and I hope that your days will be filled with love and success until their end, from which we all hope that it still might be very, very far away. Happy birthday!>
end define

define procedure <ben�tze nagelfeile mit kasette>
	msg <|s00Mit Hilfe der Nagelfeile ziehst du dir das Tonband aus der Kasette.>
	show <Tonband>
	give <Tonband>
	hide <Kasette>
end define

define procedure <tigertasse mit hei�em wasser bef�llen>
	if property <Kanne; voll mit hei�em wasser> then {
		msg <|s00Vorsichtig, ohne dich dabei zu verbrennen, leerst du das hei�e Wasser in die Tigertasse.>
		property <Kanne; not voll mit hei�em wasser>
		property <Tigertasse; voll mit hei�em wasser> } else {
		if property <Kanne; voll> then msg <Warum kaltes Wasser in eine Tasse leeren?> else msg <Die Kanne ist leer, was willst du denn da in die Tasse leeren?> }
end define

define procedure <tigertasse an fe geben>
	if property <Tigertasse; voll mit tee> then {
		msg <|s00Du gibst ihr die Tasse mit Tee. Genussvoll trinkt sie aus und sieht gleich viel besser aus.>
		flag off <fe-r�tsel 2>
		flag on <fe-r�tsel 3>
		hide <Tigertasse> } else {
		if property <Tigertasse; voll mit hei�em wasser> then msg <Soll ich einfach hei�es Wasser trinken oder was?> else msg <Sie will deine Tasse nicht.> }
end define

define timer <gute Fe>
	interval <60>
	action {
		msg <Du h�lst kurz inne. War das gerade wieder diese zittrige Stimme, die dich aufgeweckt hat? Hat sie gerade "Coco" gerufen?|n>
		timeroff <gute Fe>
		timeron <gute Fe2>
	}
	enabled
end define

define timer <gute Fe2>
	interval <80>
	action {
		msg <|s00"Coco, Coco.. Mach endlich auf!"|n>
		timeroff <gute Fe2>
		timeron <gute Fe3>
	}
	disabled
end define

define timer <gute Fe3>
	interval <80>
	action {
		msg <|s00"Jetzt la� mich endlich rein!"|n>
		timeroff <gute Fe3>
		timeron <gute Fe4>
	}
	disabled
end define

define timer <gute Fe4>
	interval <80>
	action msg <|s00"Ich frier mir hier drau�en noch meine Locken ab!"|n>
	disabled
end define

define timer <fenster offen - sturm>
	interval <30>
	action {
		msg <|s00Hhhhhuuuuu... Eine  Windb�e kommt durchs offene Fenster, erwischt dich und haut dich fast um. Noch nie hast du einen so starken Sturm erlebt!>
		timeroff <fenster offen - sturm>
		timeron <fenster offen - sturm>
	}
	disabled
end define

define selection <Abwaschwasser>
	info <Welches Wasser willst du haben?>
	choice <Warm> msg <Geht nicht. Warum auch immer.>
	choice <Kalt> {
		if flag <kaltes abwaschwasser an> then msg <Das Wasser l�uft bereits.> else {
			msg <|s00Du drehst kaltes Wasser auf.>
			flag on <kaltes abwaschwasser an> }
	}
end define
define selection <Duschwasser>
	info <Welches Wasser willst du haben?>
	choice <Warm> {
		if flag <warmes duschwasser> then msg <Das Wasser l�uft bereits.> else {
			msg <|s00Du drehst erfolgreich warmes Wasser auf.>
			flag on <warmes Duschwasser> }
	}
	choice <Kalt> {
		if flag <kaltes duschwasser> then msg <Das Wasser l�uft bereits.> else {
			msg <|s00Du drehst kaltes Wasser auf.>
			flag on <kaltes Duschwasser> }
	}
end define
define selection <Fe-R�tsel 2 Dialog>
	info <Hallo..>
	choice <Wer bist du?> {
		msg <|s00Ich bin deine gute Fe. Alles Gute zum Geburtstag! Ich bin gekommen um dir zu helfen. Nur leider ging so ziemlich alles schief, was schief gehen kann... Zuerst hab ich alle meine wertvollen Sachen verloren und dann hab ich mich noch verbimmelt.. Bin stundenlang durch die K�lte gewandert, bis ich endlich dein Fenster gefunden habe. Und dann machst du mir noch nichtmal auf... Mann, tut mir mein Hals weh. Du hast nicht zuf�llig irgendwas?>
		wait <(Taste dr�cken um fortzufahren)>
		choose <Fe-R�tsel 2 Dialog>
	}
	choice <Wie geht es dir?> {
		msg <|s00Mein Hals tut entsetzlich weh.. Du hast nicht zuf�llig irgendetwas, was da helfen k�nnte?>
		wait <(Taste dr�cken um fortzufahren)>
		choose <Fe-R�tsel 2 Dialog>
	}
	choice <Wie bist du hier hergekommen?> {
		msg <|s00  - Na ich hab mich hergebimmelt, wie sonst!?|nSie macht noch einen etwas verwirrten Eindruck...>
		wait <(Taste dr�cken um fortzufahren)>
		choose <Fe-R�tsel 2 Dialog>
	}
	choice <Was machst du um Himmels Willen bei dieser Eisesk�lte da drau�en?!> {
		msg <|s00Na zu dir kommen! Und mich so richtig erk�lten.. Mann, tut mir mein Hals weh!>
		wait <(Taste dr�cken um fortzufahren)>
		choose <Fe-R�tsel 2 Dialog>
	}
	choice <Deine Locken sind etwas durcheinander...> {
		msg <|s00Wenn du w�sstest, wieviel Arbeit die sind.. Und dann - eine Runde bimmeln und schon ist wieder alles beim Teufel, es ist immer dasselbe! Aber bei diesem Sturm w�rde ja nicht einmal mehr ein 3Wetter-Taft helfen..>
		wait <(Taste dr�cken um fortzufahren)>
		choose <Fe-R�tsel 2 Dialog>
	}
	choice <Ich geh dann mal...> msg <Wenn du mir mit meinem Hals hilfst, helfe ich dir auch.. Ich kenne dein Dipolomarbeitsproblem genau...>
end define
