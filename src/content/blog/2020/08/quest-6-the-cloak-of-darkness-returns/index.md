---
title: "Quest 6: The Cloak of Darkness Returns!"
date: 2020-08-26
categories: 
  - "quest"
tags: 
  - "quest-6"
---

_The Cloak of Darkness is a specification for an adventure game that has been created in numerous systems, with the purpose of giving prospective authors some idea of what is involved in each system._

That is how I started [my last post](http://blog.textadventures.co.uk/2018/09/10/the-cloak-of-darkness/) on this blog. It describes how Quest 5 was used to create an adventure game according to that specification.

Now here I am nearly two years later, and I have a new version. This was written in Quest 6.

Quest 6 is a complete re-write of Quest, and is written entirely in JavaScript. That means everything I wrote to create Quest 6 is in JavaScript and everything the author writes when creating a game is also in JavaScript.

This has two big advantages:

1\. **Games run in the browser.** Everyone has a web browser, which means everyone already has all the software they need to run your game. Players can save their game progress on their own PCs to "localStorage". Compared to Quest 5 (and most other systems too):

- As games run on the player's PC there is no lag and no time-out
- Games can be easily uploaded to any web site (as well as textadventures.co.uk)

2\. **Anything can be customised.** The whole system is written in the same language you create your game in, and the entire framework is part of your game package. Anything you want to change, you can. You can re-write the parser, you can rebuild the interface from scratch or you can just slightly tweak how containers work. It is all there for you.

The game itself is very small, but take a look. In particular, see how responsive it is, compared to the Quest 5 version. For me it took about a second for the page to download, compared to 3 to 5 second for Quest 5, and its responses were instant.

Quest 6 [http://textadventures.co.uk/games/view/y02ja5kbyuccmbcelrooza/cloak-of-darkness](http://textadventures.co.uk/games/view/y02ja5kbyuccmbcelrooza/cloak-of-darkness)

Quest 5 [http://textadventures.co.uk/games/view/fol1tly36kc0pfy4qynrqq/cloak-of-darkness](http://textadventures.co.uk/games/view/fol1tly36kc0pfy4qynrqq/cloak-of-darkness)

If you are keen to take a look, there is a Wiki [here](https://github.com/ThePix/QuestJS/wiki), with a tutorial. Quest 6 has nearly all the features of Quest 5 (the only exception I am aware of is the map), and some new ones too.

That said, there is no editor yet, which I appreciate is going to put a lot of people off. However, if you have ever worked with code in Quest 5 you should be up to this (and error messages are a lot clearer and easier to track down than Quest 5!).

[This page](https://github.com/ThePix/QuestJS/wiki/The-Cloak-of-Darkness) discusses the code for Cloak of Darkness, so gives a good feel for what it is like to create a game.
