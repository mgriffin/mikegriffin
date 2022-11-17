---
layout: post
title: "Zebra striping a table with a ruby helper"
date: 2010-10-10 04:27
tags: 
---
I was trying to find a way to alternate the row colours in an HTML table for a Ruby application and stumbled across [this DZone snippet](http://snippets.dzone.com/posts/show/411).

The code in the snippet is:

{% highlight ruby %}
  def alternate(str1 = "odd", str2 = "even")
   @alternate_odd_even_state = true if @alternate_odd_even_state.nil?
   @alternate_odd_even_state = !@alternate_odd_even_state
   @alternate_odd_even_state ? str2 : str1
  end
{% endhighlight %}

This is used in a HAML view with the following code: 
{% highlight ruby %}
%tr{:class => alternate('other', '')}
{% endhighlight %}
