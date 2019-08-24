---
layout: post
class: post
title: Introducing `funding`
tags:
- node.js
- javascript
ad: false
---

**Update:** The experiment is over. I wrote a [recap post](/funding-experiment-recap/) about it.

I'm releasing an open source funding experiment today.

The current model of sustaining open source is not working. We desperately need more experimentation. This is one such experiment.

```bash
npm install funding
```

## What is this?

This is an open source funding experiment! ✨

Whenever users install open source software, this package will display a message from a company that supports open source. The sponsorship pays directly for maintainer time. That is, writing new features, fixing bugs, answering user questions, and improving documentation.

The goal is to make sure that packages are well-maintained now and for the foreseeable future, with regular releases, improved reliability, and timely security patches. Healthy open source packages benefit users and maintainers alike.

## What does this code do?

You can take a look! All the code is open source in this GitHub repository. Essentially, it calls `console.log()` on some text. **There is no tracking or data collecting — and it will always stay this way.** You can look at the code to verify – indeed, this is the beauty of open source!

## Where is this experiment running?

This experiment is currently running on a few open source projects that [Feross](https://github.com/feross) maintains:

- [`standard`](https://standardjs.com)

**Update:** The experiment is over. I wrote a [recap post](/funding-experiment-recap/) about it.

## What is the long-term goal?

My goal with this experiment is to make StandardJS healthier. If we learn that the experiment works, perhaps we can help make all open source healthier, too. For complex reasons, companies are generally hesitant or unwilling to fund open source directly. When it does happen, it's never enough and it never reaches packages which are transitive dependencies (i.e. packages that no one installs explicitly and therefore no one knows exists). Essentially, we have a public good which is consumed by huge numbers of users, but which almost no one pays for. Fortunately, there exists a funding model that usually works for public goods like this – ads. The goal of this experiment is to answer the question: Can we use ethical ads – ads that don't track users or collect data – to fund open source software?

## What will the funds be used for?

The funds raised so far ($2,000) have paid for Feross's time to [release Standard 14](https://standardjs.com/changelog.html#1400---2019-08-19) which has taken around five days. If we are able to raise additional funds, the next thing we'd like to focus on is out-of-the-box TypeScript support in StandardJS (one of the most common feature requests!) and modernizing the various text editor plugins (many of which are currently unmaintained).

## Where can I provide feedback about this experiment?

You can open an issue. But please be kind. I'm a human with feelings. ❤️

## How can I disable this?

Just to be super clear: **This package does no tracking or data collecting — and it will always stay this way.** It's just a fancy `console.log()`.

If you support open source through direct contributions, donations, or however else you see fit, you can permanently silence `funding` by adding an environment variable `OPEN_SOURCE_CONTRIBUTOR=true` to your terminal environment.

Note, `funding` also respects npm's `loglevel` setting, so e.g. `npm install --silent` and `npm install --quiet` will be respected.
