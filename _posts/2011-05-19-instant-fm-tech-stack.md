---
layout: post
title: Instant.fm Tech Stack
---

I've received a lot of emails asking about the technology stack of [Instant.fm](http://instant.fm), so I thought I'd share this publicly.

<span style="color:red;"><b>Update:</b></span> The source code for Instant.fm is now on [Github](https://github.com/feross/Instant.fm)!

## First, what features did we want to build?

### Playlist Creation

- No login required.
- Build your playlist **on site**, or upload a .m3u, .txt, or .pls file from iTunes, Windows Media Player, or WinAmp.
- Each playlist gets a unique, shareable, short URL.
- Allow background image uploading. (TODO)

### Playlist Editing

- Drag and drop to re-order songs.
- Buttons to Move To Top, and Kill Song.
- Change playlist name/title with an inline edit (no refresh).

### Playlist Viewing

- Use YouTube as audio source.
- Shuffle, repeat, show/hide video.
- Suggest songs to be added to playlist. (TODO)
- Keyboard shortcuts for power users.

### Social Features

- Share playlist on Facebook, Twitter.
- See what your friends are listening to. (TODO)

### Mini-browser

- Pane which behaves like an iOS navigation view, with a stack of 'views'.
- Allows searching and browsing artist/album information without stopping the music.
- Clicking links doesn't cause user's browser to leave the page.
- Uses fancy animations, which look great.

### Non-stop Music

- On most music sites, clicking something stops the music (very jarring).
- On Instant.fm, everything is AJAX, so nothing stops the music.
- Even logging in/out works without a page refresh (the correct playlist edit tools are shown/hidden).

### Browser Support

- All modern browsers.
- Internet Explorer 8. (TODO)

## How We Built It

### [HTML5 Boilerplate](http://html5boilerplate.com/)

- Rock-solid default for HTML5 websites.
- Build script for minifying and hyper-optimizing JS, CSS, and HTML.
- CSS reset, base styles, cross-browser normalization, non-semantic helper classes.
- Server side optimization to reduce total page weight.

### CSS3

- 1430 lines of hand-written CSS.
- CSS3 *hotness* (transitions, box-shadow, border-radius, gradient, box-reflect, text-shadow).
- Degrades gracefully in older browsers (...most of the time).

## JavaScript Libraries

### [jQuery 1.6](http://jquery.com/)

- The best.

### [jQuery UI 1.8](http://jqueryui.com/)

- The only feature we used was the excellent "sortable" module.

### [Modernizr](http://www.modernizr.com/)

- HTML5 feature detection in JS and CSS.
- HTML5 shiv so semantic elements like &lt;header&gt; and &lt;footer&gt; work in IE.

### [YepNope](http://yepnopejs.com/)

- Conditional JS resource loader for polyfills.
- Asynchronous script loading.

## Backend Stuff

### [Tornado Web Server](http://www.tornadoweb.org/)

- Asynchronous non-blocking Python web server.
- Modules (tornado.database, tornado.httpserver, tornado.web, tornado.auth, tornado.ioloop).

### [Nginx web server](http://nginx.org/)

- We run 4 Tornado processes, and use nginx to load balance between them.

### [Supervisor](http://supervisord.org/)

- Process control system used to daemonize the Tornado server instances.

### [SQL Alchemy](http://www.sqlalchemy.org/)

- We were doing raw SQL for a while, then we got tired of that and decided to go with an ORM.

### [Python](http://www.python.org/)

- Server-side image resizing.
- Playlist file (.m3u, .txt., .pls) parsing after upload.

### [Apache Ant](http://ant.apache.org/)

- Custom build script to deploy new code.
- Currently, the site goes offline for about 30 seconds whenever we deploy (we think this is acceptable).

## Web APIs

### [Last.fm API](http://www.last.fm/api)

- Artist, song, album information (summaries + pictures).
- Powers our search results.
- Uses **HTML5 Local Storage** to cache search results.

### [Facebook API](http://developers.facebook.com/docs/reference/api/)

- Facebook Connect.
- Social plugins (Like button, Comments widget).

### [YouTube API](http://code.google.com/apis/youtube/overview.html)

- Search API.
- Embedded player JavaScript API.

## jQuery Plugins
### [jQuery Templates](http://api.jquery.com/category/plugins/templates/)

- Render data into a template and insert into DOM.
- Officially supported plugin.

### [JSizes](http://www.bramstein.com/projects/jsizes/)

- Adds support for querying and setting additional CSS properties.
- Min-width, min-height, max-width, max-height, border-*-width, margin, padding.

### [Jeditable](http://www.appelsiini.net/projects/jeditable)

- Adds Edit-in-place functionality to forms (no page refresh).

### Auto Expanding Text Area

- A la Facebook and Quora.

### [ColorBox](http://colorpowered.com/colorbox/)

- Light-weight, customizable lightbox.

## Graphics

### Helveticons

- High quality commercial icon package.

### Photoshop

- All other images, icons, logo, custom missing album/artist images are ours.

## Misc Notes

### InstantFM.com

- **.com** TLD redirects to our main **.fm** site, in case users get confused with the .fm extension.
- Purchased from a domain squatting company (BuyDomains).

### [Git](http://git-scm.com/)

- Commit early, commit often.
- 686 commits so far.
- We used [GitHub](https://github.com/).

## Conclusion

As you can see, we built Instant.fm upon a solid foundation of **awesome**. Most of our tools are [free software](http://en.wikipedia.org/wiki/Free_software) with great documentation and easily hackable code. [Jake](http://www.quora.com/Jake-Becker) and I used a bunch of different tech on this project, since we wanted to try out some new things. Plus, playing with new frameworks and libraries is always fun.

We learned ***a ton*** during this project. I hope that this information has helped you. If you found this useful, leave a note in the comments.