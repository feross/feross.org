---
layout: post
title: Shame on You, Comcast!
---

![Comcast is evil!](/images/evil-comcast-logo.jpg)

Last week, I posted about how Google lost search market share, but overall US searches increased by 5%.

Now I have some more interesting news to report about those same statistics. When I first looked at the data, one of the figures  struck me as a bit odd when I first saw it, but I didn't post about it ...until now.

The search engine with the** largest growth** in US search market share last month was **Comcast**. *Say what?*

Yup, you read that correctly. In fact, Comcast's month-over-month search market share ***increased by 41%***. Granted, they never had much of the search market to begin with, *but still* -- 41% seemed like way too much for Comcast to **ethically** gain in a single month.

After some investigation, I discovered that Comcast has been up to something fishy.

Comcast had 41% month-over-month search market share growth.

![Comcast had 41% month-over-month search market share growth.](/images/comcast-search-increase.png)

When I first saw this statistic, I just attributed it to a [Comcast.net](http://www.comcast.net) homepage redesign (they like to redesign their homepage every few months to annoy all their broadband customers).

But, **the gain still seemed to be too high** to be caused by a homepage redesign alone, and **I realized that Comcast was probably misleading/tricking its customers in some way**, but I couldn't prove anything nor did I find any news that explained the sudden 41% gain.

**Well, lo and behold, I was right:** Comcast has indeed been up to no good, and I discovered it firsthand when I went home to see my parents this weekend. (They are Comcast High-speed Internet customers.)

I was checking my email, reading news, and twittering -- in other words, happily surfing the Internets -- until I decided to do a new blog post. I go to type in ***http://www.feross.org*** into the URL Location bar, when... BAM, I see this screen:

This is what Comcast's new DNS Hijacker looks like in action:

![This is what Comcast's new DNS Hijacker looks like in action](/images/comcast-dns-hijacker.png)

***What?*** How'd I end up here? Well, I mistyped the URL. But I don't have Comcast set as my default search engine and Firefox shouldn't be redirecting incorrect URLs anywhere!*** What gives?***

Well, it turns out that Comcast is the latest ISP to start **hijacking incorrectly typed URLs and redirecting them to their own search sites.** They don't call it [DNS hijacking](http://en.wikipedia.org/wiki/DNS_hijacking), which is the proper name for this practice, though. They call it "Domain Helper", in an effort to hide what it is they are really doing to gullible customers unfamiliar with the practice.

Apparently, they [announced their plans](http://www.comcastvoices.com/2009/07/domain-helper-service-here-to-help-you.html) to roll out this "service" to customers on their **Comcast Voices** blog (a website that I'm sure most Comcast customers read daily!).

>Today, we’re beginning to roll out something new **to help high-speed Internet customers get where they want to go online even faster and easier than before**. It’s called the Domain Helper service and we’re introducing it as a market trial in Arizona, Colorado, New Mexico, Oregon, Texas, Utah, and Washington.
>
>(from [Domain Helper service: Here to help you](http://www.comcastvoices.com/2009/07/domain-helper-service-here-to-help-you.html))

**No!** This service doesn't help me get online **faster** or **easier**! It's your sad attempt to squeeze a bit more money out of your customers, while breaking many Internet services in the process and [exposing your customers to security risks](http://blog.washingtonpost.com/securityfix/2008/04/when_monetizing_isp_traffic_go.html).

And now, they've officially rolled the service out **nationwide** to all Comcast customers so we can all take part in the wonderful experience of DNS hijacking.** The Register** had this to say about it:

> The DNS hijacker is here to stay.
>
> When Denver-based developer Brent Gartner returned home from vacation this week, he discovered that Comcast, his home ISP, was redirecting his mistyped urls to its very own ad-laden search pages. Earlier this month, the cable giant resurrected this age-old land-grab scheme in several US markets, including Colorado, with an eye on hijacking typos across the country.
>
> Comcast does provide an opt-out. And Brent Gartner promptly did so. But the new scheme still boils his blood. "This pisses me off as it will surely break many web-serivces, spiders, and any client other than web browsers that use HTTP," he tells *The Reg*. "It looks like a blatant attempt to steal revenue from competing services."
>
>(from [The Register - Comcast trials <del datetime="2009-08-23T08:35:11+00:00">Domain Helper service</del> DNS hijacker](http://www.theregister.co.uk/2009/07/28/comcast_dns_hijacker/d))

Incidentally, **DNS hijacking** has been a trademark of [spyware](http://en.wikipedia.org/wiki/Spyware) and [adware](http://en.wikipedia.org/wiki/Adware) for years! Now, Comcast customers get this "feature" included at no extra cost in their Internet service plans.

Unfortunately, things don't look good at other ISPs. Charter, Cox, Earthlink, and Verizon have also implemented similar policies.

I guess I should look at the bright side. At least they haven't started hijacking invalid subdomains (can you imagine if they started hijacking *typo.feross.org*? Talk about potential security problems!). And, while I'm at Stanford (which is most of the year), I'll have** super-fast, non-hijacked, uncensored Internet**. Shoutout to the awesome [Stanford IT department](http://www.stanford.edu/dept/its/)!