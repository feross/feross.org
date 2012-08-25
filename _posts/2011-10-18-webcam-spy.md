---
layout: post
title: "HOW TO: Spy on the Webcams of Your Website Visitors"
github: http://url.com
---

I discovered a vulnerability in Adobe Flash that allows any website to turn on your webcam and microphone **without your knowledge or consent** to spy on you.

**It works in all versions of Adobe Flash that I tested.** **I've confirmed that it works in the Firefox and Safari for Mac** browsers. Use one of those if you check out the [live demo](/hacks/webcam-spy/). There's a weird CSS opacity bug in most other browsers (Chrome for Mac and most browsers on Windows/Linux).

## Video demo of the attack

<iframe width="600" height="370" src="http://www.youtube.com/embed/-LbvglVj8Ho?hd=1" frameborder="0" allowfullscreen></iframe>

Source code: [Github](https://github.com/feross/webcam-spy). Video demo: [YouTube](http://www.youtube.com/watch?v=-LbvglVj8Ho)

## Updates about the vulnerabilty

- **10/19/2011**: [CNET says](http://news.cnet.com/8301-27080_3-20122887-245/adobe-to-plug-flash-related-webcam-spying-hole/) that Adobe is working on a fix and it could be ready by end of week. Adobe also emailed me and said "our product team is wrapping up their investigation and is now working on a fix, which should not require a Flash Player update".

- **10/20/2011**: **Whoa, this story is everywhere!** News stories have been published in [CNET](http://news.cnet.com/8301-27080_3-20122887-245/adobe-to-plug-flash-related-webcam-spying-hole/), [Wired.com](http://www.wired.com/threatlevel/2011/10/flash-vulnerability-webcam/), [The Register](http://www.theregister.co.uk/2011/10/20/acobe_flash_webcam_spying/), [Ars Technica](http://arstechnica.com/business/news/2011/10/adobe-fixes-flash-privacy-panel-so-hackers-cant-spy-via-webcams.ars), [Gizmodo](http://gizmodo.com/5851851/new-adobe-flash-exploit-could-give-any-website-access-to-your-webcam), [PC World](http://www.pcworld.com/article/242227/adobe_to_fix_flash_flaw_that_allows_webcam_spying.html), [Yahoo! News](http://news.yahoo.com/blogs/technology-blog/adobe-flash-exploit-allows-websites-access-webcam-without-010049284.html), [ZDNet](http://www.zdnet.co.uk/news/security-threats/2011/10/20/adobe-moves-to-fix-webcam-spying-exploit-40094230/) (and [another ZDNet](http://www.zdnet.com/blog/security/adobe-fixes-webcam-hijack-flash-flaw/9694)), [The Inquirer](http://www.theinquirer.net/inquirer/news/2119163/adobe-flash-exploit-websites-hijack-webcam), [Computer World](http://www.computerworld.com/s/article/9221052/Adobe_to_fix_Flash_flaw_that_allows_webcam_spying?taxonomyId=86), and [The H Security](http://www.h-online.com/security/news/item/Adobe-remedies-webcam-spy-hole-in-Flash-1364631.html). Lastly, this is an interesting opinion piece: ["The Sins of the Flash"](http://www.circleid.com/posts/201110221_the_sins_of_the_flash/)

- **10/20/2011**: Adobe [says](http://blogs.adobe.com/psirt/2011/10/clickjacking-issue-in-adobe-flash-player-settings-manager.html) they just posted a fix to the Settings Manager that should resolve the issue. I just tested it out, and indeed **the issue appears to be fixed now**. Congrats, Adobe, for the quick fix!

- **12/21/2011**: This attack made it into Jeremiah Grossman's list of [top web hacking techniques of 2011](http://jeremiahgrossman.blogspot.com/2011/02/top-ten-web-hacking-techniques-of-2011.html). It's #26.

- **1/10/2012**: Another [similar clickjacking attack](http://blog.skepticfx.com/2012/01/adobe-flash-webcam-clickjacking.html?spref=twitter) was just discovered. Adobe has fixed it.

- **5/9/2012:** FOX News in Cleveland [just ran a story](http://fox8.com/2012/05/09/hackers-gain-access-to-homes-through-webcams/) about this.
  
  <iframe width="420" height="315" src="http://www.youtube.com/embed/loDFU-2eypk" frameborder="0" allowfullscreen></iframe>

Read on for the original blog post.

## Clickjacking + Adobe Flash = Sad Times!

This attack works by using a neat variation of the normal [clickjacking](http://en.wikipedia.org/wiki/Clickjacking) technique that spammers and other bad people are using in the wild right now. For the uninitiated:

> *Clickjacking* is a malicious technique of tricking Web users into revealing confidential information or taking control of their computer while clicking on seemingly innocuous web pages.
>
> -- Wikipedia

Combine clickjacking with the [Adobe Flash Player Setting Manager page](http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager06.html) and you have a recipe for some sad times.


## Background

I took a computer security class (Stanford's [CS 155](http://cs155.stanford.edu)) last quarter and really enjoyed [this research paper](http://seclab.stanford.edu/websec/framebusting/framebust.pdf) on framebusting and clickjacking. After reading it, I checked out a few popular sites to see if it was possible to clickjack them. After a couple hours, I had no success.

But, then I stumbled upon [this blog post](http://blog.guya.net/2008/10/07/malicious-camera-spying-using-clickjacking/) entitled "Malicious camera spying using ClickJacking" where the author shows how to clickjack the Adobe Flash Settings Manager page to enable users' webcams. He accomplishes this by putting the whole settings page into an iframe and making it invisible. Then, unsuspecting users play a little game and unwittingly enable their webcams. Adobe quickly added [framebusting](http://en.wikipedia.org/wiki/Framekiller) code to the Settings Manager page (why wasn't it there in the first place?), and the attack stopped working.

But alas, the same attack is actually still possible.


## How my attack works

Instead of iframing the whole settings page (which contains the framebusting code), I just iframe the **settings SWF file**. This let me bypass the framebusting JavaScript code, since we don't load the whole page -- just the remote .SWF file. I was really surprised to find out that this actually works!

I've seen a bunch of clickjacking attacks in the wild, but I've never seen any attacks where the attacker iframes a SWF file from a remote domain to clickjack it -- let alone a .SWF file as important as one that controls access to your webcam and mic!


> The problem here is the [Flash Player Setting Manager](http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager06.html), this inheritance from Macromedia might be the Flash Player security Achilles heel.
> 
> -- [Guy Aharonovsky](http://blog.guya.net/2008/10/07/malicious-camera-spying-using-clickjacking/)

This is a screenshot of what the Settings Manager .SWF file looks like:

![Adobe Flash Settings Manager](/images/adobe-flash-settings-manager.png)

## Live Demo

I built a [quick proof-of-concept demo](/hacks/webcam-spy/) to show how it works.

<strong style="color: red;">Important point:</strong> The demo is only guaranteed to work in **Firefox and Safari for Mac**. Right now, it doesn't work in most other browsers since you can't change the opacity or the z-index of an iframed swf file. However, I discovered a workaround that involves multiple iframes, but haven't implemented it yet since it's a bit complicated. But, I'm pretty sure that it's possible to make it work everywhere, given enough time.

<strong style="color: red;">Important point 2:</strong> The vulnerability has been fixed by Adobe, so the demo does not work anymore.

[View the demo](/hacks/webcam-spy/). The code is also available on [Github](https://github.com/feross/webcam-spy).

I should also mention that my demo builds heavily off of the ideas and work done by the dude who runs [this blog](http://blog.guya.net/2008/10/07/malicious-camera-spying-using-clickjacking/), Guy Aharonovsky.

Also: If you're a bit leery about running the demo... I promise I'm not saving the webcam video. I just display it back to you so you can see that it works. However, if an attacker used this technique, they would almost certainly NOT show you any sign that your cam is on. You're only hope of finding out that something's up is your webcam indicator light (if you have one).

![Webcam Light](/images/webcam.jpg)

## Why release this?

I reported this vulnerability to Adobe a few weeks ago through the [Stanford Security Lab](http://seclab.stanford.edu/). It's been a few weeks and I haven't heard anything from Adobe yet. I think it's worth sharing it with the world now, so that Adobe pays attention and fixes it more quickly.

Although every browser and OS is theoretically susceptible to this attack, the process to activate the webcam requires multiple highly targeted clicks, which is difficult for an attacker to pull off. I'm not sure how useful this technique would actually be in the wild, but I hope that Adobe fixes it soon so we don't have to find out.

## Further reading

If you want to learn more about clickjacking and framebusting, you should read the excellent [Busting Frame Busting: a Study of Clickjacking Vulnerabilities on Popular Sites](http://seclab.stanford.edu/websec/framebusting/framebust.pdf) (PDF) paper by Gustav Rydstedt, Elie Bursztein, Dan Boneh, and Collin Jackson.