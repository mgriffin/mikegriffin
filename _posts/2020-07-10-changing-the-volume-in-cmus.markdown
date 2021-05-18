---
layout: post
title: "Changing the volume in cmus"
date: 2020-07-10 14:53
categories: 
---
Sometimes I like to play music that I have on my local machine, or stream radio stations while I'm working and I've been using [cmus](https://cmus.github.io/) to do this.
It works great and just plays away in the background, but the up to now, the volume has been just a touch too high.

Trying to change the volume using `+` or `-` resulted in:

```
Error: can't change volume: mixer is not open
```

I've been living with it, but today I did a little search and lo and behold, I [found the solution](https://superuser.com/questions/1412126/why-cant-i-change-the-volume-in-cmus).
I'm storing the steps here for future me to find them again.

- In cmus, press `7` to go to the settings page
- Use `/` to search for `softvol`
- Press enter to edit the setting
- Change `false` to `true` and press enter to save it
- Use `+` and `-` to change the volume 🎉
