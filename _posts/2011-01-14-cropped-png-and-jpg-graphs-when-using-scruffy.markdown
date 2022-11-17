---
layout: post
title: "Cropped png and jpg graphs when using scruffy"
date: 2011-01-14 12:28
tags: 
---

I've been messing with the ruby graph library,
[scruffy](http://scruffy.rubyforge.org/), recently and I ran into a wee problem
that blocked me for a few days. The images were creating perfectly in SVG. I
could resize them as I wanted and all the information was being shown. Then I
decided to output them as either PNG or JPG images. Every image that was output
was being cropped to 320x200 pixels and most of the information was being lost.

It took a while of investigating rmagick (the library used to convert from SVG
to other formats) before I realised that the problem wasn't there. It was in
the scruffy gem itself. On line 35 in `renderers/base.rb`, is the section for
the viewBox. The original code is

{% highlight ruby %}
:viewBox => "#{options[:size].first} 100 #{options[:size].last} 200"
{% endhighlight %}

where it should be something like

{% highlight ruby %}
:viewBox => "100 200 #{options[:size].first} #{options[:size].last}"
{% endhighlight %}

With this modification, the graph can be exported to any other type and still
look just as good as the SVG version.  I made the change in a separate file
that is then required in any projects that I want.
