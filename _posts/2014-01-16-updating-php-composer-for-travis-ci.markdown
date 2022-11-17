---
layout: post
title: "Updating PHP Composer for Travis CI"
date: 2014-01-16 09:37
tags: 
---
I've been playing around with [Travis CI](https://travis-ci.org) recently with
a PHP project that uses [composer](http://getcomposer.org). Composer recently
added support for PSR-4 so I needed to have the latest version installed to
take advantage of this. You can update composer on Travis by putting a line in
to the `install` section. Here's my full `.travis.yml` file:

{% highlight yaml %}
  language: php
  php:
    - 5.4
  install:
    - composer self-update
    - composer update --prefer-dist
{% endhighlight %}
