---
layout: post
title: "What I did yesterday"
date: 2010-10-07 03:49
comments: true
categories: 
---

The blog went live and I added one or two extra bits to the site. I've created an "error page":/404 and also added some very basic logging. I've wanted to do this for ages, mainly as a test to see if it's worth it over something like Google Analytics.

I'm using "Sinatra":http://www.sinatrarb.com/ as the backend for this site and with it it's very easy to create custom 404 messages. I added this to the routes and hey presto

{% highlight ruby %}
  not_found do
    @title = '404'
    haml :'404', :layout => :plain
  end
{% endhighlight %}

What it does is intercept the normal Sinatra error and output `404.haml` in a layout called `plain.haml`. The name of the error page has to contained in quotes because Ruby doesn't allow a number at the start of a symbol. Putting it in quotes gets over this problem.
