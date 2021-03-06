---
layout: post
title:  "Algorithms + Data Structures = Programs"
date:   2021-12-10 12:49:47 +0200
tags:   object-oriented design, cleon
---

I think some software developers are familiar with this formula, and perhaps the book of the same name that was published in l975. I'm not sure if the "Program" concept even exists today in up-to-date software engineering, but I think the formula is still a perfect point to start this post.

Structured programming languages were basically providing only data structures and functions (sometime procedures or both of those), and the formula was perfect for those days. And maybe functional programming is so attractive because of functions and data (of course it's not so simple stuff, recursions, heavily utilizing lists, immutability).

The majority of programmers today deal mostly with objects that are providing both state (data structures) and behavior (functions) that often is confusing. Actually, it's quite a challenge to design object-oriented software, and applying the wrong way (is it real freedom to make mistakes?) rather tends to the fragility of the result.

But there is one thing that can really help and it is [The Clean Architectre](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) (and I also recommend [the book](https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164)).

After a few weeks goofing around microservices and creating gems with clean services domain, I created the [Cleon](https://github.com/nvoynov/cleon) gem, where I placed a skeleton for a clean service domain in accord to the Clean Architecture. Nothing special, just PORO with no dependencies, entities, interactors (services there), and gateways; a few helpers, and the ability to copy its code to other gems.

Coming back to the topic of this topic, interactors stand for the algorithms and entities for the data structures. And when you combine it with gateways - your domain is clean, "screaming" of its purpose, easily testable, has no extraneous dependencies, no technologies - it will serve you for years.

Start clear, give it a try.

    gem install cleon
    ruby -e 'require "cleon"; Cleon.clone_cleon_code'
