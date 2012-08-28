---
layout: post
title: Detect Proxy Usage in Firefox
github: https://github.com/feross/detect-proxy
tags:
- security
- my-code
---

I recently read about an interesting browser information leak on [ha.ckers.org](http://ha.ckers.org/) and decided to code up a proof-of-concept.

It allows a malicious website to **detect whether the user is browsing through a proxy or not** by using image tags. Proxies are often used by corporations, political dissidents, and privacy conscience Internet users because they can provide additional security or anonymous Internet browsing.

## Here's how the exploit works

Firefox uses square brackets `[ ]` to denote IPv6 addresses, but this notation also works to describe IPv4 addresses (I'm not sure exactly why).

So, if we embed an image with `src="http://[74.207.246.197]/pic.jpg"` into a page, Firefox automatically resolves `[74.207.246.197]` into the IP address `74.207.246.197`.

However, if the user is browsing through a proxy, this automatic resolution doesn't happen. Instead, Firefox asks the proxy to do a DNS lookup for the "domain" `[74.207.246.197]`, which obviously fails since it's not a valid domain name.

Most proxies don't know how to handle the bracketed domain, so the DNS lookup fails. I've tested this on [Tor](http://www.torproject.org) (popular proxy for anonymous Internet browsing), [PHP Proxy](http://sourceforge.net/projects/php-proxy/) and [CGI Proxy](http://www.jmarshall.com/tools/cgiproxy/) (the top two web-based proxies), and [Proxify](http://www.proxify.com) (popular commercial web proxy).

So, if the image fails to load, we know that the user is browsing through a proxy. Add some Javascript to detect when the image fails to load and you've got a working proxy detector.

**[View the demo](/hacks/detect-proxy/).**
(Works in: Firefox 3, Safari 5)

This, of course, assumes that the user is not blocking cross-domain requests. Also, my implementation requires Javascript to be enabled, but that's not a necessity.

## Here's the code I wrote

{% highlight html %}
<script type="text/javascript" charset="utf-8">
    function setUsingProxy() {
        proxy = document.getElementById('proxy');
        proxy.style.display = 'block';
        no_proxy = document.getElementById('no_proxy');
        no_proxy.style.display = 'none';
    }
</script>

<div id="proxy" style="display:none;">
    You are accessing the Internet through a proxy (corporate proxy, VPN, or <a href="http://www.torproject.org/">Tor</a>).
</div>

<div id="no_proxy">
    You are accessing the Internet directly. No proxy.
</div>

<img src="http://[74.207.246.197]/organize.jpg" style="height:0;width:0;display:none;" onerror="setUsingProxy()">
{% endhighlight %}

This attack only affects Firefox and Safari, as far as I can tell.

Credit for the idea, as I mentioned above, goes to [Ha.ckers - Quick Proxy Detection](http://ha.ckers.org/blog/20100820/quick-proxy-detection/).

## Update (8/25/2012)

Code is [now available](https://github.com/feross/detect-proxy) on Github.