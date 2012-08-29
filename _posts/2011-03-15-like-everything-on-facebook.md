---
layout: post
title: Like Everything on Facebook with this JavaScript Bookmarklet
github: https://github.com/feross/Facebook-Like-Everything
tags:
- my-code
- facebook
---

Do you want to **like every post and comment** that you see on Facebook all at once? Well, it's your lucky day.

Drag the link below to your Bookmarks Bar and click it to **automatically like all the posts and comments** on the page you're on.

<strong><a href="javascript:var s=document.getElementById('happyScript');if(s){s.parentNode.removeChild(s);} s=document.createElement('script');s.setAttribute('src','http://feross.org/hacks/facebook-like-everything/script.js');s.setAttribute('type','text/javascript');s.setAttribute('id','happyScript');document.body.appendChild(s);void(0);">I Like Everything</a></strong> <-- drag me to your bookmarks bar, go to Facebook, then click me!

## Why'd I do this?

Some friends and I were playing around with Facebook's new comment-on-enter feature and we got a [large 70+ comment thread](https://www.facebook.com/ferossa/posts/1918353562356) going, then people began to **like every comment in the thread**, so the idea for this JavaScript bookmarklet was born. I whipped it up in 15 minutes.

![Facebook Like Bomb - Tons of notifications.](/images/like-bomb.png)

## Source Code

If you are curious how this works, here is the abbreviated source code:

{% highlight javascript %}
var sad = document.getElementsByTagName('button');
var happy = [];

// Select only the Like buttons.
// Convert the sad NodeList to a happy Array.
for (var i = 0; i < sad.length; i++) {
    if (sad[i] && (sad[i].title == 'Like this comment' || sad[i].title == 'Like this item')) {
        happy.push(sad[i]);
    }
}

function happyFn(happy) {
    if (happy.length <= 0) {
        return;
    }
    happy[0].click();

    // Wait for each Like to be processed before trying the next.
    // Facebook enforces this requirement.
    window.setTimeout(function() {
        happyFn(happy.splice(1));
    }, 800);
}
happyFn(happy);
{% endhighlight %}

[Get the full source code on GitHub.](https://github.com/feross/Facebook-Like-Everything)

## Bookmarklet Source

And here is the source of the bookmarklet, perfect for copy-pasting into a convenient bookmark. Or just, <a title="I Like Everything" href="javascript:var s=document.getElementById('happyScript');if(s){s.parentNode.removeChild(s);} s=document.createElement('script');s.setAttribute('src','http://feross.org/hacks/facebook-like-everything/script.js'); s.setAttribute('type','text/javascript');s.setAttribute('id','happyScript');document.body.appendChild(s);void(0);">drag this link</a> to your bookmarks bar.

{% highlight javascript %}
javascript:var s = document.getElementById('happyScript');
if (s) {
    s.parentNode.removeChild(s);
}
s = document.createElement('script');
s.setAttribute('src', 'http://feross.org/hacks/facebook-like-everything/script.js');
s.setAttribute('type', 'text/javascript');
s.setAttribute('id', 'happyScript');
document.body.appendChild(s);
void(0); // don't redirect
{% endhighlight %}

## Update

I just updated the bookmarklet to show some UI about the progress of your "like bomb", as well as a button to stop the liking if you suddenly have a change of heart. Everyone's bookmarklets should be updated automatically. [Go here](http://feross.org/hacks/facebook-like-everything/script.js) if you want to read the updated source code.

## Update 2

I just fixed a bug in Firefox where clicking the bookmarklet causes the browser to redirect to a page with the message **[object HTMLScriptElement]** shown. You should update your bookmarklet. It turns out that you need to end all JavaScript code within links and bookmarklets with **void(0);** or else the browser will try to follow the link.

## Update (8/23/2012)

Not sure if this still works anymore since Facebook Timeline came out. If anyone cares to modify it and send a pull request on [Github](https://github.com/feross/Facebook-Like-Everything), I'll accept it.