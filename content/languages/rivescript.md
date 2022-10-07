title=Rivescript
tags=language, web
summary=A RiveScript interpreter for JavaScript. RiveScript is a scripting language for chatterbots.
~~~~~~

[Website](https://www.rivescript.com/) | [Language Definition](https://github.com/aichaos/rivescript-wd)

* [Javascript Source](https://github.com/aichaos/rivescript-js)
* [Python Source](https://github.com/aichaos/rivescript-python)
* [Go Source](https://github.com/aichaos/rivescript-go)
* [Java Source](https://github.com/aichaos/rivescript-java)
* [Perl Source](https://github.com/aichaos/rivescript-perl)

### What is RiveScript?
RiveScript is a simple scripting language for giving intelligence to chatbots and other conversational entities.

It's a plain text, line-based scripting language with goals of being simple to learn, quick to type, and easy to read and maintain. This is in contrast to other chatbot languages that require you to read and write ugly XML code (like AIML), or memorize lots of random symbols and "line noise" to write and read your code (like ChatScript).

### Let's Meet RiveScript
Without further ado, here is what RiveScript looks like.
RiveScript keeps simple replies simple, for example:

```
+ hello bot
- Hello, human!
```

This will add a reply so that when a human says the words "Hello bot", the bot would respond with "Hello, human!"

With more advanced RiveScript code we can learn and repeat user variables and use more complicated trigger matching patterns:

```
+ my name is *
- <set name=<formal>>I will remember to call you <get name>.

+ (what is|do you know) my name
* <get name> != undefined => Yes, your name is <get name>!
- I don't know your name.
```

You can learn more in the RiveScript Tutorial.
