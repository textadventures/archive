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
		give <Noch nicht verfügbar.>
		flag on <Fe-Rätsel 1>
	}
	command <handtasche> exec <inventory>
	command <raum> exec <l; normal>
	verb <hör> msg <You can't hör that.>
	verb <fühl> msg <You can't fühl that.>
	verb <such> msg <You can't such that.>
	verb <schalt ein> msg <You can't schalt ein that.>
	verb <schalt aus> msg <You can't schalt aus that.>
	verb <zieh> msg <You can't zieh that.>
	verb <drück> msg <You can't drück that.>
	verb <durchsuche> msg <You can't durchsuche that.>
	verb <riech> msg <You can't riech that.>
	verb <untersuche> msg <You can't untersuche that.>
	verb <füll> msg <You can't füll that.>
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
	öffne; mach auf; mache auf; sperr auf ; sperre auf ; schließ auf ; schließe auf = open
	schließe ; mach zu ; mache zu = close
	nimm ; heb auf ; hebe auf = take
	benütze ; nütze ; verwende = use
	höre; horch; hör zu; höre zu; horche; horche hin; horch hin; horch zu; horche zu; hör hin; höre hin = hör
	fühle = fühl
	suche = such
	schalte ein; dreh auf; drehe auf; schalt auf; schalte auf = schalt ein
	schalte aus; dreh aus; drehe aus; dreh ab; drehe ab; schalte ab; schalt ab; mach aus; mache aus; mach ab; mache ab = schalt aus
	ziehe = zieh
	drücke ; press ; presse ; schieb ; schiebe = drück
	durchsuch ; untersuche ; untersuch ; erforsche ; forsche ; erforsch ; forsch ; durchwühl ; durchwühle = durchsuche
	drehe auf; drehe an; schalte auf; schalt auf; schalt ein; schalte ein; mach ein; mache ein = dreh auf
	drehe ab ; dreh ab ; drehe aus ; dreh aus ; schalte aus ; schalt aus ; schalt ab ; schalte ab ; mach ab ; mache ab ; mach aus ; mache aus = dreh ab
	süden = south
	gehe nach ; gehe zu ; geh nach ; geh zu = go to
	rieche; schnupper; schnuppere; schnüffel; schnüffle = riech
	sprich mit = speak
	sprich ; red ; rede = speak
	gib = give
	fülle; befülle; befüll = füll
end define

define room <Schlafzimmer>
	prefix <Cocos>
	look <|nEs ist spärlich eingerichtet, besteht lediglich aus einem Bett, einem Nachtkästchen und einem großen Kleiderschrank. Auf der altmodischen Tapete sind Wasserflecken zu sehen. An der Wand hängt ein seltsamer Spiegel und am Boden liegt ein Teppich mit einigen Flecken drauf - woher die wohl stammen? Türe und Fenster sind verschlossen und in einer Ecke fällt dir ein Hundekörbchen auf.>
	south locked <Vorzimmer; Die Tür ist zu.>

	define object <Bett>
		look <Es ist ein Stahlgerüst im IKEA-Jugendstil. Darauf liegen zwei hauchdünne Matrazen und einige Decken.>
		prefix <ein>
		displaytype <Object>
		article <Es>
		gender <Es>
		properties <untersuche = Eine genauere Untersuchung bestätigt: Es ist ein Stahlgerüst im IKEA-Jugendstil. Darauf liegen zwei hauchdünne Matrazen und einige Decken.>
	end define

	define object <Nachtkästchen>
		alt <Nachtkasterl; kasterl; kästchen; schublade; lade; nachtkästchenlade; nachtkasterllade>
		look <Es ist ein altes Nachtkästchen aus Holz.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open {
			if property <Nachtkästchen; geschlossen> then {
				msg <|s00Erwartungsvoll öffnest du die Schublade deines Nachtkästchens. Was da wohl drinnen ist?>
				property <Nachtkästchen; not geschlossen>
				property <Nachtkästchen; geöffnet>
				open <Nachtkästchen> } else msg <Die Lade ist schon offen.>
		}
		close {
			if property <Nachtkästchen; geöffnet> then {
				msg <|s00Ordungsliebend wie du bist schließt du die Schublade auch wieder.>
				property <Nachtkästchen; not geöffnet>
				property <Nachtkästchen; geschlossen>
				close <Nachtkästchen> } else msg <Sie ist schon geschlossen und bewegt sich keinen Centimeter.>
		}
		add msg <Du legst folgenden Gegenstand in die Schublade: #quest.lastobject#.>
		remove
		list empty <Die Lade ist leer.>
		list closed <Die Schublade ist im Moment geschlossen.>
		properties <geschlossen>
		action <zieh> exec <öffne nachtkästchen>
		action <drück> exec <schließe nachtkästchen>
	end define

	define object <Kleiderschrank>
		alt <schrank; kasten>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Das Knarzen des antiken Holzes während du ihn öffnest vermittelt eine gruselige Atmosphäre.>
		close <Es knarzt und quietscht, als du die Türe wieder schließt.>
		list empty <Trägerleibchen lang, sortiert in erster Instanz nach Größe, in zweiter Instanz nach Farbe und in dritter Instanz alphabethisch nach dem Ort des Kaufs. Ebenso die Trägerleibchen kurz, normale Leibchen lang, normale Leibchen kurz, langärmlige Leibchen lang, langärmlige Leibchen kurz undsoweiter.. Ähnlich penibel sortiert die Stöße der Hosen, der Pullover, der Blusen, der Blazer, der Röcke, der Kleider, der Jacken, der Anzüge, der Strümpfe, der Socken und der Unterhöschen. Daneben ein Fach mit Kleidungsstücken, die sich nicht einordnen lassen (unter anderem ein mexikanischer Poncho, ein israelischer Talah und ein kongolesischer Lendenschurz. Und als du also deine Blicke so über deine Sammlung schweifen lässt fällt dir auf, dass du dringend neue Kleider brauchst.>
		list closed <Es ist großer, hölzerner ehrwürdiger Kleiderschrank.>
	end define

	define object <Spiegel>
		look <Er zeigt das Bild eines bildhübschen Mädchens.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Er>
	end define

	define object <Teppich>
		look if flag <gute fe am boden> then msg <|s00Am Boden liegt ein alter Teppich mit merkwürdigen Flecken - woher die wohl stammen? Ein kleines lockiges Etwas liegt darauf und zittert und hustet.> else msg <|s00Auf dem Boden liegt ein alter Teppich mit sehr merkwürdigen Flecken - woher die wohl stammen?>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Er>
		properties <untersuche = Ein strohiger alter Teppich, etwas ausgefranst an den Seiten. Nichts weiter ungewöhnliches, wenn da nicht dieser Fleck wäre, der verdammt wie ein Urinfleck aussieht.>
	end define

	define object <Tür>
		alt <türe; ausgang>
		look {
			if got <Handtasche> then {
				if property <Tür; geschlossen> then msg <Eine weißgestrichene Türe, an der an einigen Stellen der Lack abbröckelt. Sie ist zu.> else msg <Eine weißgestrichene Türe, an der an einigen Stellen der Lack abbröckelt. Sie ist offen.> } else {
				if property <Tür; geschlossen> then {
					msg <|s00Eine weißgestrichene Türe, an der an einigen Stellen der Lack abbröckelt. Sie ist zu. Deine Handtasche hängt darüber.>
					reveal <Handtasche> } else msg <Eine weißgestrichene Türe, an der an einigen Stellen der Lack abbröckelt. Sie ist offen.> }
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <Sie>
		container
		open {
			if property <Tür; geschlossen> then {
				if got <Zimmerschlüssel> then {
					msg <|s00Mit dem kleinen Schlüssel öffnest du die Türe.>
					property <Tür; not geschlossen>
					property <Tür; geöffnet>
					open <Tür>
					unlock <Schlafzimmer; south> } else msg <Hm, versperrt. Ohne Zimmerschlüssel wirds verdammt schwer da rauszukommen.> } else msg <Die Türe ist schon offen.>
		}
		close {
			if property <Tür; geschlossen> then msg <Die Türe ist schon zu.> else {
				msg <|s00Du schließt die Türe.>
				property <Tür; not geöffnet>
				property <Tür; geschlossen>
				close <Tür>
				lock <Schlafzimmer; south> }
		}
		properties <geschlossen>
	end define

	define object <Fenster>
		look if property <Fenster; geschlossen> then msg <|s00Das Fenster ist zwar sehr dünn und alles andere als dicht, aber immerhin zu. Draußen herrscht ein grausiger Sturm.> else msg <|s00Das Fenster ist offen und immer wieder hämmert der Wind seine Flügel kraftvoll gegen die Wände. Selten hast du so einen grausigen Sturm erlebt.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <Es>
		container
		open {
			if property <Fenster; verriegelt> then {
				msg <|s00Du zerrst an den Riegeln doch das Fenster öffnet sich nicht. Du wunderst dich etwas, doch dann fällt dir ein kleiner Holzkeil auf, der unten im Rahmen klemmt.>
				reveal <Holzkeil> } else {
				if property <Fenster; geschlossen> then {
					property <Fenster; not geschlossen>
					property <Fenster; geöffnet>
					msg <|s00Du drehst die beiden Riegel und sofort drückt dir der Wind die Flügel entgegen. Mit viel Geschick weichst du ihnen aus - das ging gerade noch einmal gut.>
					open <Fenster>
					if here <gute Fe> and property <Fenster; geöffnet> then msg <|s00Ein dünnes Stimmchen zischelt: "Bitte schnell wieder zumachen...!"> else {
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
			if property <Fenster; geöffnet> then {
				property <Fenster; not geöffnet>
				property <Fenster; geschlossen>
				msg <Unter größter Anstrengung schließt du das Fenster und augenblicklich kehrt wieder Stille ein.>
				close <Fenster>
				timeroff <fenster offen - sturm> } else msg <Es ist doch noch immer zu.>
		}
		properties <geschlossen; verriegelt>
		action <öffne> {
			if property <Fenster; geschlossen> then {
				property <Fenster; geöffnet>
				msg <Du öffnest das Fenster.> } else msg <Das Fenster ist bereits offen.>
		}
	end define

	define object <Holzkeil>
		alt <keil; holz>
		look if property <Fenster; verriegelt> then msg <Ein kleiner Holzkeil steckt unten im Rahmen und verhindert, dass der Wind das Fenster aufdrückt.> else msg <Es ist ein kleiner Holzkeil. Man weiß nie, wozu man ihn noch brauchen kann.>
		take {
			if property <Fenster; verriegelt> then msg <|s00Du versuchst den Keil herauszuziehen doch er klemmt fest.> else {
				if flag <inventar an> then {
					msg <|s00Du hebst den Keil auf und steckst ihn in deine Handtasche.>
					give <Holzkeil> } else {
					msg <|s00Du hebst ihn auf, überlegst kurz, wo du ihn hinstecken sollst und legst ihn dann auf die Ablage.>
					add <Holzkeil; Ablage> } }
		}
		prefix <ein kleiner>
		displaytype <Object>
		article <it>
		gender <Er>
		invisible
	end define

	define object <Handtasche>
		look <Der Kernbestandteil weiblicher Identität. Kann man sich eine Frau ohne ihre Handtasche überhaupt vorstellen?>
		take {
			msg <|s00Du nimmst die Handtasche auf, darin findest du auch eine Nagelfeile und einen kleinen Schlüssel.|nDu kannst ab jetzt auch andere Dinge einsammeln und mitnehmen.|nMit dem Befehl "Handtasche" kannst du ab sofort jederzeit deine Inventarliste abrufen.>
			give <Handtasche>
			show <Nagelfeile>
			give <Nagelfeile>
			hide <Handtasche>
			flag on <Inventar an>
			hide <Noch nicht verfügbar.>
			show <Zimmerschlüssel>
			give <Zimmerschlüssel>
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
		use msg <|s00Du nimmst dir kurz Zeit und führst kleinere kosmetische Korrekturarbeiten an deinen Fingernägeln durch. Sofort fühlst du dich etwas besser.>
		use on <Teppich> msg <Und wo willst damit anfangen?>
		use on <fleck> {
			msg <|s00Sorgfältig schabst du den Urinsalzrand ab. Gut gemacht. Doch was nun? Du kannst ja nicht einfach das Salz in deiner Handtasche verstreuen.>
			show <Salz>
			property <fleck; not mit salzrand>
		}
	end define

	define object <Noch nicht verfügbar.>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Schlafzimmerboden>
		alias <Boden>
		alt <grund; hinunter; unten; boden>
		look <Ein alter, völlig zerfuchter Holzboden bildet den Grund. Darauf liegt ein ausgefranster Teppich voller Flecken.>
		prefix <der>
		displaytype <Object>
		article <it>
		gender <Er>
		invisible
	end define

	define object <stimme>
		look do <stimme hören sehen fühlen>
		speak <Du möchtest also eine Stimma ansprechen.. Such dir lieber zuerst mal, wem diese Stimme gehört! (Vielleicht möchtest du ja nachher garnicht mehr mit ihr sprechen...)>
		displaytype <Object>
		article <it>
		gender <Sie>
		invisible
		properties <such; fühl = Ein sehr esoterischer Ansatz. Toller Einfall, zugegeben, aber wenig zielführend.; hör = Du strengst dich an, aber im Moment kannst du nichts hören.>
		action <fühl> do <stimme hören sehen fühlen>
		action <such> do <stimme hören sehen fühlen>
	end define

	define object <Radio>
		alt <kasettenradio; deck; kasettendeck>
		take msg <Es ist einfach zu schwer. Und zu sinnlos. Lieber nicht.>
		prefix <ein altes>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Nachtkästchen>
		container
		open <Du drückst den Stoppknopf und öffnest das Kasettendeck.>
		close
		list closed if got <Antenne> then msg <Es ist ein altes Kasettenradio. Vielleicht ist ja noch eine Kasette drinnen?> else msg <Es ist ein altes Kasettenradio. Vielleicht ist ja noch eine Kasette drinnen. Außerdem ist die Antenne abgebrochen, unter Umständen liegt die auch noch irgendwo herum.>
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
		look <"Das Liebeskraut" aus der Bibi & Tina Serie. Hast du das wirklich angehört? An der Seite scheint sie einen kleinen Sprung zu haben, als ob irgendjemand versucht hätte sie aufzubrechen.>
		take {
			if flag <inventar an> then {
				if here <Radio> then {
					msg <|s00Du willst gerade die Kasette herausziehen, da fällt dir das Radio hinunter. Irgendwie sieht es nicht mehr besonders funktionstüchtig aus. Du beschließt es einfach unters Bett zu schieben - aus den Augen, aus dem Spiel.>
					remove <Kasette>
					remove <Radio>
					hide <Radio>
					give <Kasette> } else {
					msg <|s00Du nimmst die Kasette aus der Lade und steckst sie in deine Handtasche.>
					remove <Kasette>
					give <Kasette> } } else {
				if here <Radio> then {
					msg <|s00Du willst gerade die Kasette herausziehen, da fällt dir das Radio hinunter. Irgendwie sieht es nicht mehr besonders funktionstüchtig aus. Du beschließt es einfach unters Bett zu schieben - aus den Augen, aus dem Spiel.|nDa du nicht weißt, wohin du die Kasette geben sollst, legst du es einfach wieder in die Lade.>
					remove <Radio>
					remove <Kasette>
					hide <Radio>
					open <Nachtkästchen>
					show <Tonband>
					add <Kasette; Nachtkästchen> } else msg <Da du keine passende Tasche hast, wo du sie hingeben könntest, lässt du sie erstmal in der Lade liegen.> }
		}
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Radio>
		use <Nagelfeile> do <benütze nagelfeile mit kasette>
		use on <Nagelfeile> do <benütze nagelfeile mit kasette>
		use on anything msg <|s00Die einzig sinnvolle Art eine Kasette zu benützen, ist mit einem passenden Abspielgerät. Und das hast du gerade zertrümmert.>
		container
		open msg <Mit deinen bloßen Damenfingern schaffst du das einfach nicht.>
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
		alt <matraze; matratze; matratzen; maträzchen; maträtzchen>
		look <Auf dem Bett liegen zwei hauchdünne, viel zu kurze Maträzchen. Keinn Wunder, dass du du so schlecht geschlafen hast.>
		prefix <zwei>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <durchsuche>
		action <durchsuche> {
			if flag <antenne entnommen> then msg <Hm, zwei Matrazen. Nicht mehr.> else {
				if flag <inventar an> then {
					msg <|s00Hey, zwischen den beiden Matrazen steckt eine alte Antenne. Vermutlich gehörte die mal zu einem Radio. Du steckst sie vorsichtshalber mal ein.>
					show <Antenne>
					give <Antenne>
					flag on <antenne entnommen> } else {
					msg <|s00Hey, zwischen den beiden Matrazen steckt eine alte Antenne! Vermutlich gehörte die mal zu einem Radio. Leider weißt du nicht, wo du sie hingeben sollst und legst sie einfach mal in das Nachtkästchen.>
					show <Antenne>
					open <Nachtkästchen>
					add <Antenne; Nachtkästchen>
					flag on <antenne entnommen>
					property <Nachtkästchen; not geschlossen>
					property <Nachtkästchen; geöffnet> } }
		}
	end define

	define object <gute Fe>
		alt <fee; wesen; seltsames wesen; kleines wesen; etwas; kleines etwas; lockiges etwas; kleines, lockiges etwas; stimme; stimmchen>
		look {
			if flag <gute fe am boden> then msg <Ein kleines, lockiges Feenwesen liegt am Boden und zittert und hustet.> else {
				if flag <fe-rätsel 1> then msg <Eine kleine, lockige Fe. Sie zittert und bibbert und hüstelt und röchelt. Offenbar ist die ärmste schwer erkältet.> }
		}
		take {
			if flag <fe im hundekörbchen> then msg <Besser sie bleibt erstmal in ihrem Bettchen und ruht sich aus.> else {
				msg <|s00Du steckst die gute Fe in deine Handtasche und nimmst sie erstmal mit. Du solltest aber dringend ein besseres (=wärmeres) Plätzchen für sie finden.>
				flag off <gute fe am boden>
				give <gute Fe> }
		}
		speak {
			if flag <fe-rätsel 1> then msg <-Wer bist du?|n-Die gute Fe..|nMehr bringt sie vor lauter Zittern und Röcheln und Zähneklappern nicht hervor. Die ärmste scheint sich eine saftige Verkühlung eingefangen zu haben.> else {
				if flag <fe-rätsel 2> then choose <Fe-Rätsel 2 Dialog> else {
					if flag <fe-rätsel 3> then msg <blu> } }
		}
		displaytype <Character>
		article <ihr>
		gender <sie>
		hidden
		use on <Hundekörbchen> {
			if flag <wärmflasche im hundekörbchen> and flag <polster im hundekörbchen> then {
				if flag <wärmflasche im hundekörbchen> and flag <polster im hundekörbchen> then {
					msg <|s00Du legst die bibberende gute Fe in das warme und flauschige Hundekörbchen. Das scheint ihr wirklich gut zu tun (zum Beispiel hört sie endlich mit dem lästigen Zähneklappern auf.)>
					flag off <fe-rätsel 1>
					flag on <fe-rätsel 2>
					lose <gute Fe>
					flag on <fe im hundekörbchen> } } else {
				if flag <wärmflasche im hundekörbchen> then msg <Es ist jetzt zwar warm, aber noch recht hart und ungemütlich. Du mußt dir noch irgendetwas überlegen, wie du das gemütlicher gestalten kannst.> else {
					if flag <polster im hundekörbchen> then msg <Es ist jetzt zwar weich aber immer noch arschkalt. Du mußt dir noch irgendetwas einfallen lassen, wie du das Bettchen wärmen kannst.> else msg <Gute Idee, nur im Moment ist das nur ein Strohgeflecht - hart und kalt. Das solltest du erstmal irgendwie präparieren.> } }
		}
		give to <Hundekörbchen> {
			if flag <wärmflasche im hundekörbchen> and flag <polster im hundekörbchen> then {
				if flag <wärmflasche im hundekörbchen> and flag <polster im hundekörbchen> then {
					msg <|s00Du legst die bibberende gute Fe in das warme und flauschige Hundekörbchen. Das scheint ihr wirklich gut zu tun (zum Beispiel hört sie endlich mit dem lästigen Zähneklappern auf.)>
					flag off <fe-rätsel 1>
					flag on <fe-rätsel 2>
					lose <gute Fe>
					flag on <fe im hundekörbchen> } } else {
				if flag <wärmflasche im hundekörbchen> then msg <Es ist jetzt zwar warm, aber noch recht hart und ungemütlich. Du mußt dir noch irgendetwas überlegen, wie du das gemütlicher gestalten kannst.> else {
					if flag <polster im hundekörbchen> then msg <Es ist jetzt zwar weich aber immer noch arschkalt. Du mußt dir noch irgendetwas einfallen lassen, wie du das Bettchen wärmen kannst.> else msg <Gute Idee, nur im Moment ist das nur ein Strohgeflecht - hart und kalt. Das solltest du erstmal irgendwie präparieren.> } }
		}
		give anything msg <Das will sie nicht.>
		action <sprich mit> if flag <fe-rätsel 1> then msg <|s00-Wer bist du?|n-Die gute Fe...|nMehr bringt sie im Moment vor lauter zittern und husten nicht über die Lippen. Sie sieht wirklich erbärmlich aus, du solltest sie irgendwie wärmen.>
		action <red mit> if flag <fe-rätsel 1> then msg <-Wer bist du?|n-Die gute Fe..|nMehr bringt sie vor lauter Zittern und Röcheln und Zähneklappern nicht hervor. Die ärmste scheint sich eine saftige Verkühlung eingefangen zu haben.>
	end define

	define object <Kleider>
		look <Kleider. Viele Kleider. Eine Menge Kleider. Schätzungsweise um die 2 Tonnen Kleider. Und trotzdem kein einziges Leibchen, das farblich zu deinen Schuhen passen würde..>
		take msg <Es ist einfach nicht der richtige Zeitpunkt um dich jetzt durch deine Garderobe zu wühlen.>
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

	define object <Hundekörbchen>
		alt <körbchen; hundekorb; korb; polster>
		look {
			if flag <fe im hundekörbchen> then msg <Die gute Fe liegt im pudelwarmen Hundekörbchen. Ein unrealistisches, aber doch sehr, sehr nettes Bild.> else {
				if flag <wärmflasche im hundekörbchen> and flag <polster im hundekörbchen> then msg <Es ist ein aus Stroh geflechtetes Hundekörbchen, in dem ein Polster und eine Wärmflasche liegen - ein richtig gemütliches Bettchen hast du da konstruiert.> else {
					if flag <wärmflasche im hundekörbchen> then msg <Die Wärmflasche liegt in dem aus Stroh geflochtenen Hundekörbchen. Recht gemütlich sieht das ganze aber trotzdem noch nicht aus.> else {
						if flag <polster im hundekörbchen> then msg <Es liegt ein Polster in dem aus Stroh geflochtenen Hundekörbchen.> else msg <Es ist ein leeres, aus Stroh geflochtenes Hundekörbchen. Im Moment sieht das nicht besonders gemütlich aus.> } } }
		}
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Zimmerschlüssel>
		alt <schlüssel; kleiner schlüssel; kleinen schlüssel>
		look <Es ist dein kleiner silberner Zimmerschlüssel.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Handtasche>
		hidden
		use on <Tür> msg <Du probierst aus, ob der Schlüssel aus deiner Handtasche auch tatsächlich ins Schloss passt - das tut er.>
	end define

	define object <fleck>
		look if property <fleck; mit salzrand> then msg <Er sieht aus, als ob hier einmal eine Flüssigkeit ausgeronnen wäre. Vielleicht hat der Hund..? Oder etwa.. Nein!> else msg <Es ist der Urinfleck, von dem du das Salz abgeschabt hast.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		properties <riech = Das riecht irgendwie salzig. Vielleicht wirklich ein Urinfleck?; untersuche = Der Fleck ist von einer weißlichen Umrandung umgeben. Salz. Der Verdacht eines Urinflecks erhärtet sich.>
		action <riech> if property <fleck; mit salzrand> then msg <Das riecht irgendwie salzig. Vielleicht wirklich ein Urinfleck?> else msg <Nachdem du bereits die Salzprobe durchgeführt hast, ist auch der Geruchseindruck recht klar: Urin. Nur: von wem?>
		action <untersuche> if property <fleck; mit salzrand> then msg <Der Fleck ist von einer weißlichen Umrandung umgeben. Salz? Der Verdacht eines Urinflecks erhärtet sich.> else msg <Du hast bereits geklärt, dass es sich hierbei um einen Urinfleck handeln muß. Die Frage jedoch, von wem er stammt, wir schwerer zu beantworten sein.>
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
	west <Küche>
end define

define room <Küche>
	look <|s09|nDie Küche ist ein Schlauch, an dessen einem Ende ein alter Kohleofen steht. Daneben stehen aufgefädelt ein Elektroherd, ein Geschirrkästchen und einen Kühlschrank, eine Eckbank umrahmt den Esstisch.|s00>
	south <Badezimmer>
	east <Vorzimmer>

	define object <Kohleofen>
		alt <ofen>
		look <Es ist der Kohleofen, mit dem du die Küche heizen würdest, wenn du Kohlen hättest... Beim Anblick des leeren Ofens wird dir schlagartig wieder bewusst, wie bitterkalt dir eigentlich ist.>
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
			msg <|s00Du öffnest das Rohr.>
			property <Elektroherd; geöffnet>
			property <Elektroherd; not geschlossen>
		}
		close {
			msg <|s00Du schließt den Herd wieder.>
			property <Elektroherd; not geöffnet>
			property <Elektroherd; geschlossen>
		}
		list empty <Der Herd ist leer.>
		list closed <Es ist ein funktionstüchtiger Elektroherd mit einem Ceranfeld mit vier Platten, der Stolz der Küche.>
		properties <geschlossen>
	end define

	define object <Geschirrkästchen>
		alt <Geschirrkasterl; kästchen; kasterl>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Langsam öffnest du das Kästchen.>
		close <Du schließt das Kästchen wieder.>
		add
		remove
		list closed {
			msg <|s00Es ist ein schlichtes Geschirrkästchen. Es ist im Moment geschlossen. Darauf stehen ein Messerblock, eine Cafémaschine mit Kanne und ein Korb mit Früchten.>
			reveal <Messerblock>
			reveal <Cafemaschine>
			reveal <Kanne>
			reveal <Obstkorb>
		}
	end define

	define object <Kühlschrank>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Wenig hoffnungsvoll öffnest du den Kühlschrank. Er bringt selten freudige Überraschungen.>
		close <Du schließt den Kühlschrank wieder und fragst dich, ob das kleine Lichtlein wohl noch immer brennt?>
		add
		remove
		list empty <Es lässt sich eine faszinierende Beziehung zwischen deinem Kühlschrank und einem Stück Leder beobachten: Je leerer deine Geldtasche desto leerer dein Kühlschrank.>
		list closed <Dein Kühlschrank ist im Moment geschlossen. Du hast dir abgewöhnt ihn immer wieder zu öffnen, er ist doch immer leer.>
	end define

	define object <Eckbank>
		alt <Bank; blümchenbezug; bezug; sitzfläche; küchenbank>
		look <Eine Eckbank mit Blümchenbezug. Vielleicht ist es eine dieser alten Bänke, wo man eine Sitzfläche anheben kann und sich darunter ein geheimes Fach verbirgt?>
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
		look <Eine rechteckige Platte auf vier Füßen - ein klassischer Esstisch.>
		take msg <Vielleicht, wenn du eine etwas größere Handtasche hättest.>
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
			msg <|s00Ein Messerblock aus einer dieser Werbesendungen. Von wegen 24-teiliges Edelstahl-Messerset, und wenn sie jetzt anrufen, bekommen sie noch diese einzigartige Bio-Fruchtsaftpresse gratis dazu! Und das ganze für nur unschlagbare 249,90 Euro! Und von dem ganzen blieb dann irgendwie nur noch ein Messer übrig, dass da jetzt so alleine drinnen steckt.>
			reveal <Messer>
		}
		list empty <Ein Messerblock aus einer dieser Werbesendungen. Von wegen 24-teiliges Edelstahl-Messerset, und wenn sie jetzt anrufen, bekommen sie noch diese einzigartige Bio-Fruchtsaftpresse gratis dazu! Und das ganze für nur unschlagbare 249,90 Euro! Kein einziges mehr der 24 Super-Edelstahlmesser ist noch übrig, wie traurig.>
	end define

	define object <Cafemaschine>
		alt <Cafémaschine; Kaffeemaschine; caffeemaschine; Kaffemaschine; Kafeemaschine; maschine>
		look <Es ist eine organge Filtercafémaschine. Es scheint, als hätte sie in ihrem langen Leben schon sehr, sehr viel Café gekocht.>
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
						msg <|s00Du schaltest die Maschine ein und wartest, bis das heiße Wasser durch den leeren Caféfilter in die Kanne tropft. Jetzt hast du eine Kanne, die mit heißem Wasser gefüllt ist.>
						property <Kanne; voll mit heißem wasser>
						flag off <cafemaschine bereit>
						lose <Kanne> } else msg <Deine Kanne ist doch schon voll mit Wasser, das solltest du erstmal wegleeren.> } else msg <Hm, und wo soll dann das heiße Wasser hin? Erstmal brauchst du die Kanne, die in diese Maschine passt...> } else msg <Du könntest die Maschine jetzt natürlich einschalten, aber es würde sich anbieten vorher noch Wasser hineinzuleeren.>
		}
	end define

	define object <Kanne>
		alt <Kaffeekanne; cafékanne; caffeekanne>
		look {
			if property <Kanne; voll> then msg <Sie ist gefüllt mit Wasser.> else {
				if property <Kanne; voll mit heißem wasser> then msg <Deine Kanne ist voll mit heißem Wasser.> else msg <|s00Eine Café- oder Teekanne. Sie ist leer.> }
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
					msg <|s00Du befüllst die Kanne mit Wasser. Sie ist jetzt voll.>
					property <Kanne; voll> } } else msg <Du solltest erstmal Wasser aufdrehen, vorher geht da garnichts.>
		}
		use on <Abwasch> {
			if flag <kaltes abwaschwasser an> then {
				if property <Kanne; voll> then msg <Sie ist doch schon voll.> else {
					msg <|s00Du befüllst die Kanne mit Wasser.>
					property <Kanne; voll> } } else msg <Dazu solltest du erstmal Wasser aufdrehen.>
		}
		use on <Cafemaschine> {
			if property <Kanne; voll> then {
				msg <|s00Du schüttest das Wasser aus der Kanne in die Maschine und stellst sie hin.>
				flag on <Cafemaschine bereit>
				property <Kanne; not voll>
				lose <Kanne> } else {
				msg <|s00Du stellst die leere Kanne wieder in die Maschine.>
				lose <Kanne> }
		}
		use on <Tigertasse> do <tigertasse mit heißem wasser befüllen>
		use on <Elektroherd> msg <Lieber nicht, sie könnte springen.>
		action <füll> {
			if here <Dusche> then {
				if flag <warmes duschwasser> then {
					msg <|s00Du füllst die Kanne mit dem heißen Wasser aus der Dusche.>
					property <Kanne; voll mit heißem wasser> } else {
					if flag <kaltes duschwasser> or flag <kaltes abwaschwasser an> then {
						msg <|s00Du befüllst die Kanne mit kaltem Wasser.>
						property <Kanne; voll> } else msg <Dazu brauchst du erstmal fließendes Wasser.> } } else msg <Dazu bräuchtest du zuerst mal Wasser, oder?>
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
		parent <Geschirrkästchen>
	end define

	define object <Besteck>
		alt <gabel; gabeln; messer; löffel; messern; löffeln>
		look <Ein Sammelsurium von Messern, Gabeln und Löffeln.>
		take msg <Das würde am Ende noch die Handtasche beschädigen.>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Geschirrkästchen>
	end define

	define object <Teesackerl>
		alt <sackerl; teesäckchen; säckchen>
		look <Ein einzelnes Teesackerl "Erkältungstee" aus dem Hause "Natur aktiv". Wie das wohl in den Kühlschrank geraten ist?>
		take <Du steckst das Teesackerl ein.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Kühlschrank>
		use <Kanne> msg <|s00Das wäre zwar möglich, aber du tust es trotzdem nicht. Es wäre dir einfach lieber, wenn das Teesäckchen direkt in die Tasse kommt.>
		use on <Kanne> msg <|s00Das wäre zwar möglich, aber du tust es trotzdem nicht. Es wäre dir einfach lieber, wenn das Teesäckchen direkt in die Tasse kommt.>
		use on <Tigertasse> {
			if property <Tigertasse; voll mit heißem wasser> then {
				msg <|s00Du hängst das Teesackerl mit dem Erkältungstee in die Tasse und beobachtest, wie grünliche Farbe als kleine Tentakel daraus hervortritt und das Wasser mehr und mehr einfärbt. Nach etwas Warten hast du nun fertigen Erkältungstee.>
				hide <Teesackerl>
				property <Tigertasse; voll mit Tee>
				property <Tigertasse; not voll mit heißem wasser> } else msg <Erst sollte da mal heißes Wasser rein.>
		}
		give to <Tigertasse> {
			if property <Tigertasse; voll mit heißem wasser> then {
				msg <|s00Du hängst das Teesackerl mit dem Erkältungstee in die Tasse und beobachtest, wie grünliche Farbe als kleine Tentakel daraus hervortritt und das Wasser mehr und mehr einfärbt. Nach etwas Warten hast du nun fertigen Erkältungstee.>
				hide <Teesackerl>
				property <Tigertasse; voll mit Tee>
				property <Tigertasse; not voll mit heißem wasser> } else msg <Erst sollte da mal heißes Wasser rein.>
		}
		give to <Kanne> msg <|s00Das wäre zwar möglich, aber du tust es trotzdem nicht. Es wäre dir einfach lieber, wenn das Teesäckchen direkt in die Tasse kommt.>
	end define

	define object <Tigertasse>
		alt <tasse; heferl; tee; erkältungstee>
		look {
			if property <Tigertasse; voll mit tee> then msg <Die Tigertasse ist jetzt voll mit Erkältungstee.> else {
				if property <Tigertasse; voll mit heißem wasser> then msg <Deine Tigertasse ist im Moment voll mit heißem Wasser.> else msg <|s00Es ist eine eine deiner Lieblingstassen, die mit einem Tigermotiv. Außerdem besteht der Henkel aus einem sich schlängelndem Tiger.> }
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
		parent <Geschirrkästchen>
		invisible
		use on <Dusche> {
			if flag <warmes duschwasser> then {
				msg <|s00Du befüllst die Tasse mit heißem Wasser aus der Dusche.>
				property <Tigertasse; voll mit heißem wasser> } else {
				if flag <kaltes duschwasser> then msg <Nö, lieber nicht.> else msg <Lieber nicht.> }
		}
		use on <Waschbecken> msg <Zuerst mal brauchst du dazu fließendes Wasser.>
		use on <Abwasch> if flag <kaltes abwaschwasser an> then msg <Nö, lieber nicht.> else msg <Erst mal brauchst du dazu fließendes Wasser.>
		opened
		list empty <Es ist eine leere Tasse mit einer Darstellung eines Tigers. Den Henkel bildet ebenfalls ein sich schlängelnder Tiger.>
		action <füll> {
			if property <Kanne; voll mit heißem wasser> then {
				msg <|s00Du füllst das heiße Wasser aus der Kanne in die Tigertasse.>
				property <Kanne; not voll mit heißem wasser>
				property <Tigertasse; voll mit heißem wasser> } else {
				if here <Dusche> then {
					if flag <warmes duschwasser> then {
						msg <|s00Du füllst die Tigertasse mit heißem Wasser aus der Dusche.>
						property <Tigertasse; voll mit heißem wasser> } else {
						if flag <kaltes duschwasser> or flag <kaltes abwaschwasser an> then msg <Da kommt nur heißes Wasser rein, sonst nichts.> else msg <Mit welchem Wasser möchtest du die Tasse befüllen?> } } else msg <Dazu solltest du erstmal wo hingehen, wo es auch tatsächlich Wasser gibt.> }
		}
	end define

	define object <Messer>
		alt <Edelstahlmesser; stahlmesser>
		look <Das Edelstahlmesser aus der einzigartigen 24teiligen Serie für nur unschlagbare 249,90 Euro!>
		take
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Messerblock>
		invisible
		use on <Holzkeil> do <benütze nagelfeile mit holzkeil>
	end define

	define object <Papier>
		alt <blatt; bogen; blätter; bögen; papiere>
		look {
			if flag <papier entnommen> then {
				msg <|s00Es ist der Bogen Papier, den du aus der Eckbank genommen hast. Endlose Möglichkeiten tun sich auf: Papierflieger, Schiffchen, Hüte...> } else msg <|s00Da liegt jede Menge Papier in der Bank. Du fragst dich, warum du eigentlich dein Papier in der Eckbank hortest?>
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
		use msg <Wofür willst du das Papier benützen? Ein Flieger, ein Schiffchen, ein Hütchen?>
		use on <Salz> msg <Hm.. Dann hättest du das Salz auf einem Blatt Papier. Es wäre wohl günstiger, wenn du das Papier zuerst falten würdest...>
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
		look <Jede Menge sinnloses Zeugs, das deswegen in einer Küchenbank landet, weil man nicht weiß, wo man es sonst hingeben sollte.>
		prefix <ein Haufen>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Eckbank>
	end define

end define

define room <Badezimmer>
	look <|s09|nDas Badezimmer ist nicht mehr als ein kleines Hinterzimmer der Küche. Auffällig ist, dass Waschbecken und die Abwasch direkt nebeneinander ihr Dasein fristen. Außerdem freust du dich jedesmal wieder über den neuen Duschvorhang, wenn du das Bad betrittst. Es stehen einige deiner Waschutensilien, Cremchen undsoweiter herum, ansonsten wenig Außergewöhnliches.|s00>
	north <Küche>

	define object <Dusche>
		alt <wasser; wasserhahn; hahn; duschkopf>
		look {
			if flag <warmes duschwasser> then msg <Warmes Wasser fließt aus dem Duschkopf deiner Dusche.> else {
				if flag <kaltes duschwasser> then msg <Kaltes Wasser fließt aus dem Duschkopf deiner alten Dusche.> else msg <Sie scheint funktionsfähig.> }
		}
		prefix <die>
		displaytype <Object>
		article <it>
		gender <it>
		properties <dreh auf; dreh ab>
		action <dreh auf> choose <Duschwasser>
		action <dreh ab> {
			if flag <warmes duschwasser> or flag <kaltes duschwasser> then {
				msg <|s00Du drehst das Wasser wieder ab. Sehr sparsam  - sehr löblich.>
				flag off <warmes duschwasser>
				flag off <kaltes duschwasser> } else msg <Wenn kein Wasser aufgedreht ist, kann man auch kein Wasser aufdrehen. (Und sowas geht studieren..)>
		}
		action <schalt ein> choose <Duschwasser>
		action <schalt aus> {
			if flag <warmes duschwasser> or flag <kaltes duschwasser> then {
				msg <|s00Du drehst das Wasser wieder ab - sehr ressourcenbewusst, sehr löblich.>
				flag off <warmes duschwasser>
				flag off <kaltes duschwasser> } else msg <Du hast doch das Wasser noch garnicht aufgedreht.>
		}
	end define

	define object <Waschbecken>
		alt <wasser; wasserhahn; hahn>
		look <Ideal Standard. Ein älteres Modell. Der Stöpsel fehlt. Das ist irgendsoeine Logiksache>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		properties <dreh  auf = Da kommt kein Wasser. Seltsam.; dreh auf; dreh ab; schalt ein = Da kommt nichts. Seltsam.; schalt aus = Wo kein Wasser läuft, kann man dessen Lauf auch nicht stoppen.>
	end define

	define object <Abwasch>
		alt <wasser; wasserhahn; hahn>
		look if flag <kaltes abwaschwasser an> then msg <Eine alte, tiefe Abwasch mit zwei Becken. Sie sind ziemlich verschmutzt, haben den Teint einer häufig gebrauchten Porzellanteekanne. Du hast kaltes Wasser aufgedreht, das gerade sinnlos in den Abfluss plätschert.> else msg <Eine alte, tiefe Abwasch mit zwei Becken. Sie sind ziemlich verschmutzt, haben den Teint einer häufig gebrauchten Porzellanteekanne.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		action <dreh auf> choose <Abwaschwasser>
		action <dreh ab> {
			if flag <kaltes abwaschwasser an> then {
				flag off <kaltes abwaschwasser an>
				msg <Du drehst das Wasser wieder ab. Sehr vernünftig.> } else msg <Wenn kein Wasser läuft, dann kannst du es auch nicht abdrehen. Irgendwie logisch.>
		}
		action <schalt aus> {
			if flag <kaltes abwaschwasser an> then {
				flag off <kaltes abwaschwasser an>
				msg <Du drehst das Wasser wieder ab. Sehr vernünftig.> } else msg <Wenn kein Wasser läuft, dann kannst du es auch nicht abdrehen. Irgendwie logisch.>
		}
		action <schalt ein> choose <Abwaschwasser>
	end define

	define object <Abwaschkasterl>
		alt <Abwaschkasten; Abwaschkästchen; kasterl; kasten; kästchen>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		open <Du öffnest die Flügeltüren des Abwaschkasterls.>
		close <Du schließt das Kasterl wieder.>
		add
		remove
		list empty <Das Kästchen ist jetzt leer.>
		list closed <Unter der Abwasch befindet sich ein Kästchen mit zwei Flügeltüren.>
	end define

	define object <Wärmflasche>
		look {
			if property <Wärmflasche; leer> then msg <Deine Wärmflasche ist in einer weißen, pelzigen Stoffhülle. Im Moment ist sie nicht befüllt.> else {
				if property <Wärmflasche; voll> then msg <Sie ist jetzt befüllt und warm.> }
		}
		take <Du steckst die Wärmflasche ein.>
		prefix <eine>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Abwaschkasterl>
		use msg <Du schiebst die Wärmflasche für einen Moment unter deinen Pullover und fühlst die Wärme auf deinem Bäuchlein. Ein recht behagliches Gefühl.>
		use on <Dusche> {
			if flag <warmes duschwasser> then {
				if property <Wärmflasche; voll> then msg <Sie ist doch schon voll!> else {
					msg <|s00Du füllst die Wärmflasche mit dem heißen Wasser aus der Dusche. Jetzt hast du eine pudelwarme Wärmflasche.>
					property <Wärmflasche; not leer>
					property <Wärmflasche; voll> } } else {
				if flag <kaltes duschwasser> then msg <Eine WÄRMflasche mit KALTEM Wasser zu füllen erscheint irgendwie wenig sinnvoll, oder?> else msg <Dazu brauchst du zuerst mal schön warmes Wasser.> }
		}
		use on <Hundekörbchen> {
			msg <|s00Du legst die Wärmflasche in das Hundekörbchen.>
			hide <Wärmflasche>
			flag on <Wärmflasche im Hundekörbchen>
		}
		use on <Abwasch> if flag <kaltes abwaschwasser an> then msg <Und wieso möchtest du KALTES Wasser in eine WÄRMflasche geben?> else msg <So ein Füllvorgang kann ohne Wasser schon ziemlich lange dauern..>
		use on <Waschbecken> msg <Du brauchst erstmal fließendes Wasser.>
		give to <Hundekörbchen> {
			msg <|s00Du legst die Wärmflasche in das Hundekörbchen.>
			hide <Wärmflasche>
			flag on <Wärmflasche im Hundekörbchen>
		}
		properties <leer; füll>
		action <füll> 
	end define

	define object <Badezimmerschränkchen>
		alt <Badezimmerschrank; Schränkchen; Schrank>
		look <Es ist ein bideres Badezimmerschränkchen mit einem Glastürchen und zwei Laden.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		container
		transparent
		open <Du öffnest die Glastüre des Badezimmerschränkchens.>
		close <Du schließt die Glastür des Badezimmerschränkchens wieder.>
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
		look <Dein Badezimmerspiegel zeigt dir das Bild eines wunderschönen, bettelarmen Studentenaschenputtels.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Cremchen>
		alt <Reinigungsmilch; Gesichtswasser; Waschgel; Peeling; Utensilien; waschutensilien>
		look <Die täglich´ Chemie einer Frau: Reinigungsmilch (mit Alantonin), Gesichtswasser (mit Fruchsäure - verfeinert die Poren), mild schäumendes Waschgel (-zarte Gesichtspflege für jeden Hauttyp, pH-neutral), tiefenreinigendes Peeling (mit klärender Minze und Joghurt-Extrakt - antibakterielles Wirksystem) und Lavendelseife. Daneben steht ein Linsenbehälter.>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Lavendelseife>
		alt <flüssigseife; seife>
		look {
			msg <|s00Flüssigseife mit Lavendelgeruch.>
			reveal <Lavendelseife>
		}
		take {
			msg <|s00Du nimmst die Lavendelseife einfach mal mit, wer weiß wozu man sie noch brauchen kann.>
			reveal <Lavendelseife>
			give <Lavendelseife>
		}
		displaytype <Object>
		article <it>
		gender <it>
		invisible
	end define

	define object <Duschvorhang>
		look <Duschvorhang PISSE, das weiße Duschwunder. 100 Prozent wasserabweisendes, leichtes und stabiles Gewebe. Und das um nur 2,50 Euro!>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
	end define

	define object <Linsenbehälter>
		take msg <Das willst du nicht mitnehmen.>
		prefix <ein>
		displaytype <Object>
		article <it>
		gender <it>
		invisible
		container
		open <Du schraubst den Kontaktlinsenbehälter auf.>
		close <Du schraubst den Kontaktlinsenbehälter wieder zu.>
		remove
		list empty <Er ist leer.>
		list closed {
			msg <|s00Es ist ein Kontaktlinsenbehälter.>
			reveal <Linsenbehälter>
		}
	end define

	define object <Kontaktlinse>
		alt <Linse>
		look <Es ist eine rechte, handelsübliche Kontaktlinse von Hartlauer.>
		take <Wer weiß, ob man eine rechte Kontaktlinse nicht noch brauchen kann? Man sollte es jedenfalls nicht kategorisch ausschließen.>
		prefix <eine rechte>
		displaytype <Object>
		article <it>
		gender <it>
		parent <Linsenbehälter>
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
		use msg <Du überlegst, ob du kurz einfach dein Gesicht in den Polster legen sollst. Aber dann denkst du: Warum eigentlich?>
		use <Hundekörbchen> {
			msg <|s00Du legst den Polster in das Hundekörbchen. Jetzt sieht es schon richtig gemütlich aus.>
			flag on <Polster im Hundekörbchen>
			hide <Polster>
		}
		use on <Hundekörbchen> {
			msg <|s00Du legst den Polster in das Hundekörbchen. Jetzt sieht es schon richtig gemütlich aus.>
			flag on <Polster im Hundekörbchen>
			hide <Polster>
		}
		use on anything msg <Du legst den Polster kurz darauf, hälst kurz inne und denkst "Wow!". Dann nimmst du den Polster wieder und alles ist wieder, wie es vorher war.>
		give <Hundekörbchen> {
			msg <|s00Du legst den Polster in das Hundekörbchen. Jetzt sieht es schon richtig gemütlich aus.>
			flag on <Polster im Hundekörbchen>
			hide <Polster>
		}
		give to <Hundekörbchen> {
			msg <|s00Du legst den Polster in das Hundekörbchen. Jetzt sieht es schon richtig gemütlich aus.>
			flag on <Polster im Hundekörbchen>
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
	msg <|s18da wälzte sich ein kleines, bettelarmes Studentenmädchen unruhig in ihrem seichten Schlaf hin und her...|s00>
	pause <6000>
	msg <|s18und träumte von üppig gefüllten Kühlschränken...|s00>
	pause <4000>
	msg <|s18von funktionierenden Heizungen...|s00>
	pause <4000>
	msg <|s18von dem Tag, an dem ihre Diplomarbeit abgeschlossen sein und ihr so entbehrungsreiche Studentendasein endlich ein Ende haben würde.|s00>
	pause <6000>
	msg <|s18Mit einem Wort: Die bettelarme Coco träumte von besseren Zeiten.|s00>
	pause <6000>
	msg <|s18Und im Traum klagte sie...|s00>
	pause <4000>
	msg <|s18und weinte sie bitterlich...|s00>
	pause <4000>
	msg <|s18und sie rief verzweifelt um Hilfe...|s00>
	pause <4000>
	msg <|s18doch ihre Rufe verhallten scheinbar ungehört im Nirgendwo...|s00>
	pause <6000>
	msg <|s18während von draußen dieser grausige, feuchtkalte Herbstmorgen...|s00>
	pause <6000>
	msg <|s18unbarmherzig den Weg durch die Ritzen in den Fensterscheiben in ihre unwirtliche Studentenbude fand...|s00>
	pause <6000>
	msg <|s18und irgendwo wie jeden Morgen eine Turmuhr gewissenhaft die Morgenstunden abschlug.|s00>
	pause <10000>
	msg <|s18Doch plötzlich schrickt sie hoch.|s00>
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
	msg <|s18|nIn diesem Moment ahnte die bettelarme Studentin noch nicht, dass soeben ein ganz besonderer Tag begonnen hatte, der mit einem Schlag alles ändern sollte...|s00>
	pause <10000>
	msg <|jc|cr|s36|n|nDer zwanzigste Oktober|s00|n|jl|n|n|cb|n>
	pause <10000>
end define

define procedure <benütze nagelfeile mit holzkeil>
	if property <Fenster; verriegelt> then {
		msg <|s00Du stocherst einige male mit dem Edelstahlmesser an dem Holzkeil herum bis dieser zu Boden fällt. Leider bricht dir dabei das Messer ab. Aber immerhin sollte sich jetzt das Fenster öffnen lassen.>
		property <Fenster; not verriegelt>
		hide <Messer> }
end define

define procedure <stimme hören sehen fühlen>
	msg <Scherzkeks, eine Stimme kann man weder suchen noch ansehen noch sonstwas - sondern ausschließlich hören. Dafür müßte sie aber erstmal da sein.>
end define

define procedure <radiotext>
	speak <Dear Coco. I wish you all the best for your birthday, and I hope that your days will be filled with love and success until their end, from which we all hope that it still might be very, very far away. Happy birthday!>
end define

define procedure <benütze nagelfeile mit kasette>
	msg <|s00Mit Hilfe der Nagelfeile ziehst du dir das Tonband aus der Kasette.>
	show <Tonband>
	give <Tonband>
	hide <Kasette>
end define

define procedure <tigertasse mit heißem wasser befüllen>
	if property <Kanne; voll mit heißem wasser> then {
		msg <|s00Vorsichtig, ohne dich dabei zu verbrennen, leerst du das heiße Wasser in die Tigertasse.>
		property <Kanne; not voll mit heißem wasser>
		property <Tigertasse; voll mit heißem wasser> } else {
		if property <Kanne; voll> then msg <Warum kaltes Wasser in eine Tasse leeren?> else msg <Die Kanne ist leer, was willst du denn da in die Tasse leeren?> }
end define

define procedure <tigertasse an fe geben>
	if property <Tigertasse; voll mit tee> then {
		msg <|s00Du gibst ihr die Tasse mit Tee. Genussvoll trinkt sie aus und sieht gleich viel besser aus.>
		flag off <fe-rätsel 2>
		flag on <fe-rätsel 3>
		hide <Tigertasse> } else {
		if property <Tigertasse; voll mit heißem wasser> then msg <Soll ich einfach heißes Wasser trinken oder was?> else msg <Sie will deine Tasse nicht.> }
end define

define timer <gute Fe>
	interval <60>
	action {
		msg <Du hälst kurz inne. War das gerade wieder diese zittrige Stimme, die dich aufgeweckt hat? Hat sie gerade "Coco" gerufen?|n>
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
		msg <|s00"Jetzt laß mich endlich rein!"|n>
		timeroff <gute Fe3>
		timeron <gute Fe4>
	}
	disabled
end define

define timer <gute Fe4>
	interval <80>
	action msg <|s00"Ich frier mir hier draußen noch meine Locken ab!"|n>
	disabled
end define

define timer <fenster offen - sturm>
	interval <30>
	action {
		msg <|s00Hhhhhuuuuu... Eine  Windböe kommt durchs offene Fenster, erwischt dich und haut dich fast um. Noch nie hast du einen so starken Sturm erlebt!>
		timeroff <fenster offen - sturm>
		timeron <fenster offen - sturm>
	}
	disabled
end define

define selection <Abwaschwasser>
	info <Welches Wasser willst du haben?>
	choice <Warm> msg <Geht nicht. Warum auch immer.>
	choice <Kalt> {
		if flag <kaltes abwaschwasser an> then msg <Das Wasser läuft bereits.> else {
			msg <|s00Du drehst kaltes Wasser auf.>
			flag on <kaltes abwaschwasser an> }
	}
end define
define selection <Duschwasser>
	info <Welches Wasser willst du haben?>
	choice <Warm> {
		if flag <warmes duschwasser> then msg <Das Wasser läuft bereits.> else {
			msg <|s00Du drehst erfolgreich warmes Wasser auf.>
			flag on <warmes Duschwasser> }
	}
	choice <Kalt> {
		if flag <kaltes duschwasser> then msg <Das Wasser läuft bereits.> else {
			msg <|s00Du drehst kaltes Wasser auf.>
			flag on <kaltes Duschwasser> }
	}
end define
define selection <Fe-Rätsel 2 Dialog>
	info <Hallo..>
	choice <Wer bist du?> {
		msg <|s00Ich bin deine gute Fe. Alles Gute zum Geburtstag! Ich bin gekommen um dir zu helfen. Nur leider ging so ziemlich alles schief, was schief gehen kann... Zuerst hab ich alle meine wertvollen Sachen verloren und dann hab ich mich noch verbimmelt.. Bin stundenlang durch die Kälte gewandert, bis ich endlich dein Fenster gefunden habe. Und dann machst du mir noch nichtmal auf... Mann, tut mir mein Hals weh. Du hast nicht zufällig irgendwas?>
		wait <(Taste drücken um fortzufahren)>
		choose <Fe-Rätsel 2 Dialog>
	}
	choice <Wie geht es dir?> {
		msg <|s00Mein Hals tut entsetzlich weh.. Du hast nicht zufällig irgendetwas, was da helfen könnte?>
		wait <(Taste drücken um fortzufahren)>
		choose <Fe-Rätsel 2 Dialog>
	}
	choice <Wie bist du hier hergekommen?> {
		msg <|s00  - Na ich hab mich hergebimmelt, wie sonst!?|nSie macht noch einen etwas verwirrten Eindruck...>
		wait <(Taste drücken um fortzufahren)>
		choose <Fe-Rätsel 2 Dialog>
	}
	choice <Was machst du um Himmels Willen bei dieser Eiseskälte da draußen?!> {
		msg <|s00Na zu dir kommen! Und mich so richtig erkälten.. Mann, tut mir mein Hals weh!>
		wait <(Taste drücken um fortzufahren)>
		choose <Fe-Rätsel 2 Dialog>
	}
	choice <Deine Locken sind etwas durcheinander...> {
		msg <|s00Wenn du wüsstest, wieviel Arbeit die sind.. Und dann - eine Runde bimmeln und schon ist wieder alles beim Teufel, es ist immer dasselbe! Aber bei diesem Sturm würde ja nicht einmal mehr ein 3Wetter-Taft helfen..>
		wait <(Taste drücken um fortzufahren)>
		choose <Fe-Rätsel 2 Dialog>
	}
	choice <Ich geh dann mal...> msg <Wenn du mir mit meinem Hals hilfst, helfe ich dir auch.. Ich kenne dein Dipolomarbeitsproblem genau...>
end define
