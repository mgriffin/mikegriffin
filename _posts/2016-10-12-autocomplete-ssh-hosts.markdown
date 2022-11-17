---
layout: post
title: "Autocomplete SSH Hosts"
date: 2016-10-12 22:22
tags: 
---

Once upon a long time ago, I had autocomplete set up in ZSH to complete hosts that I connected to through SSH. Only in the last few days have I set it up again in bash.

I was reading through [Luciano Fiandesio's blog](http://www.lucianofiandesio.com/) on how to configure Mutt and I saw that he has [shared his dotfiles](https://github.com/luciano-fiandesio/dotfiles).
I took a look at his bash configuration and saw this line:

```
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh
```

`complete` is a bash builtin function, which you can read more about in [this TheGeekStuff article](http://www.thegeekstuff.com/2013/12/bash-completion-complete/).
This line will add the hosts in your `~/.ssh/config` file to the autocomplete list for `scp`, `sftp`, and `ssh`.

Pretty handy!
