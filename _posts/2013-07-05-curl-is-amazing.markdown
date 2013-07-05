---
layout: post
title: "cURL Is Amazing!"
date: 2013-07-05 16:06
comments: true
categories: 
---
I wanted to connect to an API and copy each entry so that I can do some text transformations
and the like on the data (don't ask, it's a very long story). I could have written a short
shell script to increment a counter and insert that into the URL and then piped the output
to a separate file for each call. That would be a fairly straightforward way to fix the 
problem.

But as I was looking through the documentation for [cURL](http://curl.haxx.se/), I happened
to stumble upon this little gem.

cURL has the ability to increment a counter for you using a regex. So instead of a shell script,
all I needed to do was run:

{% highlight ruby %}
curl -o file#1.xml "http://your_url_here/get_me_the_xml?id=[1-10]"
{% endhighlight %}

There are a few things to note here.

  * `-o` outputs to a file
  * the filename references the regex later in the command with `#1`
  * the end of the URL is a regex that will iterate from one to ten

It really pays to read through the documentation for the programs you use!
