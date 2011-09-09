---
layout: post
title: "Using factory_girl with sinatra and the sequel gem"
date: 2010-10-13 14:27
comments: true
categories: 
---

Sequel does not appear to have a `save!` method which means that using [factory_girl](https://github.com/thoughtbot/factory_girl) is a bit more involved. Instead of being able to write `Factory.create` and have the model saved, I found that I had to do it in two steps.

When I tried to use `Factory.create(:post)` I was getting an error telling me

{% highlight ruby %}
undefined method `save!' for #<Post:0x9e8bd08> (NoMethodError)
{%endhighlight %}

To get around the error, I used `Factory.build` and then manually saved the post like this

{% highlight ruby %}
post = Factory.build(:post)
post.save
{% endhighlight %}

That worked and now my cucumber tests are back to passing again
