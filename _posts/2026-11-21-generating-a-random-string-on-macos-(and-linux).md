---
layout: post
title: "Generating a random string on macOS (and Linux)"
date: 2026-11-21
tags: 
---
I had need of a random string to add into a config file and I thought there must be an easy way to do it.

A quick search later, and I came across [this blog post from Markus Dosch](https://www.markusdosch.com/2022/05/generating-a-random-string-on-linux-macos/).
I'm noting it here, along with the contents in case it disappears.


> Here is a command that generates a 50-character random string, composed of upper and lower case letters & numbers. This command works both on Linux and macOS:

```
cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 50 | head -n 1
```

> You can modify the command to fit your needs:

> - `fold -w <LENGTH_STRING>`
> - `head -n <NUMBER_OF_STRINGS>`
> - `tr -dc 'LIST_OF_CHARACTERS_TO_INCLUDE'` (e.g. `A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_``{|}~` to include special characters that are frequently used in passwords)
