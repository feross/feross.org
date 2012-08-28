# [Feross.org](http://feross.org) Blog

Copyright (c) 2012 Feross Aboukhadijeh

Hi, I'm Feross Aboukhadijeh and this is the source code for my blog, [http://feross.org](http://feross.org). Feel free to browse the source, fork at will, and [ask me questions](http://twitter.com/FreeTheFeross). Sharing is caring!


## How it's built

All my posts are written in Markdown. The blog is powered by [Jekyll](http://github.com/mojombo/jekyll), a static site generator that takes Markdown blog posts and converts them into HTML files. The benefit of this approach are many:

- The blog can be served with almost any web server, since the output of Jekyll is just flat HTML files.
- The whole blog can easily be version controlled.
- The blog requires less maintainance (goodbye out-of-date Wordpress installations!)

I also wrote a simple Node.js/MySQL app to track the number of page views on each blog post. It's pretty straightforward.

I host the actual site on my own server, since I have a Jekyll plugin (and GitHub Pages doesn't support Jekyll plugins). Also, GitHub isn't going to run that Node.js app for me. Also, I like being in control of my website hosting (seriously, being a [sharecropper](http://www.tbray.org/ongoing/When/200x/2003/07/12/WebsThePlace) sucks).


## Deploying

I wrote a few simple rake tasks for deploying. Take a look at the `Rakefile` -- it's pretty self-explanatory.

I serve the site with nginx and run the Node.js app using Supervisord (in case the app decides to crash).

That's pretty much it.


## The blog design

If you decided to fork, please create your own blog design. I'm happy for people to use my design as inspiration, but I don't want to see fifty other blogs that look the same. For that reason, I'm keeping the copyright on this code.

