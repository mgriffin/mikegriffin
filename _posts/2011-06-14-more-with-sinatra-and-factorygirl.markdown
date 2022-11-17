---
layout: post
title: "More with Sinatra and Factory_girl"
date: 2011-04-13 07:40
tags: 
---
To add [factory_girl](https://github.com/thoughtbot/factory_girl) to rspec when
testing a sinatra app, you only have to do a couple of things. First off,
include the following lines in `spec/spec_helper.rb`

{% highlight ruby %}
  require 'factory_girl'
  Dir[File.dirname(__FILE__)+"/factories/*.rb"].each {|file| require file }
{% endhighlight %}

This will look into `spec/factories` for each `.rb` file and use each one as a
different factory file. Create a file with something simiilar to the following

{% highlight ruby %}
  Factory.define :post do |f|
    f.title "A post title"
    f.body "A full bodied post"
  end
{% endhighlight %}

and then in your rspec file, you can use it like this

{% highlight ruby %}
  Factory(:post)
{% endhighlight %}

