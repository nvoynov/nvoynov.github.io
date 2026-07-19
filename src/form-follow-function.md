---
title: "Meditations: Form Follows Function"
subtitle: "On Architectural Blueprints and Misplaced Sameness"
date: "July 2026"
header-includes:
  - <meta name="robots" content="noindex, nofollow">
---

# The Primal Architecture

In mid-20th-century industrial design, the axiom *"Form Follows Function"* dictated that the shape of a structure must primarily relate to its intended purpose. If a building is meant to house people, its spaces must flow around human movement. 

In software engineering, we inherited this vocabulary but frequently inverted its meaning. We often let the **Framework** or the **Infrastructure** dictate the form, forcing the actual business domain to adapt to the limitations of a database or a delivery mechanism.

> "You mistake complication for creative self-expression. Nature never produces a perfect rectangle."
> — *The Messenger, Dimension of Miracles*

When an engineering team defaults to generic layouts just because a tutorial said so, they are mistaking complication for design. They create a rigid square where a fluid rectangle is required.

---

# The Archeology of Clean Patterns

We treat modern architectural patterns like *The Clean Architecture*, *Ports and Adapters*, or *Domain-Driven Design (DDD)* as if they were sudden flashes of 21st-century insight. They are not. They are inevitable evolutionary outgrowths of a much older square.

Long before the industry popularized these terms, the **Entity-Control-Boundary (ECB)** pattern established the core structural boundaries in 1992:

1.  **Entities:** The stable, slow-changing domain data and business rules.
2.  **Controls (Use Cases/Interactors):** The connective tissue implementing specific workflow execution.
3.  **Boundaries (Adapters):** The volatile, shifting interfaces with the outside world (UI, APIs, CLI, Gateways).

[ Boundary ] <---> [ Control ] <---> [ Entity ]

A decade later, the enterprise software boom of the 2000s repackaged this reality into the ubiquitous **Three-Tier Architecture**: *Presentation Layer*, *Business Logic Layer (BLL)*, and *Data Access Layer (DAL)*. 

[ Presentation ] <---> [ Business Logic ] <---> [ Data Access ]

Whether you look at the client-server monoliths of the past or the decentralized systems of today, the structural mandate has never changed. Uncle Bob’s *Clean Architecture* merely drew concentric circles around this primal trinity; *Hexagonal Architecture* turned it into a polygon. The function remains exactly the same: **protecting the core business logic from the infrastructure noise.**

---

# The Misuse of Objects

The failure to let form follow function manifests most clearly in the incorrect use of object-oriented design. 

We see enterprise applications where classes are used as mere placeholders for procedural scripts (Anemic Domain Models), and we see systems where simple logic is buried under twenty layers of speculative abstraction. This happens when engineers memorize rules without understanding the underlying problem. 

> "Program = Algorithms + Data Structures."
> — *Niklaus Wirth*

If your architecture obfuscates the data structures and turns the algorithms into a convoluted maze of inheritance, your form has killed the function. 

---

# The Engineering Takeaway

Every software system, by its very nature, decomposes into three fundamental layers: **Data**, **Algorithms**, and **Boundaries**. They possess entirely different operational natures, lifecycle cadences, and engineering purposes. 

When mapping out a detailed system design, do not try to invent clever abstractions to bypass this reality. Instead, split your design strictly along these lines:

*   Isolate the raw **Data Structures** so they remain transparent and predictable.
*   Enforce the purity of your core **Algorithms and Use Cases** so they remain completely decoupled from third-party tools.
*   Keep your delivery **Boundaries** at the absolute periphery of the system.

We do not build software to showcase our mastery of architectural paradigms. We build it to execute a business function. Understand the ancestral archaeology of your patterns, respect the three layers, and build your rectangles with pragmatic intent.

---
`42. Form is temporary. Function is permanent.`
