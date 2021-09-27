---
title: "What does 'Ownership' really mean?"
date: 2020-02-28T23:32:00-07:00
draft: false
---

It's about time I wrote something on this website. As someone wise
once said --

<img style="text-align: center; display: inline; width: 400px;" src="/img/ive_got_a_lot_of_problems_with_you_people.gif" />

So I thought I might as well start with some rants that I often share
at work, but haven't really clarified in words yet.

If anyone has ever worked for or interviewed for Amazon, then they are
likely aware of the "Leadership Principles", which are the set of
corporate principles that Amazon peddles to anyone starting at the
company. It's not uncommon for organizations to have a set of
principles and for these to manifest into their own decisions, but I
thought I'd cover one specific leadership principle here:

## Ownership

The [Amazon.jobs webpage](https://www.amazon.jobs/en/principles)
defines this as:

> Leaders are owners. They think long term and don’t sacrifice
> long-term value for short-term results. They act on behalf of the
> entire company, beyond just their own team. They never say “that’s
> not my job."

Originally, I agreed with this concept a lot, especially the last
part. I'm sure many others would agree -- "not-my-job" syndrome is an
issue that is way too common at many companies.

I believe that this is often the counterpart to a "blame culture",
where people refuse to take on new tasks in the fear that they will be
blamed for any of its failures. There were projects I worked on that
were doomed to fail from the very beginning -- and yet, instead of
stepping up to resolve the inherent flaws with the project, we chose
to reduce our role on the project so that when shit did hit the fan,
we could simply say "we were following orders."

This type of approach, which ends up being more political than
success-driven, wastes developer time and resources. It made me
cynical about my work and dissatisfied with my job, and I ultimate
left that company for that reason.

Part of what attracts me to "ownership" is that it's not ownership of
success, it's ownership of failure. When we own our work, we are
saying that we're not afraid of failure and not afraid of criticism;
in contrast, if the current direction we are headed is wrong, then an
Owner should be willing to change their direction even if it means
extending deadlines and accepting short-term losses.

### Where it goes wrong

To be honest, I have been refreshed by the application of this
principle at Amazon. It's one of the reasons why projects here have a
good chance at succeeding.

However, "ownership" does have an uglier side to it that I do not
appreciate. Suppose you are building a new project -- what is the
expected deliverable? In many cases, this will be influenced by the
intended support model:

* **Approach A**: When a user discovers a bug or requests a
  new feature, they submit an issue/feature request and our team will
  prioritize this and resolve it when it surfaces on the queue.

Ownership implicitly favors **Approach A**, because anything besides
this would be telling the customer that "this is not my job". 

However, such an approach has the following limitations:

#### The customer has a request which would be needed for them to use your product

For example, support your project provides a nice environment for
testing and deploying Glue jobs, but it also includes integrations
with a default scheduler which cannot be undone. The customer is
interested in using the former but cannot use the latter. If we decide
that this is not a high priority item to address, then we have lost
this potential customer.

* The consequence of not fulfilling this request is that this
  potential customer will need to look elsewhere or implement their
  own solution.

#### The project needs to serve both non-technical and technical customers

I've seen this happen far too often as well. Non-technical customers
are looking for services that are easy to use immediately, while
technical customers will likely already have a nearly completely
working pipleine and just need a few small pieces.

* When ultimately all feature requests go through your team, your
  focus is going to be on building infrastructure to expedite these
  requests in the most constrained context (i.e., a non-technical
  request). This means building a service that has a friendly GUI,
  managed infrastructure, and a well-defined internal pipeline that
  can process any requests -- in other words, building a service.
* But services are restrictive. No matter how flexible you build the
  service to be, someone is going to need to mess up their pipeline in
  order to integrate with it. 

So what is the solution? Unfortunately, it means migrating away from
the ownership model. Instead of *having ownership*, we must be willing
to *enable ownership*:

* **Approach B**: When a user discovers a bug or requests a new
  feature, they will notify us, but if we do not have the time to work
  on the request, then the other team can contribute their own fix,
  and either use a separate fork or merge it into our project if we
  approve.
