---
layout: post
title: "Sequel dates come in two flavours"
date: 2010-10-20 09:48
tags: 
---

When you have a `datetime` field in your database, by default it returns it as
a `Time` object. If you're using a Ruby version less than 1.9.2, Time has a
limited range from 1901 to 2038. If your dates fall outside this range, you
will need to set 

{% highlight ruby %}
Sequel.datetime_class = DateTime
{% endhighlight %}

before you call 

{% highlight ruby %}
DB = Sequel.odbc('your_odbc_connection', :db_type => 'mssql')
{% endhighlight %}

or equivalent.

The error that I was getting was

{% highlight ruby %}
ArgumentError: argument out of range
    * file: timezones.rb
    * location: local
    * line: 110
{% endhighlight %}
