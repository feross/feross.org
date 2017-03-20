# [Home of Feross Aboukhadijeh](https://feross.org) [![travis][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/feross/feross.org/master.svg?style=flat
[travis-url]: https://travis-ci.org/feross/feross.org

Copyright (c) Feross Aboukhadijeh

Hi, I'm Feross Aboukhadijeh and this is the source code for my blog, [https://feross.org](https://feross.org). Feel free to browse the source, fork, and [ask me questions](https://twitter.com/feross).


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

## Install prerequisites

```bash
npm install
brew install gsl
sudo gem install jekyll
sudo gem install narray
sudo gem install gsl
```

## The blog design

If you decided to fork, please create your own blog design, don't use mine. I don't want to see fifty other blogs that look the same as mine. Thanks for understanding!

