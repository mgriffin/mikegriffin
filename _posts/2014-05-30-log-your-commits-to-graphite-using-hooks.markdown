---
layout: post
title: "Log Your Commits to Graphite Using Hooks"
date: 2014-05-30 17:33
tags: 
---
Everyone says graphite is great but you need to have data in there to make any use of it. 
The best way to get data in is to do it automatically.
So I set up a post-commit hook.

This is how it's done on subversion, it's the same sort of procedure on any of the other version control systems (git, mercurial etc).

Add the following code to `hooks/post-commit`:

{% highlight bash %}
echo "commits.appname:1|c" | nc -w 1 -u <ip address of your graphite server> 8125
{% endhighlight %}

Then run `chmod 755 hooks/post-commit` and commit away.
Easy peasy.

Now, for a little explanation.
This command sends the number 1 as a count to the `commits.appname` bucket using `netcat`.
It has a timeout of 1 second (`-w 1`) and sends the data over UDP (`-u`).
The number on the end (`8125`) is the port that graphite (or statsd in this case) is listening on.
