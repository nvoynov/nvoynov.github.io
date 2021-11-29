---
layout: post
title:  "How do you feel about TDD?"
date:   2021-11-29 12:49:47 +0200
categories: TDD
---

I was asked this question recently and I answered that I like it of course. Despite the fact that I've known the approach somewhere from 2002, a few days later I caught myself that I still reflecting on the matter. What did exactly the interviewer mean? And what exactly do I do like about this technic?

Is it just __about decent test coverage__ at different system layers with all consequent benefits like refactoring? But when one writes Ruby code (interpreted language) in a text editor there are not any proofs that the code will work at all until it will be interpreted. So in the case of plain Ruby, it is just inconceivable to write just code without tests. And the better is the tests coverage, the better confidence that the code works.

Besides the test coverage and its benefits, there is another important claim that TDD __might or tends to improve the design or architecture of the system__. But for me, it sounds rather a controversy. Of course, it might improve some things of small matter like an interface of some module or a certain function inside; but the architecture of the whole system cannot be improved that way - a unit test just doesn't fit the systems level. By the way, I'm a zealot of [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) and when you follow the principle the layers of your system are well defined once and for all.

What about __"test as documentation"__ how to use the module? I think it is better just to write a piece of documentation where it is really necessary by RDoc or Yard in the "Usage" section.

__PS.__ I'd appreciate any comment on the matter of TDD in Ruby, as soon as I find a way to add comments to GitHub Pages.
