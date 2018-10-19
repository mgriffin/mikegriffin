---
layout: post
title: "Greedy and Non Greedy Regexes in Vim"
date: 2018-10-19 19:51
categories: vim
---
I was messing around with some text manipulation recently.
You know the type of thing, copy a table from a webpage and transform it to a CSV file or to JSON, nothing too difficult, but it can be time consuming.

To ease the tedium and save my fingers from some typing, I wanted to do a major search and replace in vim.
I like to think I'm pretty competent in vim, and with regexes, so I thought this would be straightforward.
In the end it was, but it took some time to find out how to do non greedy searches.

First things first, always use `\v` at the start of your regex, this allows you to use special characters without having to escape them.
It's the difference between `/a\+b\+c\+` and `/\ca+b+c+`.
It might not seem much there, but wait till you see the monstrosity I came up with at the end of this article!

In vim, the `+` character is used to match more than one of the previous character, for exacmple `/\vg+` would match `gggggg`.
This is all well and good until you want to match all up to a space.
Take this string as an example:

```
Mike GRIFFIN        Liffey Valley AC    M    M35    1090
```

Using a regex of `/\v.+ ` will match

```
Mike GRIFFIN        Liffey Valley AC    M    M35    
```

which is way more than I wanted.

Enter the non greedy multiplier, `{-}`.

Using a regex of `/\v.{-}` on the string above gives

```
Mike 
```

which is better.

That set me on my way to be able to transform lines like this:

```
16     Mike GRIFFIN        Liffey Valley AC    M    M35    1090    (17:17)    17:20    
```

into:

```
  - place: 16
    name: Mike GRIFFIN
    club: Liffey Valley AC
    category: M35
    time: 17m20s
```

The final regex was this maserpiece, or monstrosity, but it got the job done:

```
:%s/\v^(\d+)\s+(.{-})  +(.{-})  +\S  +(\S{2,3})  +\d+  +\S+  +(\d+):(\d+)/  - place: \1\r    name: \2\r    club: \3\r    category: \4\r    time: \5m\6s/
```
