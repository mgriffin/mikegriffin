---
layout: post
title: "Set the Timezone for a User Using Bash"
date: 2011-09-14 08:46
tags: 
---
I host this site on a server that is based in the USA and therefore the timezone on 
the server doesn't correspond with local time here in Ireland. I tried all sorts of
workarounds to get the correct time or to work out the offset and then mentally
figure out what happened when. Then I had some inspiration. Surely I wasn't the first
person to run into this inconvenience. A quick look at the bash homepage later and
I found the solution.

The simple way to fix timezone issues when you aren't in the same timezone as the
server that you are accessing is to set the TZ environment variable. Here's how
to do that in bash. Just add this line to your .bashrc

{% highlight bash %}
export TZ="/usr/share/zoneinfo/Europe/Dublin"
{% endhighlight %}

There are loads of different timezone files located in /usr/share/zoneinfo. Find the
one you want and hey presto!
