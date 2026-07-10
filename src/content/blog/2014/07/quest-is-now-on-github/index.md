---
title: "Quest is now on GitHub"
date: 2014-07-06
categories: 
  - "quest"
---

Ever since Quest was made open source back in 2010, we've been using [CodePlex](https://www.codeplex.com/), which is Microsoft's open source project hosting site.

Now in 2014, even Microsoft isn't using CodePlex any more - all their open source ASP.NET is [on GitHub](https://github.com/aspnet), for example.

So CodePlex has been feeling a bit dead, but even worse, it's been a bit buggy over the last few months - frequently giving me authorisation errors when pushing to the Mercurial repository.

I'd stuck with CodePlex and Mercurial for a while because [Git](http://git-scm.com/) tooling on Windows was always kind of horrible. Fortunately, that changed when GitHub launched [GitHub for Windows](https://windows.github.com/), which finally makes it easy for just about anybody to use Git.

So I've now migrated Quest over, and the source code now officially lives on GitHub at [**https://github.com/textadventures/quest**](https://github.com/textadventures/quest).

All issues from the CodePlex Issue Tracker have been [migrated too](https://github.com/textadventures/quest/issues). Please log all bug reports at GitHub from now on.

Finally, nobody had ever heard of the [Ms-PL](http://opensource.org/licenses/MS-PL) which Quest was previously licensed under. I kept having to say it was "just like the MIT licence". So I've updated that too, and Quest is now officially licensed using the [MIT licence](http://opensource.org/licenses/MIT). Nothing has really changed - you can still do pretty much what you want with the Quest code, including using it within closed-source projects - but hopefully it's just a bit clearer now.
