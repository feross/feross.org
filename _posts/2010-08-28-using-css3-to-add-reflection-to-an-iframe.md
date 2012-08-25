---
layout: post
title: Using CSS3 to add reflection to an iframe
---

Mozilla just landed a really cool new extension to the CSS `background-image` property in the [Firefox 4 nightlies](http://nightly.mozilla.org/). The new extension allows you to use arbitrary DOM elements as background images. The syntax looks like this:

{% highlight css %}
#iWantBackground {
    background: -moz-element(#sourceElementID);
}
{% endhighlight %}

`-moz-element` lets you use virtually any element as a background, including iframes and canvas elements. I wanted to play around with it a bit, so I hacked a quick demo of an iframe with a live-updating reflection. It borrows heavily from the  code in [this excellent article](http://hacks.mozilla.org/2010/08/mozelement/).

**[View the demo](/hacks/iframe-reflection/?url=http://en.wikipedia.org/wiki/Color)**
(Works in Firefox 4+ only)

I know that lots of my readers aren't running the latest Firefox nightly, so here's a screenshot of what the reflection effect looks like:

![-moz-element  Reflection on iframe](/images/moz-element-reflection-on-iframe.png)

## Here’s the code I wrote

{% highlight css %}
<style type="text/css" media="screen">

    body {
        background: #000;
    }

    #main {
        margin: 30px auto 0 auto;
        width: 800px;
    }

    #source {
        display: block;
        width: 800px;
        height: 480px;
        border: 0;
    }

    #reflection {
        margin-top: 5px;
        background: -moz-element(#source) bottom left no-repeat;
        -moz-transform: scaleY(-1);
        height: 200px;
        border: 0;
        mask: url(#reflection-mask);
    }

</style>
{% endhighlight %}

{% highlight html %}
<div id="main">
    <iframe id="source" src="http://en.wikipedia.org/wiki/Color"></iframe>
    <div id="reflection"></div>
</div>

<!-- SVG from http://hacks.mozilla.org/2010/08/mozelement/ -->
<svg>
  <mask id="reflection-mask" maskContentUnits="objectBoundingBox">
    <rect x="-0.1" width="1.2" height="1" fill="url(#reflection-gradient)"/>

  </mask>
  <linearGradient id="reflection-gradient" gradientUnits="objectBoundingBox" x1="0" y1="1" x2="0" y2="0">
    <stop stop-color="white" stop-opacity="0.6" offset="0"/>
    <stop stop-color="white" stop-opacity="0" offset="100%"/>
  </linearGradient>
</svg>
{% endhighlight %}

That's it!