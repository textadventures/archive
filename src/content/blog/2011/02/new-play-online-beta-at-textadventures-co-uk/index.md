---
title: "New &quot;Play Online&quot; beta at textadventures.co.uk"
date: 2011-02-12
categories: 
  - "textadventures-co-uk-website"
---

I have rewritten the "Play Online" feature of [textadventures.co.uk](http://www.textadventures.co.uk).

It is now running WebPlayer, which is the open source online player component of [Quest 5.0](http://quest5.net).

Things to be aware of or excited about...

- It is much faster than the old "play online" feature
- It no longer uses Flash - instead it's using AJAX. This means that it works on iPhone and iPad etc. But note that the current layout is not very iPhone-friendly. Also it didn't work on the Android browser I tried for some reason.
- It is free and open source, so if you wanted to host your own WebPlayer in your own design, [you can](http://quest.codeplex.com).
- It supports games for all Quest versions - both "classic" Quest (4.x and earlier) and "new" Quest (5.0).
- It works properly - if it works in Quest, it should work in WebPlayer too. The old "play online" feature doesn't show embedded CAS resources for example - WebPlayer does.

To use the new WebPlayer, you must first log in to [textadventures.co.uk](http://www.textadventures.co.uk). You will then see a "Try the new beta online player" under the usual "Play online" link. (There's no technical reason for requiring a login, it's just that I don't want every casual player on the site hitting the new WebPlayer until I know it works properly).

Note that the very latest games added to textadventures.co.uk won't be available on WebPlayer yet, as I haven't set up the service that grabs new game files on the new server.

Please, please, please give me your feedback and report any errors you see.
