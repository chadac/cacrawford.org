---
title: "maps.utulsa.edu: university of tulsa interactive map"
subtitle: "[maps.utulsa.edu](https://maps.utulsa.edu)"
date: 2017-09-05T16:53:41-05:00
description: "An interactive map of the University of Tulsa."
weight: 3
year: 2016
important: true
---

#### [Available at https://maps.utulsa.edu](https://maps.utulsa.edu)

An interactive map of the University of Tulsa developed as part of my
Graduate Assistantship for the Department of Digital
Communications. Developed
using
[ReactJS](https://facebook.github.io/react/)/[Flux](https://facebook.github.io/flux/) and
the
[Google Maps Javascript API](https://developers.google.com/maps/documentation/javascript/). I
was the primary lead on coding the project based on the specifications
given by Digital Communications.

The motivation behind this map was to have a utility that new
students/visitors could use to quickly search for buildings or
departments on campus and get walking or driving directions on their
phones. In that regard, I made several design decisions to maximize
efficiency, such as:

1. Quick search using a Trie data structure. I implemented a simple
   Trie that was capable of quickly identifying buildings that matched
   a query. I also populated the Trie with substrings to match partial
   words (for example, searching "Tandy School of Computer Science" and
   "computer science" yields the same results).
2. Invisible components for results and markers. Generally when typing
   in a search query into the box, the ``React'' method of updating
   would be to rerender only the components that were needed. However,
   such an operation is \\(O(n)\\) where \\(n\\) is the number of
   places on the map, which was slow for quick updates such as typing
   in each character in a search. To resolve this issue, each
   component is instantiated but is invisible until an event triggers
   it to appear. This reduced the complexity to the number of relevant
   elements being triggered, which was small and easy to compute.

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
