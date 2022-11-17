---
layout: post
title: "Installing the nokogiri gem on Snow Leopard"
date: 2010-10-12 13:49
tags: 
---

I was trying to install capybara to do some testing and it was failing on the install of nokogiri. The error I was getting was

{% highlight ruby %}
ERROR:  Error installing nokogiri:
ERROR: Failed to build gem native extension.
{% endhighlight %}

And further down the list of errors I found this

{% highlight ruby %}
checking for xmlParseDoc() in -lxml2... no
-----
libxml2 is missing.  please visit http://nokogiri.org/tutorials/installing_nokogiri.html for help with installing dependencies.
-----
*** extconf.rb failed ***
{% endhighlight %}

I knew I already had libxml2 installed in `/usr` so I just needed this command and it installed perfectly

{% highlight ruby %}
gem install nokogiri -- -with-xml2-dir=/usr --with-xslt-dir=/usr
{% endhighlight %}
