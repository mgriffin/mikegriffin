---
layout: post
title: "Search Through Your Bash History"
date: 2013-05-19 19:41
comments: true
categories: 
---
You can search backwards through your bash history by using `ctrl-r`. That's a 
fairly well known command and I've been using it for a while now so it's become
part of my muscle memory like `<esc>:wq`

But sometimes I go too far in the search and I want to get back to the last item.
To search forwards you can use `ctrl-s`. There is a small problem with this though.
Most terminals have flow control turned on, and `ctrl-s` pauses the terminal (If you
find that this has happened to you, use `ctrl-q` to un pause the terminal)

To fix this, you can use

{% highlight bash %}
stty -ixon
{% endhighlight %}

I've added this to my .bashrc file now to make it the default.
