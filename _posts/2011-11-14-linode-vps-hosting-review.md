---
old: true
layout: post
title: Linode VPS Hosting Review
tags:
- web-dev
---

People keep asking me to share how I handled the [viral traffic rush](/one-million-visitors-in-10-days/) to [YouTube Instant](http://ytinstant.com/) -- 1 million visitors in 10 days -- and which VPS hosting provider I recommend.

The answer to both questions is [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767), so here is my **review of Linode hosting**.

## Linode = Awesome Hosting

I've been using [Linode](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767) to host my websites for the past 5+ years and I'm thoroughly impressed by the service. I can't recommend them enough -- it is easily the best web hosting service I've used to date.

If you're coming from the shared hosting world, then let me tell you: **a virtual private server (VPS) is a whole new world**. A VPS means freedom, power, and total flexibility. You get access to everything from root, the kernel, and on up. All managed from the command line and, occasionally, the simple Linode control panel. Your Linode is completely and totally your machine.

Linode uses the [Xen hypervisor](http://xen.org/) for virtualization which means that your CPU, memory, and disk resources are really yours. **You get a guaranteed portion of the server resources.** If another user has a really popular site, your sites will not be affected. However, if there are _extra unused resources_, then your websites will automatically burst above your limits to make use of the extra CPU cycles or disk time, if you require them.

## A couple things to keep in mind about Linode:

1. **Your Linode comes with a vanilla installation of Linux.** You get to pick which Linux flavor to install on your server (I chose Ubuntu), but you have to configure the whole thing from the command line. Which brings us to...

2. **Your Linode comes with no traditional control panel** to help you set up your domains or help you configure virtual hosting. That means no CPanel or Plesk. Just the command line.

    You will need to install Apache, MySQL, set up iptables firewall rules, disable remote root access, and configure Apache virtual hosts (to serve multiple sites with one IP address) etc. **on your own**. At first, this scared me a bit, but it's actually not bad at all. It took me about a day to learn how to do everything I wanted to do and there are plenty of excellent tutorials online. The [Linode Library](http://library.linode.com/) and [Slicehost Articles](http://articles.slicehost.com/) should have all you need to get going.

## Some things that surprised me:

1. **I get stuff done much more quickly on the command line** then I ever did using control panels and lame, poorly designed graphical tools.

2. **The command line is extremely empowering.** If you've never had to use the command line for much before, it can be intimidating. At first, it's difficult to understand the appeal of the command line, especially if you're a designer or a programming noob. **But, trust me, the command line is the way to go.** The sooner you get comfortable using it, the happier you'll be. I'm telling you, it's a whole new world.

Another advantage of using the command line is that you no longer need to buy hosting that offers a bloated control panel package like CPanel or Plesk. Because of this, Linode prices are dirt cheap: $20/month to get started.

## Some things that make Linode awesome:

1. **About once a year, Linode upgrades the storage and RAM for all users at no extra cost.** For example: when I first joined Linode in 2009, I hosted all my sites on their cheapest plan -- 360MB ram, 16GB storage, 200GB transfer -- for $20/month. Since then, they've upgraded this so the same server now comes with 1GB ram, 48GB storage, and 2TB transfer -- _neat!_

2. **Unlike most shared hosting providers, Linode does not oversell their hosting.** At a cheap shared host, if you get even close to using all the bandwidth and storage that you paid for, you'd get shut down for "misusing resources" and "unfairly affecting other users on the server". With Linode, your resources are actually yours -- Linode doesn't oversell.

## Hosting Viral Websites with Linode

If you're considering a Linode, I recommend you **start out with the smallest one and upgrade if/when you need to**.

I currently host all my sites on the "Linode 1GB" plan, which is probably overkill, but its nice to be able to handle random traffic spikes without much work. When a site goes viral, like [YouTube Instant did](/youtube-instant-media-frenzy/#media) or [EmuSpin did](/my-recent-hacks/#emuspin), I just migrate to a bigger Linode.

For example, as [YouTube Instant](http://ytinstant.com) picked up steam, I upgraded the server several times, eventually ending up at the "Linode 4GB" plan -- at the time, 4GB ram, 160GB storage, and 1600GB transfer. Migrating plans takes about 15 minutes, and your sites will be inaccessible during that time.

![Network Traffic to YouTube Instant](/images/My-Network-Traffic-Last-30-Days1.png)

If I had more time, I would have switched from Apache to Nginx so that each new visitor wouldn't spawn a whole new 20MB process. As you'll quickly find out, the scarcest resource in a VPS hosting environment is RAM. Nginx, node.js -- and other high concurrency, low memory servers -- are a lifesaver here.

## Linode rocks!

If you want to sign up, use [my referral link](http://www.linode.com/?r=307513b509e8c0d3292536d446f17f0cdca0e767) and I'll get a couple weeks of free hosting. If you prefer not to, here's the plain link: [Linode.com](http://www.linode.com)

Happy hacking!
