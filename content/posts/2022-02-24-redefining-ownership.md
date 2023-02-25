---
title: "Redefining Ownership"
date: 2023-02-24
draft: false
---

Software developers are trained to solve problems. We want to write
code that makes life as simple and easy as possible, so that our
customers can do anything with a simple click of a button. However,
when we try to solve too many problems at once, the resulting product
solves none of them well. In this article, I'll discuss how our
concept of *Ownership* underestimates the customer and undermines our
products, and what we can do to be better owners.

Consider the following mock problem, which I've commonly see happen in
the Data Engineering space:

> Simon, an analytist at company X, wrote a spreadsheet ages ago that
> provides invaluable analysis, but they're tired of manually updating
> the spreadsheet and sharing it out with stakeholders. They want us,
> the engineers, to build a website that builds their spreadsheet for
> them so they don't have to spend X hours per week putting it
> together.

The standard process for solving this problem is: Engineers meet with
Simon and use his requests to map out user stories. Those stories
become a design that is then turned into tasks, which engineers
incrementally publish and deploy. Over the course of 6-12 months
they've now built a data pipeline that feeds into an optimized data
store used by a web application serving a dashboard sharing all of the
data and metrics that Simon collected.

The dashboard is initially very popular. Customers flock to the
feature queue, asking for additional views, more metrics, and tying
the dashboard into even more data sources. The dev team takes on tasks
as they can, prioritizing them in sprints and delivering features
regularly. But as time continues on, engineers change teams or leave,
and interest in the dashboard wanes. Feature requests stay open for
longer and longer until the application becomes stale.

If the engineering team were to ever revisit this application, they'd
realize that the tools and technology are incredibly outdated. Since
everything was built with the intent of feeding to the dashboard, the
new team needs to do a complete rewrite of everything in order to get
the software into a proper and modern state.

Ultimately, the dashboard either falls into obscurity or gets replaced
when another team needs something similar and the dashboard only
serves 70% of their needs.

What could the engineering team have originally done to prevent these
issues? Their process and design were definitely not wrong; they chose
the proper technologies, followed proper practices, maybe even
actually took the time to document their code. They delivered
something that customers loved and likely created successes for years.

## The 'Ownership' Problem

Simon's problem isn't limited to only data visualization. Software
engineers are taught that a customer's request is something that needs
to be solved with more code. One of Amazon's [top leadership
principles](https://www.amazon.jobs/content/en/our-workplace/leadership-principles)
is "Ownership," which emphasizes:

> Leaders are owners. [...] They never say “that’s not my job.”

We genuinely wanted to make Simon's life as easy as possible. We
design software so that he never has to lift a finger again; not only
does he not need to assemble the data anymore, but he also doesn't
need to manage the logic or style in his spreadsheet either, and he
doesn't even need to send the email anymore!

What was the problem with the dashboard application above? It wasn't
in their design choices or their programming style. Instead, the core
problem comes down to one very major user story that the developers
forgot to plan for:

> As a customer, I would like X so that when I want some new feature
> to the application, it can be added and used when I need it.

Let's compare how this story was implemented with Simon's spreadsheet
vs. with the web application:

* **Simon's spreadsheet**: When Simon wanted a new metric or a new
  feature, he would open up his spreadsheet and directly add it. For
  him, adding this feature took around an hour.
* **The dev team's dashboard**: When Simon wanted a new metric added,
  he now had to consult with the dev team to implement this new
  solution. He'd post a feature request on the team's queue, which
  would then be prioritized as engineers got to it. It now took weeks
  to months before Simon could see this new metric.

The ability for Simon to quickly prototype features is one of the
major reasons why his spreadsheet became so commonly circulated to
begin with. Simon would frequently mock up new metrics or comparisons
that he would see as potentially valuable, and then he would keep the
stuff that continued to be useful and ditched what he no longer
needed. The engineers never saw this review process, and they never
really appreciated that Excel as a product actually *enabled* Simon to
be a better owner.

The engineers stole Simon's ownership and, as a consequence, the
quality of the product suffered. The engineers misrecognized what
Simon was truly asking for; he didn't want all of his work to be
automated, he simply needed making updating the spreadsheet as simple
as possible.

Had the engineers focused on simplifying Simon's job so that the hard
parts of building his spreadsheet could be done in seconds, then:
* Simon would be happier, as he would have been able to continue to
  extend his spreadsheet, and;
* The dev team would have been happier, as a complex design that
  spanned multiple data stores, pipelines and a web application would
  have been reduced to a simple tool that would have taken weeks to
  write.

## Having vs enabling ownership

The dev team's dashboard is ultimately a "have ownership" approach to
software. They want to solve all of the problems that their customers
are facing and aren't thinking long-term about how their solution will
enable or restrict owners in the future.

High-quality applications, however, must *enable ownership*. They must
be cognizant of their customers' ever-expanding needs and plan
accordingly so that customers can solve their own problems.

Enabling ownership has several key advantages over having ownership:

1. **Customer's priorities become the priority.** We don't eliminate
   the feature request queue entirely, but when we would deliver a
   feature slower than the customer needs it, the customer should be
   able to do the work themselves.
1. **You need to write less code.** While we are talking about a more
   nuanced and complex planning process, the result should yield less
   code for you to write in the end. Planning effectively becomes more
   agile, as leaders that enable ownership look for simple and small
   solutions that can immediately deliver customer value and leave
   room for additional planning in the future.
1. **Writing new code becomes simpler.** Enabling ownership for your
   customer is ultimately also enabling ownership for your own
   team. Now when Simon's data pipeline is complete but he wants a
   solution for visualizing the data easily, your team can then focus
   on mocking up a dashboard. And if Simon is dissatisfied with the
   dashboard, you're still enabled to pivot to something like [Apache
   Superset](https://superset.apache.org/).

## How can a leader become effective at enabling owners?

### 1. Volatility-based decomposition

Juval Löwy in his book [Software System
Decomposition](https://www.informit.com/articles/article.aspx?p=2995357)
has written on a very similar approach to software design, which he
coined [Volatility-based
decomposition](https://www.informit.com/articles/article.aspx?p=2995357&seqNum=2).
He approaches the problem from a different perspective: how stable is
your software application to changes or additions? Do new features
require changes across many different platforms, or is the system
capable of isolating its components so that a change doesn't need to
be made across many services at once?

While this remains very difficult to actually do in practice,
considering the scope of future hypothetical changes can be a great
way to simplify the process of maintaining and upgrading software in
the future.

### 2. Plan for code to be open sourced

This doesn't mean that you necessarily open source all of your work,
but when planning a new project, it helps to think about what unique
contributions you are making and how those contributions could be
shared. I strongly recommend this for two reasons:

1. **It helps you decouple your current use case from your business
   logic.** Open sourcing means generalizing your functionality, which
   means separating your business-specific logic from logic that could
   be generalized and reused in future applications.
2. **You may realize you don't *need* to write custom code.** One of
   the first things to do after decomposing your problem is to see if
   there are any existing open source solutions that already solve
   what you are trying to do. If something exists, then perhaps you
   can use their solution instead. This saves dev time and allows your
   team to focus on the unique and new problems rather than
   reinventing the wheel.
3. **Even if your code isn't open sourced, you can reuse what you've
   written.** I find that I'm often reusing libraries I've written in
   the past more often that recreating those libraries; in fact,
   oftentimes reuse motivates incremental improvements that ultimately
   lead to incredibly clean osftware development processes.

For example, let's talk about the pipeline used to deliver Simon's
data. In our "having ownership" approach, the engineers decided to
write a new package that listens to a set of hard-coded messages
queues, and then creates SQL insert queries in a corresponding
Postgres database.

If we think about it, though, the *unique contribution* from this
process is the ability to take messages that are usually transient and
putting them in some persistent format. Once we have decomposed that,
we can then see if there are any comptetitors to this process:

1. [Amazon SQS can write messages to Parquet format using
   Firehose](https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html). Parquet
   can then be easily ported to any database without needing to
   hard-code schema information, and it also provides us an easy mechanism of recovering data when needed.
2. [Apache
   Nifi](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-parquet-nar/1.4.0/org.apache.nifi.processors.parquet.PutParquet/index.html)
   has a similar `PutParquet` method for data processing.

If we deem that no existing open source solution meets our needs, then
we can then begin to think about writing our own component. But now,
we have contrasting solutions that we can use to motivate our own
design and, by removing hard-coding our input queues and schemas, we
can now easily add new data sources when necessary using the same
format.

* Related talk: ["Simple Made Easy" - Rich Hickey (2011)](https://www.youtube.com/watch?v=SxdOUGdseq4)

### 3. Reduce your code footprint

I've already stated this before, but to state it as explicitly as possible:

As engineers, we should strive to write as little code as
possible. Every new line of code is code to maintain, refactor, debug,
etc.

Massive design diagrams that solve a large number of problems are
inevitably going to create more code than small design diagrams that
solve necessary problems. When we're writing smaller batches of
functional code, we're able to step back and re-evaluate priorities
during the development process.

## It's not that easy

Even with all of this, I can't guarantee that maintaining software in
the future will always be easy and clean. This article compiles a
series of learnings that I've found useful, but I'm still actively
refining this process. In fact, at this very moment one of my
coworkers is lambasting me for some terrible design decisions I made
on a project years ago that will be difficult to resolve.

Nonetheless, this approach has also created some great
successes for me. I've written libraries and tools that are frequently
used by my team and beyond in my organization, and I've frequently
reused the libraries I've built. Some of these libraries have [lived
for years and have finally reached an open-sourced
state](https://github.com/chadac/poetry-plugin-pypi-proxy), with a
massive number of robust tests to ensure that the product stays
reliable into the future.
