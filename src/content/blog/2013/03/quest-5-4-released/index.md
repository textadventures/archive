---
title: "Quest 5.4 released"
date: 2013-03-28
categories: 
  - "quest"
---

Quest 5.4 has now been released, and you can [download it now](http://www.textadventures.co.uk/quest/download/) or [use it in your browser](http://www.textadventures.co.uk/create/).

The major new features in this version are the [text processor](http://blog.textadventures.co.uk/2013/02/27/quest-5-4-text-processor-easier-adaptive-text-and-links/), [gamebook scripts](http://blog.textadventures.co.uk/2013/02/27/bringing-more-power-to-gamebook-mode-in-quest-5-4/) and [script editor code view](http://blog.textadventures.co.uk/2013/02/25/quest-5-4-script-editor-showing-you-teh-codez/). For a full list, see last month's [beta announcement](http://blog.textadventures.co.uk/2013/02/28/quest-5-4-beta-is-out-now/).

Since the beta there have been a few minor enhancements, most notably to the gamebook scripts. There is a new "Text + Script" page type which lets you run a script before displaying the normal gamebook text and options, so you're not forced to display text and options manually. There are new functions for moving the player between pages, and for adding and removing links.

Also:

- In gamebook mode, when playing a sound there is a new option for the sound to continue playing after the player moves to a different page
- You can now turn off the automatically generated display verbs list on a per-object basis (contributed by Pertex)
- New {rndalt} text processor code displays a randomly chosen name from an object's alt list (contributed by Ivor Levicki)
- With the new-style menus, restored the option to force the player to make a choice from the menu before continuing. (Note this is a breaking change - previously compiled games for Quest 5.4 Beta will continue to work, but to compile against the new library you will need to set the value for the new parameter)
- New function to output text without a line break at the end

As always, if you have any questions or problems, please let me know - you can email me [alex@textadventures.co.uk](mailto:alex@textadventures.co.uk) and you can find me on Twitter [@alexwarren](http://twitter.com/alexwarren).
