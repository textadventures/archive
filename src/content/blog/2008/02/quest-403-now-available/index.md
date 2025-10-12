---
title: "Quest 4.03 now available"
date: 2008-02-09
categories: 
  - "quest"
tags: 
  - "releases"
---

Quest 4.03 is now available.If you've already got Quest or Quest Pro, the easiest way to update is by selecting "Check for updates" from the "Help" menu in Quest or QDK. If you're not already a user, you can download Quest from [http://www.axeuk.com/quest/](http://www.axeuk.com/quest/)

Here's what's new:

**QDK**

- The Script Editor's functions are now available from a menu (with keyboard shortcuts) as well as from the toolbar.
- Added "Allow players to use abbreviated object names" game option.
- Slightly increased the size of the Object Type box to display correctly in Windows Vista.
- If QCompile is launched from QDK and fails to compile the file, it now displays error information.
- Fixed bugs:
    - a run-time error occurred when removing a synonym.
    - double-clicking a script line in the Script Editor would cause it to be changed.

**Quest**

- The command entry box now uses the same font and fontsize as the game.
- You can now turn off the player's ability to use abbreviated object names, by adding "abbreviations off" to the "define options" block.
- Quest now writes an error to the ASL log if an internal error occurs while running a script command, instead of quitting with an error message.
- Fixed bugs:
    - fixed run-time error when opening some large games.
    - fixed problem where "if" statements of the form "if ... then if ... and/or ... then ..." would be processed incorrectly.
    - QCompile wouldn't add a WAV file to a CAS if the playwav command did not include the file extension.
    - a run-time error would occur if the "clone" command was used in an object's "action" script.
