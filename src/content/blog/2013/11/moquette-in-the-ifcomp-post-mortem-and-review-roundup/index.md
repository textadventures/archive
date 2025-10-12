---
title: "Moquette in the IFComp - Post-Mortem and Review Roundup"
date: 2013-11-19
categories: 
  - "text-adventures"
---

My first work of interactive fiction "[Moquette](http://textadventures.co.uk/games/view/zbzfpcnknu_vdjog-cbihw/moquette)" came 15th out of 35 entries in this year's [IFComp](http://ifcomp.org/). Now that the competition is over, the vow of silence has been lifted (authors are not allowed to talk about their games publicly during the judging period), which means I can now write some blog posts talking about the ideas behind the game and how it was built.

15th place is a bit lower than I was hoping for, of course, but given the reviews it was roughly what I was expecting. There were various elements of the game that people were impressed with - but very few people really _loved_ it.

The [IFComp results](http://ifcomp.org/comp13/results.html) page has a good breakdown of the voting statistics, including the standard deviation, which is a measure of how wide the range of votes for each game was. _Moquette_ has the 6th highest standard deviation, so was one of the more divisive games in this year's competition.

It received 62 votes in total, on a scale of 1 to 10:

- 4 votes for 1
- 2 votes for 2
- 7 votes for 3
- 8 votes for 4
- 11 votes for 5
- 11 votes for 6
- 8 votes for 7
- 6 votes for 8
- 4 votes for 9
- 1 vote for 10

That's quite a range, with votes across the whole spectrum but mostly falling within the region of "not terrible, but not great".

I deliberately set out to do something different with _Moquette_, so perhaps a wide range of reactions is not surprising. From the reviews, it seems people were mostly impressed by the text effects and the simulation of the London Underground. The writing itself got more mixed reviews - some people liked the style, others thought the plot was too slow or didn't make sense (or didn't really exist), and a lot of people didn't warm to the main character.

I suppose this is simply a reflection of my own limitations. The text effects and tube simulation were the easy parts. I'll go into those in detail in another blog post, but the tube simulation was the first bit I had working and it wasn't difficult for me to implement. I saved the text effects until last, and there's not an awful lot to them - a little jQuery goes a long way.

The plot was what gave me trouble. I was tearing my hair out for ages trying to work out just what should happen in the game, and how it should end. I just can't fathom what the secret ingredient is for generating a plot. I don't have much experience writing static fiction, but from what I gather, at least if you're just writing words on a page, you can kind of "go with the flow" and see what plops out as you let your fingers walk across the keyboard. How can you do that with interactive fiction, which can't be created in such a freeform manner? I need to know what I'm building so I can break it down into its constituent parts and implement it - I don't see how it's possible to build something interactive the other way around, at least not if it is going to have any kind of strong author-created plot. Or, perhaps it is possible, but only by discarding a lot of work along the way - and it's difficult to do that if you're working to a deadline.

It turns out that characterisation is also a challenge for me. I thought I'd got around this by basically making Zoran a version of myself - albeit a "me" from about 10 years ago when I was in my early twenties. But reviewers really didn't like Zoran all that much. I felt conflicting emotions whenever my writing was praised for its portrayal of someone who, as it turns out, is intensely dislikable. In the author's forum, somebody wrote "The awkward conversation with the failed flame was just executed perfectly to paint a picture of a hateful, disgusting human being wasting his life and self-absorbedly assuming that everyone else is doing the same". Thanks, but... owch!

**Experiments**

So, how did _Moquette_ come about, and what was I trying to do with it?

Well, I've been talking about my vision for the future of text adventures for a long time now - in previous blog posts such as [Text adventure games are still new](http://blog.textadventures.co.uk/2013/01/29/text-adventure-games-are-still-new/ "Text adventure games are still new"), [Thoughts on interactive storytelling and The Hobbit](http://blog.textadventures.co.uk/2012/12/19/thoughts-on-interactive-storytelling-and-the-hobbit/ "Thoughts on interactive storytelling and The Hobbit"), [Experimenting with stories and text](http://blog.textadventures.co.uk/2013/04/07/experimenting-with-stories-and-text/ "Experimenting with stories and text"), and in [my talk at AdventureX](http://youtu.be/lQQbKt4_cKk). I realised that my thoughts would have a lot more weight if I backed them up by actually trying to create something, instead of just talking in the abstract about the kinds of experimentation that are still to be done with text-based games.

So what I tried to create wasn't simply a technology demo, but to play around with various ideas and theories about how interactive story experiences might be constructed.

I will split the experimentation up into five aspects, which I'll explore in more detail below.

1. A different way of using links
2. The nature of choice
3. It's not a game
4. First-person
5. Special effects

**Experiment 1 - A different way of using links>**

Quest started out as a parser-based system, although it has supported a [hybrid hyperlink interface](http://blog.textadventures.co.uk/2011/07/11/eliminating-guess-the-verb/ "Eliminating \"Guess the Verb\"") for a while now. It also now supports a simpler multiple-choice style of game - [gamebook mode](http://blog.textadventures.co.uk/2012/01/16/gamebook-mode-choose-your-own-adventure-in-quest-5-2/ "Gamebook mode (\"Choose Your Own Adventure\") in Quest 5.2"), which lets you create [Twine](http://twinery.org/)\-style works.

In _Moquette_, I'm exploring a style of game which is somewhere between the two. It doesn't have the simple branching structure of a gamebook, but it doesn't leave things completely open-ended like a parser game would. It is designed to be interacted with like a gamebook though, but underneath it is actually using the parser mode of Quest - I've just turned off the command input box and there are no objects with verbs to interact with.

I've used the power of Quest's ASL programming language to model the tube network, and handle the passengers which are randomly thrown at you as the game progresses. The result is a game world that can be explored in a similar way to a parser game, but with a simpler interaction model. It's the kind of game that couldn't be written with Twine, or printed as a _Choose Your Own Adventure_ book, because the game doesn't use a branching model (if it did, the branch map would be huge as you can explore the tube network freely - it would have to be a ridiculously large book to handle all the possible combinations of choices).

I wanted to show that even with a minimalistic UI, you could create an explorable world, and you could do it more subtly than continually asking binary choice questions like "do you want to speak to the woman, or change to the Northern line?". In Moquette, choosing one option often doesn't rule out exploring other options too, and it's easy to keep track of what you've done - the screen doesn't clear between choices, but irrelevant links are deactivated so you always know exactly what options are available to explore.

[![Moquette](images/moquette.png)](http://blog.textadventures.co.uk/wp-content/uploads/2013/11/moquette.png)

**Experiment 2 - The nature of choice**

Despite all the options that are available throughout the game, there is only one real choice - and it's right at the beginning. Do you let Zoran follow his usual routine and go to work, or do you intervene and try to stop him? Even here it doesn't really make much difference - the choice you make comes back to you at the end of the game, but there is no real right or wrong answer (in my mind the "winning" move here is actually not to intervene, because that results in Zoran reaching his own conclusion and making his own choice. But, on the other hand, it's also a winning move to show him the way).

Many people worked out that the choice of which tube train to get on was ultimately inconsequential. Some people didn't like that. They expect to have a choice and to affect the outcome of the story. "You are the hero!" - but you're not the hero in _Moquette_. You're not the protagonist.

This is contrary to the assumptions of most interactive fiction, but in writing _Moquette_, I haven't really been following the examples of text games I have seen before. I have been much more inspired by interactive theatre - the explorable worlds created by the likes of [Punchdrunk](http://punchdrunk.com/) and [Secret Cinema](http://www.secretcinema.org/), and wondering how to adapt those ideas to text-based fiction.

I believe that it is possible to create immersive, interesting story experiences where you have no effect on the outcome at all. You don't win or lose when you experience Punchdrunk's _[The Drowned Man](http://youtu.be/DZKNNMombV8)_, and you can enjoy the experience safe in the knowledge that you can't get anything "wrong", and that you will always make it to the ending. Surely text adventures can do this too?

One of the things that appeals to me about Punchdrunk is that everybody has a unique experience - there is always far more of the world to explore than you could possibly get around in one performance. I wanted some of that feeling in _Moquette_ too, but without the flaw that often plagues Punchdrunk performances where the plot can be difficult to work out. As a single-player text game, I can adapt and move the world around according to the player's choices - so you always get the complete plot, but different players will experience it in different locations. I wanted players to think that the encounter with Heather really is random - and that you felt that maybe if you'd gone a different way, something else would have happened instead. I wanted the game to feel bigger than it is, that when passengers got off the train before you'd had a chance to interact with them, that there were unexplored possibilities.

Of course, the illusion is shattered as soon as you play the game for a second time, and I expect many players are wise enough to work out the mechanics even when playing once. But hopefully it shows the kind of "magic tricks" that a text game might easily be able to perform.

**Experiment 3 - It's not a game**

There are no puzzles in _Moquette_, and you will always finish if you just play it for long enough. But this gave some people a problem - there is no objective. Some people even emailed me plaintively - "what am I supposed to do?". It's interesting how that seems to matter, and I'd like to challenge the assumption that there should be an objective in interactive fiction. You don't expect an objective when reading a book or going to the cinema - or if there is one, it's simply "experience and understand the story". Can't that work for interactive fiction too?

**Experiment 4 - First-person**

I've never really liked the second-person style of most interactive fiction. "You are standing in an open field west of a white house" - no, I'm really not. I think writing in the first-person neatly sidesteps a lot of issues - I'm no longer wondering what my role is, how I got here, what my previous memories might be, or what I'm supposed to be feeling. Instead I can simply enjoy seeing the world through somebody else's eyes. In _Moquette_ we teleport inside Zoran's brain, and we get to play with some of the controls. But the suggestions we make to Zoran are just that - suggestions, which he doesn't have to obey.

Maybe this aspect of the game isn't really that experimental - certainly none of the reviewers picked up on it. But given that nobody complained about it, I think the choice of first-person works well and is probably something that should be considered more as a sensible default voice for interactive fiction.

**Experiment 5 - Special effects**

[![Text Effect](images/effect.png)](http://blog.textadventures.co.uk/wp-content/uploads/2013/11/effect.png)

There are various screen transitions throughout the game - I liked the idea of it having something of a graphical feel, even though it was only using text.

I'll talk about the implementation details of the effects in a separate blog post - they're nothing more than relatively simple JavaScript. It would be easy to go overboard and include too much of this kind of thing, but most of the reviews have been positive about these. I think it shows that HTML offers some interesting visual capabilities which most IF hasn't got round to exploring yet.

**Reviews**

Here are all of the publicly available reviews and mentions I came across (let me know if I've missed any and I'll update the list).

- [Indie Statik](http://indiestatik.com/2013/09/30/interactive-fiction-competition-2013/): "Moquette is a droll game that encapsulates the act of travelling nowhere in particular and the thoughts you amuse yourself with remarkably well"
- [Francesco Cordella](http://www.avventuretestuali.com/2013/10/01/if-comp-2013-reviews-moquette/): "Moquette is too slow to thrill"
- [Robert DeFord](http://rdefor5.wix.com/if-by-robert-deford#!if-comp-2013-reviews/c15w5): "I'm not sure I liked it, but I can see where some people would"
- [Michael Martin](https://hkn.eecs.berkeley.edu/~mcmartin/if/reviews/review13.html#r3): "I kept trying to have goals and the game was very ambiguous about whether or not I should... I can't make up my mind whether to be annoyed or impressed"
- [Puppystuff](http://inurashii.tumblr.com/post/63681317970/ifcomp-2013-review-moquette): "It’s about some asshole with a hangover who sits on the London subway and silently judges everyone after deciding to skip work"
- [PaulS](http://www.intfiction.org/forum/viewtopic.php?f=32&t=9549&p=58959#p58777): "in the end it doesn't work, because it forces the player to make endless unimportant choices, but gives no opportunity to make important ones"
- [Doug Egan](http://dougegan2.blogspot.co.uk/2013/10/ifcomp-2013-reviews-moquette.html): "I expect it will only finish near the fiftieth percentile as a competition entry" (good call!)
- [Emily Short](http://emshort.wordpress.com/2013/10/16/if-comp-2013-moquette-alex-warren/): "I had a hard time feeling deeply about someone whose chief personal characteristic is a tendency to editorialize about other people’s hat-wear faux pas"
- [Sam Kabo Ashwell](http://maga-dogg.livejournal.com/483352.html): "Game designers, take note: if you ever come up with a premise that boils down to 'okay, so the player can't really do anything significant and is just hanging out getting bored, right, but every now and then some plot happens', then you should throw it out."
- [Bainespal](http://transcendentdestinies.blogspot.co.uk/2013/10/if-comp-2013-moquette-by-alex-warren.html): "its plot is both too eclectic and too unambitious to be interesting ... Moquette is probably more of a technology piece than a literary piece, but it still manages to evoke the modern social condition"
- [The Xenographer](http://www.intfiction.org/forum/viewtopic.php?f=32&t=9690#p59519): "I've always thought that intentionally boring your audience is a tough thing to do well and in most cases should probably be avoided"
- [Wade Clarke](http://ifcomp2013alawadeclarke.blogspot.com.au/2013/10/moquette-by-alex-warren.html): "Overall, a mix of good elements and others which didn't work so well"
- [Pissy Little Sausages](http://pissylittlesausages.wordpress.com/2013/11/08/if-comp-13-alex-warrens-moquette/): "Yeah, that was pretty great.  Docking it three points for not letting me get my cock out, though."
- [Deirdra Kiai](http://www.intfiction.org/forum/viewtopic.php?f=32&t=9912): "Impressive tech demo. Not really a fan of the protagonist dude's narrative voice; he came across to me as a judgemental prat."
- [Ricordius](http://www.ricordius.com/others/ifcomp13/moquette.htm): "Eventually, Story Happens. In the meantime, until Story Happens, I'm just blindly hopping on and off these trains. I suppose Story Continues eventually, but I no longer cared. ... But this is Quest. It means that Quest is capable of some seriously eye-opening shenanigans that I had not thought that system capable of before. And that, in spite of the very flawed central core, means I am still impressed."
- [Eric Olson](http://cerxi.tumblr.com/post/65984938396): "I still have hardly an inkling of what this was supposed to make me feel outside of frustrated at the amount of my time it wasted."
- [ifwizz.de](http://ifwizz.de/moquette-\(2013-en\).html?ua=review_152#review_152) (German - a quote from Chrome's translation: "The language ripples then, sometimes sparkles forth with unexpected impressions and insignificant observations here and there, rocking on to thoughts that suggest the image of a man who wants to break out of the eternal recurrence of the same in his gray life.")
- Other reviews and ratings on Moquette's [IFDB page](http://ifdb.tads.org/viewgame?id=gk0diy1aawlqtun)

I also tried a little to get the word out beyond the normal IF circles. With the game set on the London Underground, it made sense to reach out to London blogs - it got small mentions on [Londonist](http://londonist.com/2013/10/extra-extra-695.php) and [Diamond Geezer](http://diamondgeezer.blogspot.co.uk/2013/10/fivelinks.html). The competition rule requiring authors not to discuss games publicly hurt a bit here - if we can't promote our own games (and the competition in general), who will? Who will take responsibility for plugging the IFComp outside of the circles of people who already know about it?

**Finally**

See how many times you can spot me in this highly appropriate video. (If you don't know what I look like, check out my [Twitter profile](http://twitter.com/alexwarren))

\[youtube=http://www.youtube.com/watch?v=8jPyg2pK11M&w=420&h=315\]
