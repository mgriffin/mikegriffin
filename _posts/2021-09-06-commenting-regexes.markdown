---
layout: post
title: "Commenting Regexes"
date: 2021-09-06 11:19
tags: programming
---
Regexes are really useful but as the old saying goes:

> Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.

One of the issues that I have with them is that sometimes they can take a bit of testing to get them to work.
When you come back to them after a while, it's like looking at hieroglyphics, with little chance of understanding them again.

To try and combat this, I've been commenting my regexes over multiple lines, like this:

```
$findGRpattern = "/\b".          # start the search on a word boundary
                 "(?<![.])".     # a negative lookbehind to exclude numbers with decimal places
                 "(".            # start the capture
                 "[A-HJ-Z]?".    # an optional capital letter that is not an I
                 "\d{3,5}".      # 3, 4, or 5 numbers
                 "\s?".          # an optional space
                 "\d{3,5}".      # another 3, 4, or 5 numbers
                 ")".            # stop the capture
                 "[A-Z]?".       # an optional capital letter
                 "\b/";          # finish the search at a word boundary
```

I've broken each section of the regex up onto its own line and added a short comment about what it is supposed to do.
I've found that this helps when I come back and have to debug or add something into the regex at a later stage.

How do you go about making your regexes future friendly?

### Relevant Links

- [Regular Expressions: Now You Have Two Problems](https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/) from coding horror.
