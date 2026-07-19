---
title: "Technical Instruction: Search Index Isolation"
subtitle: "Restricting Visibility via Robots.txt and Metadata Enforcements"
date: "July 2026"
---

# Overview

This document outlines the dual-layer mechanism used to isolate sensitive or private content from search engine web crawlers (Google, Bing, Yandex) and GitHub's internal search indexers. The goal is to ensure specific pages like `story.html` and `meditations.html` remain accessible only via direct links within the digital outpost, preventing public indexing.

---

# Layer 1: Search Engine Exclusion (The Perimeter)

Web crawlers check for permission at two levels: the root directory specification (`robots.txt`) and page-level HTML metadata tags (`noindex`). For absolute certainty, both methods must be enforced simultaneously.

## 1. Global Repository Directive: `robots.txt`

A `robots.txt` file must be placed directly into the root directory of your static site deployment. This file instructs all automated crawlers which paths are strictly out of scope for indexing.

Create a plain text file named `robots.txt` in your root folder with the following content:

```text
User-agent: *
Disallow: /story.html
Disallow: /meditations.html
Disallow: /resume.pdf
Disallow: /resume.html
```

> **Engineering Note:** While `robots.txt` is an industry standard, it operates as a advisory directive. Cooperative crawlers will respect it, but malicious or poorly configured bots might ignore it. Therefore, page-level enforcement is required.

## 2. Page-Level Invalidation: HTML Metadata

To explicitly command a search engine to drop a page from its index, a `<meta name="robots">` tag must be embedded directly inside the HTML `<head>` block of that specific page. 

When utilizing the **RAWWW / Pandoc** pipeline, this code can be injected dynamically via the YAML front-matter header using the `header-includes` block.

Add this exact structure to the top of `story.md` and any future sensitive meditation file:

```markdown
---
title: "My Engineering Story"
date: "July 2026"
header-includes:
  - <meta name="robots" content="noindex, nofollow">
---
```

When Pandoc compiles the Markdown file into HTML, it will parse the metadata and place the tag inside the master template's header execution loop:

```html
<head>
  <meta charset="UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <title>My Engineering Story | RAWWW Static Site</title>
</head>
```

*   `noindex`: Explicitly prevents search engines from displaying this page in search results.
*   `nofollow`: Prevents indexers from crawling and passing authority through any links contained inside this page.

---

# Layer 2: GitHub Repository Isolation (The Source)

If your GitHub repository is public, its contents are automatically scanned by GitHub Search, exposing raw Markdown text files to global keyword queries. To suppress internal visibility, two approaches exist.

## Method A: Private Repository Deployment (Recommended)

GitHub allows standard **GitHub Pages** execution directly from **Private Repositories** for free accounts. 

1. Go to your repository settings on GitHub.
2. Change the repository visibility from **Public** to **Private**.
3. Navigate to the **Pages** tab in settings and ensure the deployment branch remains active.

*Result:* The final compiled static website remains publicly visible to the world at your custom URL, but the underlying repository, commit history, raw Markdown text, and asset structures are completely invisible to external users and internal GitHub indexers.

## Method B: `.gitattributes` Exclusion (Alternative)

If the repository must remain strictly Public for open-source visibility, you can force the internal GitHub search engine (**Linguist**) to ignore specific files or treat them as generated compiler artifacts, removing them from search logic.

Create a file named `.gitattributes` in the root of your repository and map your private paths:

```text
story.md linguist-vendored
meditations.md linguist-vendored
resume.pdf linguist-generated
```

*   `linguist-vendored`: Tells GitHub that this is third-party or vendored documentation data, excluding it from standard code search queries and language tracking statistics.
*   `linguist-generated`: Marks the file as a machine-built asset (like a compiled binary), neutralizing its prominence in textual search.

---
`42. System isolated. Scope constrained.`

