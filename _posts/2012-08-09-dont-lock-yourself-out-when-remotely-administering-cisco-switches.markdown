---
layout: post
title: "Don't Lock Yourself Out When Remotely Administering Cisco Switches"
date: 2012-08-09 14:54
comments: true
categories: 
---
Remotely administering switches is very handy until you input a command and hit
enter and then...nothing. You've done something to drop the connection that you
had held so dear.

Usually the only thing to do in that situation is to get up and walk to the switch
and either fix the problem or restart it and let the saved configuration come back.

But there is a better way. Set a reboot timeout before you make any changes and 
unless you cancel it, the switch will reboot after a certain amount of time.

To do this, you use the command `reload in 5`

You can write the running config by using `wr mem` to make sure that you have a 
saved configuration that you are happy with. `show reload` will tell you how long
is left on the reload that you set before. If you need more time, just issue the
command again. To cancel it, use `reload cancel`

{% highlight bash %}
Switch#wr mem
Building configuration...
[OK]
Switch#reload in 5
Reload scheduled for 15:05:35 IST Thu Aug 9 2012 (in 5 minutes)
Proceed with reload? [confirm]y
Switch#show reload
Reload scheduled for 15:05:35 IST Thu Aug 9 2012 (in 4 minutes and 51 seconds) by console
Switch#reload cancel
Switch#


***
*** --- SHUTDOWN ABORTED ---
***

Switch#show reload
No reload is scheduled
Switch#
{% endhighlight %}
