---
old: true
layout: post
class: post
title: Post to Tweetie from Google Reader
tags:
- my-code
---

![Google Reader Logo](/images/reader_logo.gif)

I recently decided to ditch [NetNewsWire](http://www.newsgator.com/INDIVIDUALS/NETNEWSWIRE/) and use [Google Reader](http://reader.google.com/) as my main RSS reader. **Google Reader** helps me keep up on the latest tech news and [important internet trends](http://www.youtube.com/watch?v=dQw4w9WgXcQ "Sorry, I couldn't resist!"). As I cave in to using yet another Google service, Google gets one step closer to becoming a hive mind.

I've been really happy with Google Reader so far, except for one thing.

Google allows you to post articles that you're reading to various social networking sites, like Twitter, Facebook, and Digg. But, Google's built in *"Post to Twitter"* feature opens up a new window (or tab in Firefox's case) at Twitter.com just to post a new tweet. **Lame!**

![Screenshot of Tweetie](/images/tweetie-screenshot.png)

I already use an amazing Twitter client for Mac, called [**Tweetie**](http://www.atebits.com/tweetie-mac/). I've gotten used to it's slick interface that opens a tiny little tweet window when you want to write a new tweet. It's so much better than opening a whole new tab!

**I wanted this functionality to be available to me in Google Reader.** What was I to do?

Well, the company behind Tweetie, [AteBits](javascript:window.location='tweetie:'+window.location), offers up a handy bookmarklet to help users easily tweet stuff while surfing the web. You just create a new bookmark and set the URL to be:

{% highlight javascript %}
javascript:window.location='tweetie:'+window.location
{% endhighlight %}

But, we can improve this by adding the title of the website to the Javscript code, which looks like this:

{% highlight javascript %}
javascript:window.location='tweetie:'+document.title+'%20'+window.location
{% endhighlight %}

Then when you click on this bookmark, a new tweet pops up that looks likes this:

![Tweetie tweet interface](/images/tweetie-post.png)

Awesome, right? Now, I just need to add this custom Javscript URL to Google Reader's *"Send To..."* section, right?

This is the Google Reader interface for adding custom "Send To..." buttons:

![Google reader interface](/images/google-reader-add-service.png)

But, it's not that easy! Google blocks Javascript URLs (probably for security reasons or else it's just an oversight on their part) and you get presented with this sad error mesage:

![No Javascript URLs!](/images/no-javascript-urls.png)

But, I want Tweetie in Google Reader, darn it! So, I whipped up a little PHP/Javascript workaround. I'll post it here, because I imagine that others have had this same problem.

{% highlight html+php %}
<html>
    <head>
    </head>
    <body>
        <script type="text/javascript">
          window.location='tweetie:'+'<?php echo $_GET["title"]; ?>'+'%20'+'<?php echo $_GET["url"]; ?>';
          window.close();
        </script>
    </body>
</html>
{% endhighlight %}

This is the final result:

![Send to Tweetie!](/images/send-to-tweetie.png)

This trivial script just looks for a title and URL passed in via GET parameters, redirects the browser there, and then closes itself to get out of the way. All that remains is your new tweet window in Tweetie and Google Reader in the background.

This is what it looks like in action:

![This is what it looks like in action!](/images/tweetie-in-action.png)

Then, I just uploaded this file to my server (It's located here: http://feross.org/tweetie.php (NO LONGER AVAILABLE) in case you want to use it).

Then, I just filled out the Google Reader settings window like this:

Set up your settings like this! Remember, in Google Reader, ${title} and ${short-url} stand for the article title and URL.

![Set up your settings like this!](/images/reader-settings.png)

**Feel free to copy these settings** if you'd like to set up the same functionality for yourself!

Now, I can tweet any/all the interesting stories I read from Google Reader super easily. **If you follow me on Twitter, then get ready for a firestorm of tweets!**

Hopefully someone finds this useful! :-)
