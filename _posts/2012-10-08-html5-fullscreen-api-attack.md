---
layout: post
class: post
title: "Using the HTML5 Fullscreen API for Phishing Attacks"
tags:
- web-dev
- my-code
- security
dynamic: true
github: https://github.com/feross/fullscreen-api-attack
hn: http://news.ycombinator.com/item?id=4629906

demo: >

  <link rel="stylesheet" href="/hacks/fullscreen-api-attack/css/style.css">
  <link rel="stylesheet" href="/hacks/fullscreen-api-attack/css/facebox.css">

  <div id="spoofHeader">
    <div id="spoofMenu"></div>
    <div id="spoofBrowser"></div>
  </div>

  <div id="spoofSite">
    <img src="/hacks/fullscreen-api-attack/img/boa.png">
  </div>

  <div id="phished" style="display: none;">
    <p>
      <b>Whoa, that was a close one!</b><br><br>
      <img src="/hacks/fullscreen-api-attack/img/surprised-gasp-l.png"><br><br>
      <b>Don't get phished.</b> You're looking at fake OS and browser UI.
    </p>
  </div>

  <script src="/hacks/fullscreen-api-attack/js/libs/jquery-ui-1.8.18.custom.min.js"></script>
  <script src="/hacks/fullscreen-api-attack/js/libs/facebox.js"></script>
  <script src="/hacks/fullscreen-api-attack/js/libs/browser-detect.js"></script>
  <script src="/hacks/fullscreen-api-attack/js/libs/fullscreen-api-shim.js"></script>

  <script src="/hacks/fullscreen-api-attack/js/script.js"></script>
---

*Quick!* Click this link to <a class="spoofLink" href="https://www.bankofamerica.com">Bank Of America</a>. There's nothing fishy about it at all! *I promise!*

Go ahead -- hover your mouse over the link to see where it goes. You'll find that it's a completely normal link to `https://www.bankofamerica.com`.

There is only one way to find out if I'm telling the truth -- *just <a class="spoofLink" href="https://www.bankofamerica.com">click the link</a> already!*

**[NOTE: The demo only works with a normal click on the link. No "Open in New Tab" or middle-click.]**

## What just happened?

Ok, I lied -- the link was pretty fishy afterall. When you click on the link, you don't actually navigate to `https://www.bankofamerica.com`. Instead, your browser automatically enters fullscreen mode and I load a fake version of Bank of America's website (my demo uses a screenshot, but attackers would use a working website).

The fake Bank of America site is adorned with OS and browser UI that indicates you are actually on `https://www.bankofamerica.com`. Of course, these UI components are just screenshots too! However, they're pretty convincing because they actually *take into account the OS and browser you are using!*

Also, **note the green lock** in the location bar, which indicates that TLS (i.e. HTTPS) is enabled.

## The "Fullscreen API" explained

The **Fullscreen API** (see [W3C docs](http://dvcs.w3.org/hg/fullscreen/raw-file/tip/Overview.html) and [MDN docs](https://developer.mozilla.org/en-US/docs/DOM/Using_full-screen_mode)) allows web developers show web content that fills up the user's screen completely. You've seen this functionality in action whenever you watch a fullscreen video on YouTube (if you use their [new HTML5 player](https://www.youtube.com/html5), which you should do!) or look at a fullscreen photo on Facebook.

<div style="text-align: center;">
  <img style="display: inline; padding-right: 20px;" alt="YouTube Video Fullscreen Button" src="/images/fullscreen-yt-video.png" />
  <img style="display: inline;" alt="Facebook Photo Fullscreen Button" src="/images/fullscreen-fb-photo.png" />
</div>

Note that most browsers have had *user-triggerable* full-screen functionality for some time now. The **HTML5 Fullscreen API** is distinct from this; it allows the *web developer* to access this same functionality, and importantly, the developer can *trigger it programmatically*.

This is nice because the developer can design a fullscreen button which looks like part of their site (a la YouTube and Facbeook). You can trigger fullscreen mode with this code:

{% highlight js %}
elementToMakeFullscreen.requestFullScreen();
{% endhighlight %}

The main restriction that the API places on developers is that fullscreen must be triggered in reaction to a click or keypress. Presumably, this is so that sketchy sites can't immediately put you into fullscreen when you land on their site.

{% highlight js %}
// Assuming jQuery is available

// Fullscreen the HTML document on click
$('#fullscreen-button').on('click', function() {
  var doc = document.documentElement;
  if (doc.requestFullscreen) {
    doc.requestFullscreen();
  }
});
{% endhighlight %}

Note that in practice, you need to use the prefixed versions (`mozRequestFullScreen()` and `webkitRequestFullScreen()`) since the spec is still not final yet.


## How the attack works

Create a link to a site that the user trusts:

{% highlight html %}
Visit <a href="https://www.bankofamerica.com">Bank of America</a> for mediocre banking services.
{% endhighlight %}

The user can hover their mouse over the link and their status bar will show `https://www.bankofamerica.com`, as expected.

However, when the user clicks the link, call `event.preventDefault()` to prevent the browser from actually navigating to the link. Instead, trigger fullscreen mode and insert fake OS and browser UI into the page, along with a fake version of the site to be phished.

{% highlight js %}
$('html').on('click keypress', 'a', function(event) {

  // Prevent navigation to legit link
  event.preventDefault();
  event.stopPropagation();

  // Trigger fullscreen
  if (elementPrototype.requestFullscreen) {
    document.documentElement.requestFullscreen();
  } else if (elementPrototype.webkitRequestFullScreen) {
    document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
  } else if (elementPrototype.mozRequestFullScreen) {
    document.documentElement.mozRequestFullScreen();
  } else {
    // fail silently
  }

  // Show fake OS and browser UI
  $('#menu, #browser').show();

  // Show fake target site
  $('#target-site').show();
});
{% endhighlight %}

It's important that the fake OS and browser UI match the user's system. So, if Chrome user on OS X clicks the link, we show a fake OS X menu bar and fake Chrome UI with a green padlock for HTTPS on Bank of America.


## How I built this

I built a <a class="spoofLink" href="https://www.bankofamerica.com">working demo</a>, which I encourage you to check out. You activate it by simply clicking the link in the previous sentence. You'll want to use Chrome, Firefox, or Safari for the demo to work.

To make the demo, I took screenshots of different OS and browser chromes (Chrome, Firefox, and Safari on each of Windows, OS X, and Ubuntu) and split the images so I could use them in a fluid layout (to handle aribitary screen resolutions). I make sure to preload all the screenshots in the background so that the UI will be ready when the user clicks the target link.

The demo also works if the user is already in fullscreen mode when they click the target link.

The demo's source code is also [available on GitHub](https://github.com/feross/fullscreen-api-attack).


## Would this actually work in the wild?

It's true that the OS and browser UI won't be exactly perfect for every user's system. Lots of people customize their OS and browser and some might notice that they're looking at fake UI.

For example, the user's browser bookmarks and running menu bar apps may be different from the screenshots. The clock time in the OS X menu bar will almost certainly be wrong. One could improve the demo by adding the correct time to the OS UI, but this really isn't necessary.

On OS X, Chrome plays an annoying 1-second animation any time you go fullscreen, which might set off some alarm bells with experienced users.

Despite all these apparent shortcomings, this remains a very serious attack because of the phenomenon of change blindness.

> [Change blindness] is the phenomenon where **seemingly striking or obvious changes are not noticed**. -- Milan Verma on [BBC](http://www.bbc.co.uk/news/10284925)

Check out this excellent video from the psychology study where "change blindness" was first proven outside the lab:

<iframe width="640" height="480" src="https://www.youtube.com/embed/FWSxSQsspiQ#t=11s" frameborder="0" allowfullscreen></iframe>

Read more about [change blindness](http://en.wikipedia.org/wiki/Change_blindness) on Wikipedia.

## Humans are terrible at spotting subtle changes

If this attack were used in the wild, I bet at least 10% of web users would get phished (probably many more).

Links are the bread and butter of the web. People click links all day long -- people are pretty trained to think that clicking a link on the web is safe. Saavy users may check the link's destination in the status bar before clicking, however, in this case it won't do them any good.

**Most browsers don't do a good job of making it clear that the browser just entered fullscreen mode.** Safari shows a quick half-second animation, then *no indication at all* that the browser is in fullscreen mode, making users susceptible to all kinds of phsishing attacks involving fake OS and browser UI.

Chrome and Firefox (especially recent versions) do a better job of putting their own UI on top of the fullscreened content, but in Chrome especially, it's pretty subtle and easily missed.

I'm sure we can all think of friends or family that would be fooled by a trick like this. After all, enough people still respond to Nigerian scam emails that it's profitible to continue sending them!


## A quick note about "features vs. security" in software

In software engineering, **functionality and security are at odds with each other**. When you add a new feature to a complex system, it's impossible to predict how the new feature will interact with each of the thousands of existing features, in all their myriad combinations.

When the fullscreen API was first drafted by Mozilla, they predicted attacks like this:

> Browser vendors are well aware of the potential security issues with fullscreen. For example, a malicious site could show a full screen Windows or Mac login window and steal a password. That’s why they are disabling keyboard support by default and only enabling by explicitly asking. -- [John Dyer](http://johndyer.name/native-fullscreen-javascript-api-plus-jquery-plugin/)

At some point, Mozilla (as well as the other browser vendors) must have decided that keyboard support in fullscreen mode is useful enough to legit web developers that it's worth taking a hit to security.

I'm not convinced that this was the right tradeoff to make. What do you think?

**UPDATE (Oct 9, 2012, 12:00 AM):** The Mozilla developer documentation says this:

> Also, any alphanumeric keyboard input while in full-screen mode causes a warning message to appear; this is done to help guard against phishing attacks. The following keys are the only ones that don't cause this warning message to appear (...) -- [MDN](https://developer.mozilla.org/en-US/docs/DOM/Using_full-screen_mode)

However, this documentation is out-of-date. There were no warnings on keyboard input in Firefox or Chrome. I went fullscreen on a Facebook photo and was able to leave a comment without any issues. Safari, on the other hand, appears to prevent keyboard input.

**UPDATE (Oct 9, 2012, 12:22 AM):** [Someone](http://news.ycombinator.com/item?id=4630261) on Hacker News pointed out that Internet Explorer used to allow the creation of [chromeless popup windows](http://www.kb.cert.org/vuls/id/490708) which could be augmented with fake OS or browser UI to create phishing attacks. This feature was removed in Internet Explorer in 2004.

**UPDATE (Oct 18, 2012):** Google, Mozilla, and Apple are discussing what (if anything) to do about the issue I demonstrated. I [replied](http://lists.w3.org/Archives/Public/public-webapps/2012OctDec/0251.html) on the "public webapps" W3C mailing list with my thoughts.


*Shoutout to [Neal Wu](https://twitter.com/WuNeal)!*


