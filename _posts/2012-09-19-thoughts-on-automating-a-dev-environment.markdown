---
layout: post
title: "Thoughts on Automating a Dev Environment"
date: 2012-09-19 22:48
tags: 
---
I was out for a run earlier and as sometimes happens when I run on my own, my mind
started to wander. Most of the time it leads to places that can't be remembered when
the run is over but occasionally the mental processes have coalesced enough to 
survive the post run machinations and can be worked on further. Today was one of
those days.

### Work
Where I work, we are starting a new set of projects that will probably have a lot of
custom development over the next year at least. Any development that was done to now
was ad hoc and very unstructured. We also have a mostly Microsoft environment which
I wasn't that happy about trying to automate. Most automation systems like Chef and
Puppet seem to assume that you are using a \*nix based system, at least until 
recently.

### An idea
Some of my thoughts today revolved around automating the setting up of an 
environment (virtual or otherwise) that can be used to develop and test .NET and PHP
applications. I want to be able to request a new machine to be built and for that
machine to be built with the dev software installed and ready to use. It would be
nice if there was a way to assign a known and stable address to that server on a per
user basis. 

If I was to request it, the DNS (or hosts file or something else) would have an 
entry for `dev-mike`. If this machine already existed, I should have the option to
delete it and restart with a new one or be greedy and create a second instance. 
I would like to limit the number of servers that it's possible to create to a 
predefined number.

When whatever code is written and committed to version control, it would be good for
it to be pushed to a continuous integration server to be tested before possibly
being pushed to production.

I know all this is possible from reading blogs from Github and Etsy but I guess
they use \*nix based servers and/or have a large team devoted to looking after
whatever setup scripts they use.

### A way to implement it
I can see a few ways to go through this. 

  * Use SCCM to provision a new server
  * Use a virtual machine and a sysprepped image
  * Somehow use Chef/Puppet to provision the server

I guess the first thing to do would be to see if there are command line tools
available for VmWare (we have virtualised most of our servers now) to create
new VMs and set up the basic machine. From here, a sysprepped image with the full
dev environment is probably the handiest as long as it doesn't change too often.

Setting the name, adding it to our domain and adding the DNS entries should be
relatively straight forward from here.

I have installed Gitlab (using gitolite) and Hudson CI to track the source code
and run tests, but I have yet to set it up. I should write a few simple apps to
test out what needs to be done. I think Hudson can check tests that have been run
on a different server so running tests in an production like environment should
be possible.

### Possible Problems
We host our production website server but it's not on the same domain and is only
accessible over http from our internal network. This makes copying and updating
the code a bit of a challenge. Depending on how ling it takes to deploy, it might
be feasible to move the production into our network segment from the DMZ, deploy
the code and then move it back. This doesn't seem like the best idea for a number
of reasons. 

  * We suffer downtime
  * It opens a security hole that could be exploited

### Other Musings
In the long run, we will want to expose more and more internal services to the
general public through a web interface so thinking about these problems now seems
like a good idea. If we can come up with a good solution, or even a working solution
and iterate it from there, we should be in a good position to face any other services
that need to be exposed in the future.

We will need to implement some pretty rigorous logging and monitoring solutions 
to ensure we know exactly what is happening on the network. For this I am leaning
towards graphite for a graphing solution and probably nagios to monitor and 
alert to any problems.

This has been a longer than usual post and covers things that might be rather
than offering solutions to problems that I've been having. If you've managed to 
read this far, I thank you and maybe you should [follow me on
twitter](http://twitter.com/griffinmike) to see how I implement this hodge
podge.
