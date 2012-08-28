---
layout: post
title: Is Google an Open Redirector?
tags:
- security
---

I think I just discovered a security flaw in the way Google handles clicks on the `I'm Feeling Lucky` button. They allow what essentially amounts to an **open redirect**, which is bad, bad, bad.

If you visit the following Google URL, you'll be redirected back to this site, **feross.org**. Check it out:

[http://www.google.com/search?hl=en&amp;q=site:feross.org&amp;btnI=1](http://www.google.com/search?hl=en&amp;q=site:feross.org&amp;btnI=1)

Update 8/23/2012: This link does not appear to work anymore.

As long as you pick a query (the part after &q= in the url) that you rank #1 for, this will always redirect you to your intended site. *That's not supposed to happen!*

It looks like Google should [follow their own advice](http://googlewebmastercentral.blogspot.com/2009/01/open-redirect-urls-is-your-site-being.html) and prevent open redirect abuse.

## Why are open redirects so bad, you ask?

From [OWASP](http://www.owasp.org/index.php/Open_redirect):

> An open redirect is an application that takes a parameter and redirects a user to the parameter value without any validation. This vulnerability is used in phishing attacks to get users to visit malicious sites without realizing it.

## Update

I just reported it to Google. I suppose I should have done so before blogging about it... I figured that they either know about it, or it's just not a concern for them. Still, I'm curious about why they'd allow this. I'm hoping for a response.

## Update 2

They just responded. They know about the issue and claim it's not a security problem:

> In this particular case, we believe the usability and security benefits of a well-implemented and carefully monitored URL redirector tend to** outweigh the perceived risks**.
> 
> For a more detailed explanation, check the "URL redirection" section on this page: [http://www.google.com/corporate/rewardprogram.html](http://www.google.com/corporate/rewardprogram.html" target="_blank)
> 
> Regards,
> [Name Removed], Google Security Team

And some more information from the [link](http://www.google.com/corporate/rewardprogram.html" target="_blank) they reference:

> URL redirection is considered a vulnerability by some members of the security community. The most prevalent argument made in support of this view is that some users, when presented with a carefully crafted link, may be **duped into thinking that they will be taken to a trusted page** - and will be **not be attentive enough to examine the contents of the address bar** after the navigation takes place.
>
> That said, it is important to recognize that the address bar is the only reliable content origin indicator available in modern browsers - and therefore, the behavior that would enable URL redirection attacks is inherently unsafe. The panel believes that **any user who could be misled by a URL redirector can also be tricked without relying on any particular trusted website to act as a relying party**; eliminating URL redirectors will not change this outlook appreciably.
>
> Consequently, the reward panel will likely deem URL redirection reports as non-qualifying: while we prefer to keep their numbers in check, we hold that the usability and security benefits of a small number of well-implemented and carefully monitored URL redirectors tend to outweigh the perceived risks.

## I disagree.

**</strong> If the average internet user sees a link to <strong>google.com**, clicks it, and then lands on page that claims to be Google, they will feel pretty safe in the fact that they're on a Google site. *That's a pretty reasonable assumption to make.*

It's true -- users *should* look at the location bar to verify the URL before giving away login credentials to any site, but this open redirector attack is sure to catch many unsuspecting users by surprise.

Do you agree -- is this actually as bad as it looks? Please comment.