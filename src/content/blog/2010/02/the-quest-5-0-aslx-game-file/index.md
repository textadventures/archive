---
title: "The Quest 5.0 .aslx game file"
date: 2010-02-01
categories: 
  - "quest"
---

Quest 5.0 uses a new XML-based file format, and files have an .aslx extension.

Here is a simple example:

```
<asl version="500">
  <include ref="English.aslx"/>
  <include ref="Core.aslx"/>

  <game name="Test ASLX Game"/>

  

    <exit name="east" to="hall"/>
  </object>

  

  

    <exit name="west" to="hall"/>
  </object>

</asl>

```

This example defines what in previous versions of Quest would have been three rooms - a lounge, a hall and a kitchen. In Quest 5.0 these are just objects, and they themselves contain the objects "sofa" and "sink". By nesting <object> elements, you can define further objects inside objects.

**Libraries**

There are two libraries included in this example:

- **Core.aslx** provides the default Quest functionality, including: showing room descriptions, implementing default verbs such as "take", "drop" and "use", opening and closing containers, and deciding which objects are currently available to the player.
- **English.aslx** provides the English text for the built-in default responses, and the names of the verbs whose behaviour is defined in Core.aslx. This means Core.aslx is language-neutral - if you wanted to make a game in German or Spanish, just translate English.aslx and plug it in to your game.

**Properties**

Each object's properties are defined in the XML. In previous versions of Quest, there were only two data types - "properties" were strings, and "actions" were scripts. To make things more confusing, the properties and actions for an object were separate from the tags specified in the ASL file, so you couldn't always read all the information about an object from a script.

In Quest 5.0, everything has been unified into properties, and there are more data types available, with the XML "type" attribute used to specify the type. If no type is specified, the string type is assumed, as with the sink's "look" property in the above example. An exception is if there is no data in the XML tag, in which case a boolean "true" is assumed instead - as in the "start" property for the lounge.

The available types are currently:

- string
- double
- int
- boolean
- script
- list (of strings)
- list (of objects)
- object
- exit
- null

The type of a property can determine the behaviour of an object. In the above example, the sofa's "take" property is a script, so that will run when the player types "take sofa". If the "take" property is a string, the object will be taken and the string will be printed. This behaviour is defined in Core.aslx.

Properties can change type while the game is running, by simply setting them to a new value.

**Additional properties**

When Quest loads the game, it will set the following additional properties on objects:

- **name** - string, from the "name" attribute specified for the <object> tag
- **parent** - reference to the containing object, or null if the object has no parent

**The player object**

The player is itself an object in Quest 5.0. Here, the lounge has the property "start". Core.aslx defines the player object, and when the game starts it will move the player into the start room by setting the player's "parent" property to the first object that has a "start" property set to "true".
