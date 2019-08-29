---
layout: post
class: post
title: Recap of the `funding` experiment
tags:
- node.js
- javascript
ad: false
---

I'm ending the `funding` experiment I [introduced](/npm-install-funding/) a few days ago.

I appreciate the thoughtful discussion and feedback from the community. I'd like to share some thoughts about how the experiment went from my perspective.

## The problem

### Where did this start?

My objective was to start a conversation about how to change cultural norms around open source consumption.

Right now, the status quo is that **maintainers create massive amounts of value and then for-profit companies and SaaS startups [capture almost all of it](https://gravitational.com/blog/open-core-vs-saas-intro/).**

As a case in point, let me tell you a story from the [Open Source Summit](https://events.linuxfoundation.org/events/open-source-summit-north-america-2019/) conference I attended last week. While walking through the vendor area, I asked one of the startup reps “how much did you pay for this sponsor booth?” They weren’t sure if it was $10,000 or $20,000. This startup’s product is a `package.json` checker that tells companies if the open source software they're using is permissively licensed (i.e. MIT, BSD, or Apache). They charge $50 per developer per month for this.

So this means that they charge a 50-person startup a whopping $30,000 per year to help them feel safe using code that open source authors like me have *given away for free*.

Meanwhile, the median startup likely contributes $0 per year to support open source maintainers.

I hold no grudge against this company – it seems like they've built a good product. But you have to admit, **the fact that businesses will pay thousands of dollars for some SaaS software while ignoring the maintainers who write *the actual open source code itself* seems a bit unfair.**

Maintainers do critical work which enables companies to create billions of dollars in value, yet we capture none of that value for ourselves.

Does it have to be like this?

I’m not arguing that maintainers should start capturing *all* of the value that we create. But we shouldn't capture literally *none* of the value either. The status quo is not tenable.

I would love to find a way to help maintainers capture at least *a bit* of the value we create so that we can happily continue to write new features, fix bugs, answer user questions, improve documentation, and release innovative new software.

### "Sustainability" only means subsistence

Increasingly, maintainers are starting to go through a mindset shift. We don't want to ask politely for donations anymore – donations that often never come, or when they do they're usually only enough for maintainers to *sustain* themselves but never enough to actually *thrive*.

*Sustainability* is another way to say *subsistence*. This is why the common phrase "open source sustainability" isn't ideal.

I like what Kyle Mitchell wrote in [Profit for Us, Sustainability for You](https://blog.licensezero.com/2018/06/14/profit-sustainability.html):

> “Profit” has a bad rep, in part because we don’t sully wages and fees for honest work by individuals with the term, even when they exceed immediate needs. **It’s possible to profit without exploiting anyone. In fact, profit tends to show that you yourself aren’t being exploited.** Your abilities, not your patron or your donors, should decide what kind and quality of life you can manage, and where. Value is leverage.

We should set our goals higher than *subsistence*. Folks who work on open source have a right to *thrive* and to be fairly compensated for our labor.

### Do we dare to hope for something better?

As long as significant personal sacrifice is a prerequisite for open source participation, we'll continue to exclude a lot of smart and talented folks. This isn't good for anyone.

And we're forcing the folks who *are* able to participate to make extreme sacrifices that [inevitably lead to burnout](https://nolanlawson.com/2017/03/05/what-it-feels-like-to-be-an-open-source-maintainer/). Freeloading companies think they benefit from the current state of affairs. But maintainer burnout results in abandoned packages, ignored issues, unpatched security bugs, ecosystem churn, and more work for all of us. This is classic tragedy of the commons.

**The dirty secret of open source is that much of it is powered by maintainer guilt.**

As [Dominic Tarr](https://dominictarr.com/) said after the `event-stream` [compromise](https://gist.github.com/dominictarr/9fd9c1024c94592bc7268d36b8d83b3a):

> If it’s not fun anymore, you get literally nothing from maintaining a popular package.

But what if this weren’t the case?

What if anyone could make a living working on open source without needing to [move to Thailand for lower cost-of-living](https://sindresorhus.com/), or needing to [sell their startup and use the proceeds to work on open source full-time for four years](https://techcrunch.com/2013/12/17/yahoo-acquires-peercdn/), or needing to [move to Hawaii to create a solar-powered farm and live frugally with near-zero income](https://substack.net)?

How much healthier and vibrant would the ecosystem be if less self-sacrifice was required? How many more people would be able to join in the fun and opportunity of open source?

## What I've already tried

Starting in 2018, I began trying lots of different ways to raise funding so I could justify continuing to do open source full-time. The opportunity cost of forgoing a six-figure tech job are huge, especially when you live in the SF bay area.

Here are a few of the things I tried:

- [`thanks`](/introducing-thanks/)
- [Patreon](https://www.patreon.com/feross)
- [Tidelift](https://tidelift.com/subscription/pkg/npm-standard?utm_source=npm-standard&utm_medium=readme)
- [GitHub Sponsors](https://github.com/users/feross/sponsorship)
- Paid consulting

With all these put together, I can make it work. But it still feels like a precarious solution. If even I – with my fortunate position – can't make a *comfortable* living working on open source, then how is anyone else supposed to make it work?

Lots of maintainers struggle to reach a barely [livable wage](https://staltz.com/software-below-the-poverty-line.html) via donations. Of course, there are [notable exceptions](https://reference.kemitchell.com/top-donations-developers.html). But most maintainers are eventually forced to get a job making proprietary software, or at least split their time between open source and proprietary work which is far less beneficial to society. It's unfortunate, but [GitHub stars won't pay the rent](https://medium.com/@kitze/github-stars-wont-pay-your-rent-8b348e12baed).

[![](https://staltz.com/img/poverty-popularity.png)](https://staltz.com/software-below-the-poverty-line.html)

A lucky few manage to land day jobs that allow them to work on open source. But most folks have to be more creative – squeezing in time after work, secretly doing open source maintenance at work, or opting out of normal society completely. `#solarpunk`

I'm hopeful that [GitHub Sponsors](https://github.com/sponsors) will make giving donations to maintainers more common. But I still worry a lot about folks who maintain packages that no one installs directly, i.e. transitive dependencies of popular packages. These maintainers have the hardest time.

The most common funding models – donations, README sponsors, or paid consulting – only work if a maintainer can get their appeal in front of users. This [usually](https://github.com/zloirock/core-js/issues/548) goes in a README or on a website.

But reliable, error-free transitive dependencies are invisible. Therefore, the maintainers are invisible, too. And, the better these maintainers do their job, the more invisible they are.

No one ever visits a GitHub repository for a transitive dependency that works perfectly. There's no reason to do so. But a developer investigating an error stack trace might actually visit the GitHub repository, if for no other reason than to file an issue. At least then there's a chance they'll see the maintainer's plea in the README.

We need solutions that work for these folks too.

Maybe ads aren't the answer – fine. **But telling maintainers to bury their appeals where no one bothers to look is not the answer, either.**

## The story of `funding`

### The seeds of an idea

When trying something new, you can't plan for everything in advance. Sometimes the quickest way to learn if an idea is good or not is to just try it.

So, here was the rough idea for the `funding` experiment:

At a high level, an open source maintainer should be able to `npm install funding` into their project and start receiving money for their maintenance work.

Maintainers shouldn't need to pitch fifty companies to find the rare one that is open to the idea of supporting open source financially. This is not work that most maintainers enjoy doing, are actually good at, or should need to do.

Rather than appeal to companies or users for donations – donations that often never come, and when they do, are never enough – `funding` lets maintainers take matters into their own hands. They can directly capture a small portion of the value that they've created. Not very much value, but at least not *no value*.

What if someone new to open source could adopt an abandoned package, quickly `npm install funding`, and start earning money for maintaining a package?

Suddenly formerly abandoned packages have a monetary value, and, therefore, a reason to be maintained. Bug fixes, security fixes, and pull requests would be less likely to be ignored. Folks who want to quit their day job to work full-time on open source now have a plausible means to do so. We all win.

What about when tons of sponsor messages start appearing in the terminal? How would this scale?

I had a plan for this. As more folks added `funding` to their packages, many copies of it might end up in the dependency tree. But `funding` de-duplicates the post-install message so it only ever prints one message.

As more maintainers join, `funding` ends up in more dependency trees so the single post-install message has more opportunities to be shown, bringing in more income for everyone. At some point, adding additional maintainers doesn't help the message appear more times since it's already showing in almost every install, so adding further maintainers only causes the total income to be split among more maintainers. We'd have to see how this played out.  No one knows the value of a sponsor message in the terminal since this has never been tried before. That's why this was an experiment.

Note that `funding` funnels funds to transitive dependencies much more effectively than any of the current funding approaches! That was an explicit design goal. There are lots of transitive dependencies that are "unpopular" in terms of mind share and GitHub stars, but which are used pervasively and yet invisibly. If this experiment worked, these "invisible maintainers" would have had a way to be rewarded for the value they provide.

### Yuck. How would ads works?

Ads let us leverage the attention of the users of our software. They’re an imperfect solution because they extract value (in the form of a few seconds of attention) from all users equally – both from the open source “makers” as well as the “takers”.

For the record, **`funding` had absolutely no tracking, no data collection, and no code from untrusted third parties.** It was a `console.log` with some fancy formatting. Think of it like a newspaper classified ad. We just print it and hope that maybe some folks will see it.

But even when ads don’t track or collect data, they still feel "icky" to many users.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Oooo light bulb! Perhaps I should write a script that puts ads on the desktop wallpaper while installing ;) &lt;evil laugh&gt;<br><br>I&#39;m all for sponsoring open source but ads during install are just annoying. Please don&#39;t. <a href="https://t.co/2knajtL0ay">https://t.co/2knajtL0ay</a></p>&mdash; James M Snell (@jasnell) <a href="https://twitter.com/jasnell/status/1165662575352172544?ref_src=twsrc%5Etfw">August 25, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Personally, I'm not a huge fan of ads. I wish we could get away from ads as a funding model for free content. I use an ad blocker in my web browser, I install ad blockers on all my family's computers, and I hope you do too. And yet, I'm pragmatic. I run ads on some of the websites that I've built and it helps fund ongoing maintenance work.

I supported anyone who wanted to block the sponsor messages from showing up. Which is why I added an environment variable `OPEN_SOURCE_CONTRIBUTOR=true` so that folks who support open source, whether through direct contributions or financially, could permanently silence the output. Obviously, even "takers" could use the flag, but hopefully the variable name makes them feel at least a little guilty.

## The launch

I quietly launched this on August 19, 2019 without much fanfare. People who I know got in touch to express support.

### The community reaction

Fellow open source maintainers and open source contributors have, by and large, been supportive of the experiment. Open source "consumers", not so much.

[Paolo Fragomeni](https://hx.ht/) said it best:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">No one cool was upset by what <a href="https://twitter.com/StandardJS?ref_src=twsrc%5Etfw">@StandardJS</a> did.</p>&mdash; Paolo F (@heapwolf) <a href="https://twitter.com/heapwolf/status/1166301352009633794?ref_src=twsrc%5Etfw">August 27, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Folks who have spent time maintaining a popular open source project know how much time it takes to keep a project "healthy". There are a constant stream of bugs to fix, new features to consider adding, pull requests to review, security issues in dependencies to resolve, user questions to answer, and underlying platform changes to deal with. Even for simple single-purpose packages, there's a non-trivial ongoing maintenance burden. Especially when you're maintaining hundreds of packages, as many in the Node.js community do.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">good</p>&mdash; substack (@substack) <a href="https://twitter.com/substack/status/1165742866796183554?ref_src=twsrc%5Etfw">August 25, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Lots of maintainers welcomed the experiment as a much-needed conversation starter. That's not to say that folks were thrilled with the idea of ads in their terminal. Many supporters expressed their dislike of advertising – even advertising where the sponsors are carefully selected and the implementation does not track users or collect data.

![](/images/funding-vweevers.png)

If nothing else, it's nice that `funding` forced open source "consumers" – folks who enjoy the benefits of open source software without ever contributing anything back – to reconsider their relationship with open source. I think we successfully pushed back against the entitlement to free labor that is pervasive in the interactions that open source consumers have with maintainers.

![](/images/funding-mixmix.png)

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I love your funding experiment <a href="https://twitter.com/feross?ref_src=twsrc%5Etfw">@feross</a> ❤️ don’t give up. Haters gonna hate.</p>&mdash; Jake Verbaten (@Raynos) <a href="https://twitter.com/Raynos/status/1165630071887015937?ref_src=twsrc%5Etfw">August 25, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p lang="en" dir="ltr"><a href="https://twitter.com/feross?ref_src=twsrc%5Etfw">@feross</a> I&#39;m glad you tried &amp; ran the funding experiment, no matter what flak got thrown your way. :)</p>&mdash; noffle 🌱 (@noffle) <a href="https://twitter.com/noffle/status/1166212318864166913?ref_src=twsrc%5Etfw">August 27, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

### The brigaders

Large numbers of the detractors seemed to come from the [r/programming](https://www.reddit.com/r/programming/) subreddit who are notoriously anti-JavaScript. A smaller number came from 4Chan and Hacker News. These [drive-by condemners](https://blog.licensezero.com/2019/08/26/but-you-said.html) were eager to join in a [pile-on](https://github.com/standard/standard/issues/1381) in the `standard` issue tracker. But since these folks were neither users nor contributors to `standard`, I think their opinions should be discounted compared to those of actual users, fellow contributors, and fellow maintainers.

<blockquote class="twitter-tweet" data-conversation="none"><p lang="en" dir="ltr">glob bless <a href="https://twitter.com/feross?ref_src=twsrc%5Etfw">@feross</a> for poking the hornet’s nest tho</p>&mdash; Forrest L Norvell (@othiym23) <a href="https://twitter.com/othiym23/status/1165709255967510528?ref_src=twsrc%5Etfw">August 25, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Folks who contribute nothing don't get a seat at the table.

[Rich Hickey](https://clojure.org) said it best in [Open Source is Not About You](https://gist.github.com/richhickey/1563cddea1002958f96e7ba9519972d9):

> The only people entitled to say how open source 'ought' to work are people who run projects, and the scope of their entitlement extends only to their own projects.
>
> As a user of something open source you are not ... entitled to anything at all. You are not entitled to contribute. You are not entitled to features. You are not entitled to the attention of others. You are not entitled to having value attached to your complaints. You are not entitled to this explanation.

### Ending the experiment

> A new idea is delicate. It can be killed by a sneer or a yawn; it can be stabbed to death by a quip and worried to death by a frown on the right man's brow. – Ovid

Since it seems clear this isn’t going to be the solution that saves us all, I’m ending the experiment. (In fact, it’s already been paused since Saturday when the sponsors backed out.)

<blockquote class="twitter-tweet" data-conversation="none"><p lang="en" dir="ltr">We reconsidered after reflecting on the developer community&#39;s reaction. We still passionately support open source software along with <a href="https://twitter.com/feross?ref_src=twsrc%5Etfw">@feross</a>, but we&#39;ll be more careful about experimenting in the future while continuing to innovate. On that note:<a href="https://t.co/WFrHBFGzul">https://t.co/WFrHBFGzul</a></p>&mdash; Linode (@linode) <a href="https://twitter.com/linode/status/1166095174516297728?ref_src=twsrc%5Etfw">August 26, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Both Linode and LogRocket are supportive of exploring new ways to support open source. It's a bummer this didn't work out, but I don't hold it against either of them.

It's possible that the idea of terminal ads still has some legs. But this isn't the hill I want to die on. **I have other experiments in the works that I'm way more excited to try out.**

### The future

Approximately 100% of the Fortune 500 use open source code. Maintainers are just starting to wake up to our own power. Expect lots more experiments in the future. Expect to be surprised. This certainly won't be the last open source funding experiment.

There is an effort underway to replace post-install scripts with a [unified format](https://github.com/npm/cli/pull/187) for soliciting donations. This will likely lead to the silencing of non-error install script output, which is honestly not a bad idea. The days of free-form post-install solicitations seem numbered. It's important that this change is coupled with automatic reporting of funding calls-to-action on `npm install`, or else the change merely silences yet another avenue for maintainers to reach their users.

Despite all the personal attacks against me, I’m really glad I ran this experiment. I think it was worthwhile because it seems to have moved the conversation forward, at least among the more thoughtful folks in the wider community.

I really appreciate the support that folks have shown for experimentation, and all the useful discussions that have resulted! Also, a huge thank you for the words of encouragement and support in the midst of all the harassment. Thank you everyone 🥰 🥰 🥰
