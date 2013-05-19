---
layout: post
title: "Arithmetic in Vim"
date: 2013-05-19 00:02
comments: true
categories: 
---
Have you ever wanted to do some simple arithmetic in vim? Did you have a list of
times that you wanted to transform into seconds? I did and here's how I did it.

The data I had was in mm:ss format like this:

{% highlight bash %}
|23:58|6:40|
|12:45|0:25|
|36:13|12:00|
{% endhighlight %}

I wanted it just in seconds so I multiplied the first number by 60 and then
added the second to it in each column.

{% highlight bash %}
:s/|\(\d\+\)/\='|'.(submatch(1)*60)/g
:s/|\(\d\+\):\(\d\+\)/\='|'.(submatch(1)+submatch(2))/g
{% endhighlight %}

What this does is search for numbers after |. It stores that number in the first
submatch register. Using `\=` tells vim that you want to use a calculated value.
This calculated value is concatenated with a string to give the full output, which 
in this case is the minutes multiplied by 60 to get the number of seconds.

The second search and replace takes the two numbers separated by a colon and simply
adds them together.

The `g` at the end runs the replace multiple times on the same line instead of
stopping after the first match.

I ended up with data like

{% highlight bash %}
|1438|400|
|765|25|
|2173|720|
{% endhighlight %}

Perfect!
