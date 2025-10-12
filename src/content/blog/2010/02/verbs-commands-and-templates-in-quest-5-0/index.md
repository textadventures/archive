---
title: "Verbs, Commands and Templates in Quest 5.0"
date: 2010-02-03
categories: 
  - "quest"
---

**Note: this information is now out of date. Please see [the updated article on the Quest 5 wiki](http://quest5.net/index.php?title=Verbs,_commands_and_templates)**

Quest 5.0 currently follows relatively similar principles to previous versions when it comes to processing player input. I say "currently" as this may change over the course of the technical previews and beta versions, and I say "relatively" as although based on the "old" system, there is a lot more flexibility and power in the new way of doing things. In a nutshell, we retain the concepts of **verbs** and **commands**.

Here is a simple command:

```
<command command="test">
  msg ("Hello")
</command>
```

This allows the user to type "test", and in response prints "Hello". So far, very similar to Quest 4.

Verbs let you add "doing" words, to let players interact with objects. For example:

```
<verb command="eat">You cannot eat that.</verb>

```

This would let the player type "eat crisps", and provide a sensible response for when the player tries to eat other objects in the game.

**Templates**

Core.aslx defines the behaviour for standard verbs such as "look at", "speak to" and so on, but the actual text for the verbs themselves comes from the language library (English.aslx). To have the behaviour in one place but the verb itself in another, we have templates, which look like this in English.aslx:

```
<template name="eat">eat</template>
<template name="cannot_eat">You cannot eat that.</template>
```

A French version might look like:

```
<template name="eat">mangez</template>
<template name="cannot_eat">Vous ne pouvez pas manger ça.</template>
```

We use square brackets in Core.aslx to dynamically replace text with the template. So Core.aslx might have a line like this to define the verb, which will behave in exactly the same way as the verb in the above example:

```
<verb command="[eat]">[cannot_eat]</verb>
```

As well as using square brackets, for <command> tags you can use command templates. These let you specify multiple ways of expressing the same command, which each resolve to the same template. For example, English.aslx might define an "inventory" command like this:

```
<commandtemplate name="inventory">i</commandtemplate>
<commandtemplate name="inventory">inv</commandtemplate>
<commandtemplate name="inventory">inventory</commandtemplate>
```

That way, "i", "inv" and "inventory" all resolve to the same template "inventory", and Core.aslx can define the behaviour of the command like this:

```
<command template="inventory"> ...
```

**Matching objects in commands**

For more complicated commands, such as "put apple on table", you can match objects within a command. Quest 5 lets you use regular expressions for this:

```
<commandtemplate name="put"><![CDATA[
  put (?<object1>.*) (on|in) (?<object2>.*)
]]></commandtemplate>
```

This may look slightly frightening at first glance, but it's pretty simple underneath the scary syntax. The "<!\[CDATA\[" section is there because we need to use "<" and ">" characters for the named groups in the regular expression, but we will have an invalid XML file if we don't use a CDATA section.

For any named group with a name starting with "object", Quest tries to match it to an object in the current visible scope (e.g. the objects in the current room, plus the objects in the inventory - I'll be discussing scopes in more detail in a future post). You can also have named groups starting with "exit" to match available exits.

When the script for the command runs, local variables "object1" and "object2" are set to the objects specified in the command, so you can access their properties directly using "object1.parent" etc.

It may be the case that this mechanism is refined as we go through the development process, as regular expressions are probably overkill. It might be nice to simplify the named group syntax so that you can write "put #object1# (on|in) #object2#" in a similar way to Quest 4.x.

**Dynamic Templates**

Templates are used for all the standard output from Core.aslx. This includes the standard error messages, such as "I don't understand your command".

A _dynamic_ template is a template that can call functions and read properties. This is useful for dynamic responses such as when the player tries to take an untakeable object. Usually, a response of "You can't take it" is sufficient, but what if the object is a female character? Dynamic templates to the rescue - they are essentially functions that return a string value, for example:

```
<dynamictemplate name="TakeUnsuccessful">
  "You can't take " + object.article + "."
</dynamictemplate>
```

A female character should have their "article" property set to "her", so this will print "You can't take her."

To print this from a script, call the DynamicTemplate function, which takes two parameters:

```
msg (DynamicTemplate("TakeUnsuccessful", object))
```

**Note: this information is now out of date. Please see [the updated article on the Quest 5 wiki](http://quest5.net/index.php?title=Verbs,_commands_and_templates)**
