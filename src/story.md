---
title: "My Engineering Story"
subtitle: "A Twenty-Year Retrospective"
date: "July 2026"
header-includes:
  - <meta name="robots" content="noindex, nofollow">
---

# Act I: The Accidental Ingress

It began with a stroke of pure, systemic luck in the final years of the twentieth century. My ordinary district high school was unexpectedly selected for a late-Soviet educational pilot program: "USSR–IBM: Pilot Schools." Out of nowhere, we received a dedicated computer laboratory packed with IBM PS/2 Model 30 machines, complete with educational software and early office suites.

To make this modern anomaly actually function, the school hired a graduate from the National Aerospace University (KhAI). In the 1990s, a KhAI diploma signified a top-tier systems engineer—someone who could theoretically operate, repair, or configure absolutely anything.

For the most part, the lab remained empty, occupied only by its new "system custodian." Occasionally, a progressive teacher would look through the window to stare at the machinery. The custodian, however, was a democratic man who valued genuine curiosity. Noticing three high-school kids staring hungrily at the blue panels of Norton Commander, he simply invited us inside. That laboratory became our unofficial sanctuary for the remaining two years before graduation.

Because the custodian's eldest son was studying at the country's elite technical universities (MFTI and Bauman State Technical University), we gained access to an unprecedented supply of the era's Russian-language literature on computing and cybernetics.

Our initiation began with BASIC—frequently interrupted by gaming sessions—before quickly evolving into Turbo Pascal 5.0 and C. By the time I graduated high school, I had confidently mastered Turbo Pascal and the low-level mechanics of MS-DOS hardware interrupts.

It was during this period that I authored my first widely distributed software utility: acckey (Accelerate Key). It was a minor low-level tool that forced keyboard response times to their absolute hardware limit. Its primary use case was highly practical: it allowed me to artificially inflate contract values rapidly in an early tactical strategy game called Machine War. The program maintained its underground popularity among local players for several years.

# Act II: The Friction of Academia & Early Monoliths

Then came university. Having already mastered low-level systems, I tested out of the entire year-long computer programming curriculum within my first week of classes. While this earned me an immediate reputation among my peers, the reality of higher education was far from ideal. Access to computer labs was heavily restricted, and the available hardware was a far cry from the IBM machines I had grown used to.

Worse, due to fierce competition, I had missed the cut for the pure Software Engineering track and was placed in the Electronic Engineering department instead. Aside from computing, the academic subjects failed to hold my interest. Surrounded by the newfound freedom of the student campus, I neglected my non-technical coursework, which resulted in my academic dismissal after eighteen months.

What followed were two difficult years completely detached from computing. However, the pull of the industry prevailed. I successfully re-enrolled at the university, this time securing a spot in the "Information Systems" program.

By then, the software landscape had made a massive leap toward Windows. I dedicated my focus to mastering Delphi and client-server architectures. Shortly after, I was hired by the university Dean’s office as an internal developer. This role resulted in my first high-utility enterprise application: an automated student academic tracking and record-management system. Built out of immediate administrative necessity, this software outlived my time at the university completely—remaining in active, daily production within that Dean's office until 2018, later maintained and expanded by another engineer.

During this same period, I architected my first commercial off-the-shelf software for a local business to automate CD-ROM inventory and turnover tracking. That application remained in active use for a decade, finally decommissioned only in 2006.

# Act III: The Analytical Shift & The Ruby Renaissance

In 2002, I entered the professional industry, scaling my familiar architecture stack of **Delphi, Firebird RDBMS, and FastReport** to build commercial client-server solutions. However, the subsequent major phase of my career took a drastic detour. I stepped into the world of Systems and Business Analysis—eventually leading departments—where writing production code was no longer part of my daily responsibilities. 

Yet, the core engineering mindset never truly left me. Programming constantly bubbled under the surface, occasionally breaking out into custom internal tools built to solve immediate project bottlenecks. 

My most significant breakthrough during this analytical era was the creation of **Marko**, a custom open-source tool designed to manage massive, high-overhead Software Requirements Specifications (SRS) and Architecture Documents (SAD). Marko operated on a docs-as-code philosophy: it treated a monolithic document as a decentralized collection of thematic Markdown files stored in a Git repository. The engine parsed the fragments, ran structural error-validation, built the final document hierarchy, and compiled it into required formats. 

In 2018, I read Robert Martin's *Clean Architecture*. That single book fundamentally shifted my perception of software design. It brought back the raw joy of experimentation and creative engineering. Most importantly, it freed my thinking from infrastructure dependencies—proving that core business logic should never care about implementation details like a specific database or a framework. 

I found myself drawn to high-load and distributed systems. In 2021, I took a deliberate sabbatical to plunge completely into microservices, containerization, and advanced backend patterns. This rigorous upskilling led to a natural transition: by 2022, I fully returned to code execution as a professional **Ruby Developer**, architecting my first event-driven microservice for automated MCU driver code generation.

By 2025, when the code generation domain had been thoroughly explored and ceased to challenge me, I felt the need to apply my structural thinking elsewhere. I turned to photography, experimenting with light, exploring modern AI visual spaces, and ultimately deploying my own dedicated online photo gallery. Today, I continue to build niche, private software projects centered around digital photography and image asset workflows.

---
`42. The loop is complete.`

