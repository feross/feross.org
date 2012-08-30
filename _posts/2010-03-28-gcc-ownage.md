---
old: true
layout: post
title: >
  GCC Easter Egg: C++ Undefined Defined Behavior
tags:
- programming
- random
---

Check out this little [GCC](http://en.wikipedia.org/wiki/GNU_Compiler_Collection) gem that I just <s>discovered</s> [read about](http://www.microsoft.com/downloads/details.aspx?familyid=A436B63B-8EB4-4914-8041-B914B6E0992C&amp;displaylang=en).

In **GCC 1.17**, when the compiler encountered specific forms of undefined behavior (unknown/not implemented #pragmas), here’s the code it executed:

{% highlight c %}
execl("/usr/games/hack", "#pragma", 0); // try to run the game NetHack

execl("/usr/games/rogue", "#pragma", 0); // try to run the game Rogue

// try to run the Tower's of Hanoi simulation in Emacs.
execl("/usr/new/emacs",  "-f","hanoi","9","-kill",0);

execl("/usr/local/emacs","-f","hanoi","9","-kill",0); // same as above

fatal("You are in a maze of twisty compiler features, all different");[/c]
{% endhighlight %}

When GCC identified "bad" C++ code, it tried to start [NetHack](http://en.wikipedia.org/wiki/NetHack), [Rogue](http://en.wikipedia.org/wiki/Rogue_%28computer_game%29), or [Towers of Hanoi](http://en.wikipedia.org/wiki/Tower_of_Hanoi#Applications). Failing all three, it would just print out a nice, cryptic error message. Wow.

This just goes to show you that when the official C++ specification talks about undefined behavior, they mean business:

> [Undefined behavior is] behavior, such as might arise upon use of an erroneous program construct or erroneous data, for which the Standard imposes no requirements.

No requirements indeed.

## Update

It turns out this is actually *implementation-defined* behavior, which is [slightly different](http://en.wikipedia.org/wiki/Undefined_behavior) than *undefined behavior*. Implementation-defined behavior actually requires the compiler to document what it does, but there are no requirements on what it can do.