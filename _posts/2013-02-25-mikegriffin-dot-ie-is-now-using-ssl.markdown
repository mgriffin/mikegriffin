---
layout: post
title: "Mikegriffin.ie Is Now Using SSL"
date: 2013-02-25 13:17
tags: 
---
As of last week, this site is set up to use https. It shouldn't make much of a
difference, if any, to the usage of the site apart from encrypting the traffic
to your browser. I decided to set it up this way after reading Tim Bray's
article [Private By Default](https://www.tbray.org/ongoing/When/201x/2012/12/02/HTTPS).
He goes into a bit of detail explaining why he did it and I liked the ideas 
so I thought, why not?

I'd actually been searching for that article for a while because I read it
shortly after it was published and had filed it away in the back of my mind
as an interesting experiment to try out. Unfortunately, the back of my mind
is not the best place to retrieve information from. I think it hides behind
some big boxes and other assorted knowledge and refuses to come out. Luckily
I came across another article that referenced it and I was back to where I
wanted to be.

I used [StartSSL](https://www.startssl.com/) to create the SSL certificate
and followed [Pete Keen's article](http://bugsplat.info/2013-01-27-increasing-the-encryption-noise-floor.html)
to set up SSL with nginx. This was where I was pointed to the free SSL
certificates from StartSSL as well, thanks Pete!

I also set up my [training log site](https://watchmetrain.net) to use https
while I was at it.
