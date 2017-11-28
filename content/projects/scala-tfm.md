---
title: "scala-tfm: topic flow models for social media"
date: 2017-08-05T16:49:49-05:00
description: "Implementation of several probabilistic topic flow models to detect topics in social media conversations."
weight: 1
year: 2017
important: true
tags: ["scala", "python3", "probabilistic modeling"]
---

### [Available on GitHub](https://github.com/TUmasters/scala-tfm)

Part of my thesis and ongoing work. We were interested in using topic
models as a means of analyzing social media conversations, but found
that they were ineffective because conversations are often very
short. However, the context of a conversation is often a very
effective indicator of the topic of discussion.

The term "topic flow" refers specifically to how topics evolve in a
conversation from one post to another. The repository includes several
implementations of these topic flow models, and an easy-to-use
command-line interface for applying these models to a social media
corpus (although it still needs to be documented!).
