---
layout: post
title: Poem About the Halting Problem
tags:
- random
- programming
---

![Alan Turing's Halting Problem](/images/haltingproblem-alan.jpg)

Last quarter, I took a class called [CS103: Mathematical Foundations of Computing](http://www.stanford.edu/class/cs103/). The TAs sent us a wonderful little poem about the [Halting Problem](http://en.wikipedia.org/wiki/Halting_problem) that was pretty clever and funny. It helps to clarify what can be quite a difficult concept for many students to wrap their heads around.

I realize this won't make sense for anyone who's not a computer science person, so if that's you then please enjoy this [hamster eating a carrot](http://www.youtube.com/watch?v=LY7ji99QJ4I).

Ok, if you're still here, then enjoy:

> SCOOPING THE LOOP SNOOPER
> <br>A proof that the Halting Problem is undecidable
> <br>Geoffrey K. Pullum
> <br>(School of Philosophy, Psychology and Language Sciences, University of Edinburgh)
> <br>
> <br>No general procedure for bug checks succeeds.
> <br>Now, I won't just assert that, I'll show where it leads:
> <br>I will prove that although you might work till you drop,
> <br>you cannot tell if computation will stop.
> <br>
> <br>For imagine we have a procedure called P
> <br>that for specified input permits you to see
> <br>whether specified source code, with all of its faults,
> <br>defines a routine that eventually halts.
> <br>
> <br>You feed in your program, with suitable data,
> <br>and P gets to work, and a little while later
> <br>(in finite compute time) correctly infers
> <br>whether infinite looping behavior occurs.
> <br>
> <br>If there will be no looping, then P prints out 'Good.'
> <br>That means work on this input will halt, as it should.
> <br>But if it detects an unstoppable loop,
> <br>then P reports 'Bad!' --- which means you're in the soup.
> <br>
> <br>Well, the truth is that P cannot possibly be,
> <br>because if you wrote it and gave it to me,
> <br>I could use it to set up a logical bind
> <br>that would shatter your reason and scramble your mind.
> <br>
> <br>Here's the trick that I'll use -- and it's simple to do.
> <br>I'll define a procedure, which I will call Q,
> <br>that will use P's predictions of halting success
> <br>to stir up a terrible logical mess.
> <br>
> <br>For a specified program, say A, one supplies,
> <br>the first step of this program called Q I devise
> <br>is to find out from P what's the right thing to say
> <br>of the looping behavior of A run on A.
> <br>
> <br>If P's answer is 'Bad!', Q will suddenly stop.
> <br>But otherwise, Q will go back to the top,
> <br>and start off again, looping endlessly back,
> <br>till the universe dies and turns frozen and black.
> <br>
> <br>And this program called Q wouldn't stay on the shelf;
> <br>I would ask it to forecast its run on itself.
> <br>When it reads its own source code, just what will it do?
> <br>What's the looping behavior of Q run on Q?
> <br>
> <br>If P warns of infinite loops, Q will quit;
> <br>yet P is supposed to speak truly of it!
> <br>And if Q's going to quit, then P should say 'Good'
> <br>--- which makes Q start to loop! (P denied that it would.)
> <br>
> <br>No matter how P might perform, Q will scoop it:
> <br>Q uses P's output to make P look stupid.
> <br>Whatever P says, it cannot predict Q:
> <br>P is right when it's wrong, and is false when it's true!
> <br>
> <br>I've created a paradox, neat as can be ---
> <br>and simply by using your putative P.
> <br>When you posited P you stepped into a snare;
> <br>Your assumption has led you right into my lair.
> <br>
> <br>So where can this argument possibly go?
> <br>I don't have to tell you; I'm sure you must know.
> <br>By reductio, there cannot possibly be
> <br>a procedure that acts like the mythical P.
> <br>
> <br>You can never find general mechanical means
> <br>for predicting the acts of computing machines.
> <br>It's something that cannot be done. So we users
> <br>must find our own bugs. Our computers are losers!