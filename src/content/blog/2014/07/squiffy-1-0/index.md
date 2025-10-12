---
title: "Squiffy 1.0"
date: 2014-07-27
categories: 
  - "squiffy"
---

[Squiffy](http://textadventures.co.uk/squiffy) is a lightweight tool for writing interactive fiction. It is open source and runs on Windows, OS X and Linux. It generates static HTML, CSS and JavaScript files which you can upload anywhere.

I've already written one interactive fiction system, [Quest](http://textadventures.co.uk/quest) - so why create another? It was while writing my first game [Moquette](http://textadventures.co.uk/games/view/zbzfpcnknu_vdjog-cbihw/moquette) last year that I realised I needed a simpler tool for the kind of interactive story that I was interested in writing. I wanted something that would let me sit down and "just write", mostly getting out of my way.

So I've now created the tool that I wished I had back then. This version 1.0 release is intentionally very simple - it's a command-line Python script that reads in a text file, and writes the output to the same folder. [Here's how to install Squiffy](http://docs.textadventures.co.uk/squiffy/install.html).

Game text is written using [Markdown](http://daringfireball.net/projects/markdown/syntax). Players click links to interact with the game. Unlike other systems, Squiffy's equivalent of "nodes" or "pages" are split into two types:

- _Sections_ which move the story forward
- _Passages_ which provide a way to further explore or interact with the same scene

An example might help to explain the distinction between the two.

```
You enter the room. There's a [chair] and a [table] here.
You can go to the [[kitchen]].

[chair]:
Just a chair.

[table]:
An ordinary table.

[[kitchen]]:
You enter the kitchen...

```

Here, "kitchen" is a new section, whereas "chair" and "table" are links in the same section. You can click the chair, and the chair's description appears, but the table and kitchen links _remain enabled_. If you click the kitchen link, the table link is now disabled, as you've moved to the next section.

If this sounds confusing, don't worry - you can build you game entirely out of sections, and it will play as a traditional multiple choice game. But by including passages, you could create works that have a bit more of an exploratory feel. If [Moquette](http://textadventures.co.uk/games/view/zbzfpcnknu_vdjog-cbihw/moquette) were written now using Squiffy, I could use sections for each train, and passages for interacting with people in the same train carriage, for example.

Squiffy also makes it easy to use JavaScript. Any section or passage can embed JavaScript, simply by indenting code before the text. This would be useful for Moquette-style transitions - here's an [example](https://github.com/textadventures/squiffy/blob/master/examples/transitions/transitions.squiffy) of a screen blackout between sections.

A player's progress is saved automatically to the browser's local storage. They can close their browser tab, and the game will be restored immediately when they come back.

You can save state in [attributes](http://docs.textadventures.co.uk/squiffy/attributes.html), [replace text](http://docs.textadventures.co.uk/squiffy/replace.html), and make links that [replace themselves](http://docs.textadventures.co.uk/squiffy/rotate-sequence.html).

For publishing your game, you can upload it to any web space, or [submit it to textadventures.co.uk](http://textadventures.co.uk/create/submit). You could install [PhoneGap](http://phonegap.com/) or upload it to [PhoneGap Build](https://build.phonegap.com/) to turn it into an app.

Instead of "big bang" releases, the plan is to improve Squiffy one feature at a time. We will build up to a web-based editor over a series of what will hopefully be relatively frequent releases. For the plan, see the [Development Roadmap](http://docs.textadventures.co.uk/squiffy/roadmap.html).

For full details on using Squiffy, see the [documentation](http://docs.textadventures.co.uk/squiffy/).

I hope you will [give it a try](http://docs.textadventures.co.uk/squiffy/install.html) and [give me your feedback in the forums](http://forum.textadventures.co.uk/viewforum.php?f=24)!
