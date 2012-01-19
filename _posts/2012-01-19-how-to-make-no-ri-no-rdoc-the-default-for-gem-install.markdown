---
layout: post
title: "How to Make --no-ri --no-rdoc the Default for Gem Install"
date: 2012-01-19 11:45
comments: true
categories: 
---
Whenever I set up a new instance of rubygems, the first thing that I have
to do is to stop the documentation from being installed with every gem. And
I always forget how to do it. This is how.

In your `~/.gemrc` file, add the following line:

{%highlight ruby %}
gem: --no-ri --no-rdoc
{% endhighlight %}

That's all there is to it.
