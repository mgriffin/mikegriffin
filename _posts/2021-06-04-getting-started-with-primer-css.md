---
layout: post
title: Getting Started with Primer CSS
date: 2021-06-04 21:20
tags: 
---

[Primer CSS](https://primer.style/css/) is the framework that GitHub.com uses for its design and it has a whole bunch of well designed bits that go together.
The documentation is really good and it's easy to find most things.

The one thing I struggled with was trying to get a HTML page to hang the CSS bits off. Here's what I ended up with:

```
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>My Site</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/assets/css/primer.css">
  </head>
  <body>
    <div class="Header">
      <div class="Header-item">
        <a class="Header-link f4 d-flex flex-items-center" href="/">My Site</a>
      </div>
    </div>
    <div class="container-lg">
      <div class="p-5">
        <p>This is text</p>
      </div>
    </div>
  </body>
</html>
```

It's a fairly straightforward HTML5 layout with a `Header` at the top and a `container-lg` to hold the content in the main part.
The [documentation on containers](https://primer.style/css/objects/grid#containers) and their sizes was hidden away at the bottom of the `Objects > Grid` section.

I hope this helps anyone that wants to start using Primer to style their site.
