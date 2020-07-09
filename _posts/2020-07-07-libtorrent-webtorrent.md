---
layout: post
class: post
title: libtorrent adds support for the WebTorrent protocol
tags:
- node.js
- javascript
---

The vision of the [WebTorrent project](https://webtorrent.io) is to extend the BitTorrent protocol so that it becomes more web-friendly, allowing any browser to become a peer in the torrent network.

That's why I'm super excited that [`libtorrent`](https://www.libtorrent.org/) – the engine that powers many of the most popular torrent clients including [qBittorrent](https://www.qbittorrent.org/), [Deluge](https://deluge-torrent.org/), [rTorrent](https://github.com/rakshasa/rtorrent), and [many more](https://www.libtorrent.org/projects.html) – has [added support for the WebTorrent protocol](https://github.com/arvidn/libtorrent/pull/4123).

WebTorrent support in `libtorrent` opens the door for many more torrent clients to connect to browser peers. Browser peers (which must use WebRTC) will now be able to access a huge trove of torrents currently only available to TCP/UDP peers.

The WebTorrent protocol allows peers to connect over WebRTC in addition to the widely supported TCP and UDP transports. In fact, UDP support itself was added to the BitTorrent protocol in a protocol extension (see the [μTP](https://en.wikipedia.org/wiki/Micro_Transport_Protocol) protocol) and now UDP is the primary transport used by BitTorrent clients.

With this big news, we're one step closer to the vision of browser-based torrents. One day soon, you'll be able to navigate your web browser to any site with a JavaScript torrent implmentation embedded – like [Instant.io](https://instant.io/) or [βTorrent](https://btorrent.xyz/) – and be able to torrent anything available in the normal torrent network.

While desktop torrent clients aren't going anywhere anytime soon, now the web browser will become a viable alternative to an installed torrent client. This is huge for less-technical users, users who can't install native apps, or users who just feel safer using a website. WebTorrent offers more options and more ways to connect.

[![](/images/webtorrent-network.png)](https://webtorrent.io/faq)

Torrent clients that can speak to both traditional TCP/UDP peers (orange) as well as the WebRTC-only browser peers (blue) are called "hybrid" peers (green). The `libtorrent` support for WebTorrent means that there are about to be a lot more hybrid peers!

### The wider WebTorrent world

WebTorrent is more than a protocol extension to BitTorrent.

We build a popular desktop torrent client, [WebTorrent Desktop](https://webtorrent.io/desktop), which supports powerful features like instant video streaming.

[![](https://webtorrent.io/img/screenshot-player.png)](https://webtorrent.io/desktop)

We also build a [`webtorrent`](https://github.com/webtorrent/webtorrent) JavaScript package which implements the full BitTorrent/WebTorrent protocol in JavaScript, the language of the web. This implementation uses TCP, UDP, and/or WebRTC for peer-to-peer transport in any environment – whether Node.js (TCP/UDP), Electron (TCP/UDP/WebRTC), or the web browser (WebRTC). In the browser, the `webtorrent` package uses WebRTC which doesn't require a browser plugin, extension, or any kind of installation to work.

If you're building a website and want to fetch files from a torrent, you can use `webtorrent` to do that directly client-side, in a decentralized manner. Our recently released [WebTorrent Workshop](https://webtorrent.github.io/workshop/) is helpful for getting started and teaches you how to download and stream a torrent into an HTML page *in just 10 lines of code*.

```js
const client = new WebTorrent()

const torrentId = 'https://webtorrent.io/torrents/sintel.torrent'
const torrent = client.add(torrentId)

torrent.on('ready', () => {
  // Torrents can contain many files. Let's use the .mp4 file
  const file = torrent.files.find(file => file.name.endsWith('.mp4'))

  // Display the file by adding it to the DOM
  file.appendTo('body', { autoplay: true, muted: true })
})
```

[See this code in action on CodePen.](https://codepen.io/ferossity/pen/NWGVZVL?editors=1010)

Also, I want to remind everyone that WebTorrent has been [built into](https://support.brave.com/hc/en-us/articles/360035025231-What-extensions-are-built-into-Brave-) the popular, privacy-focused [Brave](https://brave.com) browser since 2016. Just click on `.torrent` files or magnet links and they'll magically work. And that's all powered by WebTorrent.

[![](/images/brave.webp)](https://brave.com)

With support for the WebTorrent protocol in `libtorrent`-based torrent clients, you'll soon be able to connect to more peers which means faster, more reliable downloads.

The future is bright for WebTorrent!
