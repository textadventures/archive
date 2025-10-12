---
title: "Automatic mapping in Quest 5.3"
date: 2012-07-22
categories: 
  - "quest"
---

A text adventure generally involves moving around the game world by following compass directions - north, south, east, and west, with the occasional use of up and down, or in and out. Many players like to map out a game as they play using pencil and paper, but I expect the majority of players try to keep a map in their heads, and probably get lost more often than they would care to admit.

I've often been asked about adding a map as a Quest feature, but I had been put off from doing so by questions about how this should work exactly. For example, even if all exits are consistent (so that going west and then east takes you back to the same room), some rooms may be different sizes than others - this means that if the player starts in room A and goes north, west (along a long corridor), south and east, they will not arrive back in room A. And if you have many exits from a room, how do you ensure rooms don't overlap?

I have now come up with a solution, and it's the **automatic grid-based map**. This is a feature I have developed for Quest 5.3 (soon to be in beta, and already available as a [nightly build](http://quest.codeplex.com/releases/view/77770) if you're feeling brave). The work was generously sponsored by Phillip Zolla who was the original inspiration for the idea.

The map is automatically laid out on a grid, in much the same way as you might manually draw a map on graph paper. The only data a game author needs to provide are the dimensions of the room (defaulting to 1x1) and the "length" of the exits (defaulting to 1). Laying out the map then occurs automatically as the player moves through the game. And because the author only needs to input dimensions and lengths, this was very easy to implement in the Quest Editor - which was important as I didn't have the time to implement a nice graphical click and drag map editor which would work in both the Windows and web browser versions.

Here's an example map with three rooms:

![](images/grid1.png "Grid map")

Room A is 3x3, B is 6x2 and C is 3x5. All exits have length 1. The yellow dot represents the current player location.

The map is drawn using [Paper.js](http://paperjs.org/) so is rendered the same whether the game is run on the desktop or in the browser, and should also be adaptable when games are converted into smartphone apps.

There are various options for changing room fill colour and borders, which lets you create some neat effects. For example, in a castle in a meadow surrounded by a moat with a bridge (you may have to use your imagination a little)...

![](images/grid2.png "Grid map - castle")

By setting exit length to zero, rooms appear side by side. By setting borders correctly, you can show multiple rooms as one long path or corridor for example.

Up and down are handled using layers. In the example below, the player has moved up and the map for the levels below is shown faded out.

![](images/grid3.png "Grid map layers")

You can also click and drag to move the map around, and zoom in and out with the scrollwheel (and it should be straightforward to add touchscreen support too).

I expect to release a beta version of Quest 5.3 around the end of September.
