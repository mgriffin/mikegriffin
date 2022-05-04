---
layout: post
title: "Saving Tmux Scrollback to a File"
date: 2022-05-04 17:15
comments: true
categories: 
---
I do most of my console work using tmux so that I can get multiple windows to see different things at the same time.
Sometimes, I copy the scrollback from one pane into a file so that I can save it or work on it in some way.

Today, I ran into a problem with that because I had somehow created a single line with over 32,000 characters.
When I tried to paste it into vim, as I usually do, my CPU shot up to 100% and vim stopped responding.

I went looking for a solution and found [this Stack Exchange post](https://unix.stackexchange.com/questions/26548/write-all-tmux-scrollback-to-a-file).
There's loads in there, but the bit I used straight away was `CTRL+A` and then

```bash
:save-buffer ~/long-string.txt
```

This wrote the text that I had copied into the buffer to a file in my home directory where I could do with it as I pleased.

Some of the other neat things in there are

```bash
:capture-pane -S -3000
```

This will get the last 3,000 lines from the pane's history and dump them into the buffer.
There's also `-E` to specify an end, as well as using `-` instead of specifying a number to get all the lines.

As the icing on the cake, here's a binding that lets you store the pane history in a file of your choosing in one go:

```bash
bind-key P command-prompt -p 'save history to filename:' -I '~/tmux.history' 'capture-pane -S -32768 ; save-buffer %1 ; delete-buffer'
```
