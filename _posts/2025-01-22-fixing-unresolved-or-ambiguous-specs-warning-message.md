---
layout: post
title: "Fixing Unresolved or ambiguous specs warning message"
date: 2025-01-22
tags: 
---
In the last few days every time I ran a Ruby command or anything to do with Rails or RubyGems, I got this warning:

```
$ bin/rails c
WARN: Unresolved or ambiguous specs during Gem::Specification.reset:
      stringio (>= 0)
      Available/installed versions of this gem:
      - 3.1.2
      - 3.1.0
WARN: Clearing out unresolved specs. Try 'gem cleanup <gem>'
Please report a bug if this causes problems.
```

The command itself ran properly, but I was getting sick of seeing this noise.
I tried running `gem cleanup stringio` and `bundle cleanup stringio` to no effect.
I tried running `bundle cleanup --force` as suggested in https://stackoverflow.com/questions/17936340/unresolved-specs-during-gemspecification-reset

All to no avail, the pesky warning kept cropping up.

Then I found [this GitHub issue comment](https://github.com/rubygems/rubygems/issues/7657#issuecomment-2514197202) which suggested upgrading the system RubyGems:

```
gem update --system
```

With this, RubyGems was updated to version 3.6.3 and the warning went away!
