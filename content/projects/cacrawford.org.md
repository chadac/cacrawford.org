---
title: "cacrawford.org"
date: 2017-11-28T15:54:46-06:00
year: 2017
weight: 5
description: "This website! Written in Hugo, deployed with Docker."
draft: false
tags: ["hugo", "docker", "continuous integration"]
---

### [Available on BitBucket](https://bitbucket.org/chadac/cacrawford.org)

This website's actually got a pretty cool setup. It's built to be
deployed directly with BitBucket Pipelines, allowing me to edit and
publish posts from any machine.

Everything is hosted on Amazon S3 behind CloudFront. When a commit is
pushed to master, a Docker container generated from an [image with
Hugo and AWS CLI](https://github.com/chadac/docker-pipelines-hugo)
builds the source using Hugo.  The S3 bucket is updated and the
CloudFront caches are invalidated so that all changes are immediate.

It's fairly cheap to run at about $0.75 a month, and enables me to
customize the website much more than hosting with GitHub Pages would
allow.
