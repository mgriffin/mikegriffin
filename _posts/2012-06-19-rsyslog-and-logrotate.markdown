---
layout: post
title: "RSyslog and LogRotate"
date: 2012-06-19 09:49
comments: true
categories: 
---
A while ago I set up remote syslog collection for PIX firewall logs. It's been
working okay but something wasn't quite right. The logs were changing every seven
days instead of every day like I wanted and the old log file didn't seem to be
closed properly some of the time.

I did a little investigating and looked through the configuration files again to make
sure that everything was right.

{% highlight ruby %}
  /var/log/pix/pix.log {
    rotate 60
    daily
    delaycompress
    compress
    missingok
    notifempty
    postrotate
      invoke-rc.d rsyslog reload > /dev/null
    endscript
  }
{% endhighlight %}

That looks okay, I thought.

  * keep 60 days of logs
  * make a new one daily
  * don't compress the last log file
  * compress all the others
  * it's ok if there is a missing day
  * do not rotate the log if it's empty
  * run a command after the rotate to reload the configuration

To test the postrotate command, I ran it manually from the command line and tada!
There was the problem. There is no `reload` flag, it should be `force-reload`. Off I
went and edited the configuration file and it's been working fine since.


