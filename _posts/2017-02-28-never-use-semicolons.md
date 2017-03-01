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

**ASI will be with us forever. It's about time you [learned how it works](http://inimino.org/~inimino/blog/javascript_semicolons).** Not to worry: ASI is fully-specified in the ECMAScript language standard and all browsers implement it exactly the same way.

At the very least, **consider using a linter that checks for unexpected ASI behavior**. ESLint has a rule called [`no-unexpected-multiline`](http://eslint.org/docs/rules/no-unexpected-multiline) which catches unexpected ASI behavior. And once you’re using a linter, it doesn’t matter whether you use or omit semicolons since **the linter keeps you safe**.

### The argument for "never use semicolons"

It's not actually that simple to “always use semicolons”. There are actually many edge cases where you still aren't supposed to use a semicolon! For example:

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

There are actually many more “edge cases” to keep in mind with "always use semicolons" than with “never use semicolons”.

If you “never use semicolons”, there's only one rule: **Never start a line with `[`, `(`, or `` ` ``**

In those cases, you simply prepend a `;` like this:

{% highlight js %}
;[1, 2, 3].forEach(bar)
{% endhighlight %}

However, if you frequently write code like this, you may be trying to be needlessly
clever. This is actually much simpler:

{% highlight js %}
const nums = [1, 2, 3]
nums.forEach(bar)
{% endhighlight %}

And if you use a linter like [`standard`](http://standardjs.com/), then you don't need to remember anything as unexpected ASI is reported as an error.

**The full list also includes some additional characters which would never actually appear at the start of an expression in real-world code: `+`, `*`, `/`, `-`, `,`, `.`*

### Further reading

- [JavaScript Standard Style](http://standardjs.com/)
- [An Open Letter to JavaScript Leaders Regarding Semicolons](http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding)
- [JavaScript Semicolon Insertion: Everything you need to know](http://inimino.org/~inimino/blog/javascript_semicolons)
- [Are Semicolons Necessary in JavaScript? [YouTube]](https://www.youtube.com/watch?v=gsfbh17Ax9I)
