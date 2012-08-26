---
layout: post
title: Thoughts on free will
---

You cannot control the next thought that will pop into your head. Seriously!

In fact, using [functional magnetic resonance imaging](http://en.wikipedia.org/wiki/Functional_magnetic_resonance_imaging) (fMRI) it is possible to see your decisions before you realize that you've made them. Researchers asked people to press a button using their left or right index fingers while monitoring their real time brain activity using fMRI. [The results](http://www.nature.com/news/2011/110831/full/477023a.html) were surprising:

> The conscious decision to push the button was made about a second before the actual act, but the team discovered that **a pattern of brain activity seemed to predict that decision by as many as seven seconds. Long before the subjects were even aware of making a choice, it seems, their brains had already decided.** (from [Nature](http://www.nature.com/news/2011/110831/full/477023a.html))

These results are shocking. They imply that all decisions are out of our control, subject to the whims of the gray matter in our heads.

![Pinnocchio](/images/pinocchio.jpg)

I spent a lot of time thinking about this (always [a dangerous pastime](http://www.youtube.com/watch?v=PK3x2DOoJIc#t=234s), hehe). I came up with a programming metaphor that makes a pretty convincing argument against the existence of free will. I thought it was interesting enough to be worth sharing, so here we go:

## The human mind is a self-modifying function

**Every human mind is a [function](http://en.wikipedia.org/wiki/Function_(computer_science\)).** We take as input the sensory experience of the world around us. And we produce as output the electric signals that control our body and let us take action.

Of course, we don't control the parameters that we are invoked with. The world outside, the people we meet, the problems we face are all inputs that we (as functions) must consume; they are things that we must make decisions about -- how do I react when my friend says hi? how do I react when I see a car driving directly at me? etc...

However, humans are not merely normal functions. We can change through learning. **Thus, we are self-modifying functions -- we have the ability to re-write ourselves based on the input we receive.**

![Escher's drawing hands](/images/drawing-hands.jpg)

## Learning

If we touch a stove and burn our hand, we use our knowledge of causation (i.e. touching the hot stove *caused* pain), past experiences with pain (pain is something to avoid), and learning strategies (how to process new information into a useful format for storage) to modify ourselves. Thus, the next time we are presented with a hot stove we won't decide to touch it a second time.

Interestingly, this is not true for everyone. Some people will still touch the stove a second time and burn themselves. Why? Because their memory of past experiences, their learning tools, or something else in their mind isn't working correctly. Their function is buggy and for whatever reason doesn't have the mechanism to rewrite itself properly (i.e. learn).

So, continuing with the analogy of humans as self-modifying functions, we have, in some sense, the ability to change ourselves. But, in the end, it's still the contents of the function body which determines how we react to the input we are given. The function body decides how to process the input, and thus, what we learn from the experience.

**Thus, the tools you currently have in your brain are inherently limiting.** You can turn inputs into permanent knowledge, but only using the tools and knowledge you have available to you now. So, the pseudo-code for your brain would be an event loop that looks like this:

{% highlight javascript %}
var brain = function() { /* Your genes define your initial brain state */ };

while (true) {
  brain = brain( get_sensory_input() ); // Returns a new function that is different from before
  brain.act(); // Act based on your current brain state
}
{% endhighlight %}


## You have no free will

When you think about it like this, you see that **your current brain state determines your next brain state**. Thus, your current brain state was determined by your previous brain state. Using induction, you can take this all the way back to earliest childhood.

Even if you try to improve or change yourself through learning, meditation, or introspection, you are still limited by the physiology of your brain. For example, even if you introspect really intensely, you can't really ever free yourself of your inherent limitations. Even thoughts about thought itself (i.e. [metacognition](http://en.wikipedia.org/wiki/Metacognition)) are still thoughts, controlled by the physiology of your brain, your past experiences, your emotional state, etc. Metacognition and introspection create a convincing illusion of free will.

Thus, I claim that the cognitive "function" you were born with, combined with inputs from your environment, ultimately determines who you are today. **Since you do not determine your own starting state, nor the inputs you receive, you aren't really responsible for your current self, your achievements, or your faults.** In the end, all mental processes are out of your control.

## What are the implications of this?

None, really. This discussion isn't particularly practical since there is no easy method to verify the validity of any of these claims. **It's just interesting to think about.**

I don't think that believing or disbelieving in free will should change your behavior. In fact, believing that you don't have any free will could probably only change your behavior for the worse. Discovering the true nature of free will is important not for any practical reason, but for the same reason that discovering how any other part of reality works is important. It brings us closer to the truth, to understanding our lives and our place in the universe.

## More on this subject

If you want to think about this stuff more, I highly recommend this talk: [Sam Harris on "Free Will"](http://www.youtube.com/watch?v=pCofmZlC72g#t=1m50s). It is brilliant. Sam lays out all the main arguments against the existence of free will in a clear, persuasive manner.

Also, I recently watched a Google Tech Talk that contained a lot of great information on how brains in young children work. It's called [Think faster, focus better, and remember more](http://www.youtube.com/watch?v=UyPrL0cmJRs). It only strengthens my belief in this self-modifying function hypothesis.

Lastly, the New York Times recently published this: [Neuroscience and Moral Responsibility](http://www.nytimes.com/2012/07/29/opinion/sunday/neuroscience-and-moral-responsibility.html).

If you have any thoughts on this post, please leave a comment. I'm interested to hear what others think about this idea.

## Update (Aug 12, 2012)

My friend Mikee Nguyen sent me this excellent, relevant clip from the film [Waking Life](http://www.imdb.com/title/tt0243017/):

<iframe width="560" height="315" src="http://www.youtube.com/embed/veqkUUOlLLE" frameborder="0" allowfullscreen></iframe>