---
layout: post
class: post
title: Never Use Semicolons
summary: "Always using semicolons will not keep you safe from ASI"
tags:
- node.js
- javascript
---

*This post isn't intended to reopen the age-old JavaScript debate, but merely to serve as a reference when people ask why [JavaScript Standard Style](http://standardjs.com/) enforces a "never use semicolons" rule.*

**The idea that you can “always use semicolons” and not worry about Automatic Semicolon Insertion (ASI) is completely incorrect.**

All JavaScript developers absolutely must understand ASI, even those who "always use semicolons". Take this example:

{% highlight js %}
function foo () {
  return
    {
      bar: 1,
      baz: 2
    };
}
{% endhighlight %}

Woops, you remembered to put a semicolon, but *doesn’t matter*. ASI kicked in and changed your code to:

{% highlight js %}
function foo () {
  return; // <-- ASI adds a semicolon here. You now have a bug!
    {
      bar: 1,
      baz: 2
    };
}
{% endhighlight %}

So, it’s misleading to tell people that if they just “always use semicolons” their code is safe from surprising ASI behavior.

ASI is fully-specified in the ECMAScript language standard, and all browsers implement it exactly the same way.

**ASI will be with us forever. It's about time you learned how it works.**

The safest thing to do is to **use a linter that checks for unexpected ASI behavior**. ESLint has a rule for this called [`no-unexpected-multiline`](http://eslint.org/docs/rules/no-unexpected-multiline). And once you’re using a linter, it doesn’t matter whether you use or omit semicolons since **the linter keeps you safe**.

### Why this whole line of reasoning is silly

And finally, even if you “always use semicolons”, there are arguably even more “edge cases” that if you “never use semicolons”. For example:

{% highlight js %}
function foo () {
  return 42; // ok
};           // <-- AVOID!
{% endhighlight %}

{% highlight js %}
var foo = function () {
}; // ok
{% endhighlight %}

And what about these cases:

{% highlight js %}
class Foo {
  constructor () {
    if (baz) {
      return 42; // ok
    };           // <-- AVOID!
    return 12;   // ok
  };             // <-- AVOID!
};               // <-- AVOID!
{% endhighlight %}

This is why "always use semicolons" isn't the "magic bullet" that it's often made
out to be.

### The alternative

There are actually **fewer rules to remember** if you just “never use semicolons”.

There's actually just one: **never start a line with `[` or `(`**.

In those cases, you prepend a `;`. Simple.

{% highlight js %}
;[1, 2, 3].forEach(bar)
{% endhighlight %}

However, if you frequently write code like this, you may be trying to be too clever
for your own good. This is better:

{% highlight js %}
const nums = [1, 2, 3]
nums.forEach(bar)
{% endhighlight %}

### Further reading

- [JavaScript Standard Style](http://standardjs.com/)
- [An Open Letter to JavaScript Leaders Regarding Semicolons](http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding)
- [JavaScript Semicolon Insertion: Everything you need to know](http://inimino.org/~inimino/blog/javascript_semicolons)
- [Are Semicolons Necessary in JavaScript? [YouTube]](https://www.youtube.com/watch?v=gsfbh17Ax9I)
