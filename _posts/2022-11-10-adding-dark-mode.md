---
layout: post
title: "Adding dark mode"
date: 2022-11-10 09:15
categories: site
---
Yesterday I did a bit of a refurb around the place, changing the look and colours a little bit.
On top of this I added [dark mode](https://github.com/mgriffin/mikegriffin/commit/39478c62097646f13425e2a2998c3bf564306cbf) which should work automatically depending on your OS settings.

Because of the [simple css](https://simplecss.org/) project that I used, it was an easy process to change the colours to something that made it a bit more personal, using [CSS variables](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties).

I wasn't sure how to do it using a static site, so I did my usual research on the interwebs and came across [this great article by Derek Kedziora](https://derekkedziora.com/blog/dark-mode-revisited).
Originally I thought that a button to allow someone to change the mode would be the way to go but it turns out that it's even easier to allow the OS to define when dark mode or light mode should be enabled.
This is because every major browser supports the CSS media query `@media (prefers-color-scheme: dark)` which where you can define the dark mode colours for your site. 🎉

### Here's how it looks now:

Light:

![cropped screenshot of this site's light theme](/images/2022-11-10-adding-dark-mode/light-mode.jpg)

Dark:

![cropped screenshot of this site's dark theme](/images/2022-11-10-adding-dark-mode/dark-mode.jpg)
