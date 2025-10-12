---
title: "Squiffy 2.0"
date: 2014-10-11
categories: 
  - "squiffy"
---

Squiffy 2.0 is now available. Just like Apple's "Snow Leopard" release of OS X a few years ago, this release of Squiffy boasts an amazing **0 new features**.

[![0 new features](images/snow-leopard-0-new-features.jpg)](https://blog.textadventures.co.uk/wp-content/uploads/2014/10/snow-leopard-0-new-features.jpg)

Why no new features? Because Squiffy releases should only [do one thing at a time](http://docs.textadventures.co.uk/squiffy/roadmap.html), and this release is all about rewriting the compiler to use Node.js instead of Python.

This does make installation simpler, as Squiffy is now an npm package. To install Squiffy, you just need to [install Node.js](http://nodejs.org/) and then run

```
npm install squiffy -g
```

That's it!

Everything else is the same as before, with the possible exception of there being a different set of bugs now. If you spot any, please [log them on GitHub](https://github.com/textadventures/squiffy/issues).

You can find out how to use Squiffy by looking at [the documentation](http://docs.textadventures.co.uk/squiffy/), and the [Squiffy 1.0 blog post's overview](http://blog.textadventures.co.uk/2014/07/27/squiffy-1-0/ "Squiffy 1.0") is still up-to-date except for the reference to Python.
