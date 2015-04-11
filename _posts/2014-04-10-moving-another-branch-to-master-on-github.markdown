---
layout: post
title: "Moving Another Branch to Master on Github"
date: 2014-04-10 21:20
comments: true
categories: 
---
I've been rewriting [my other site](https://watchmetrain.net) over the last few
months and I was using a different branch to develop on. It has finally come to
the time where I'm happy to release it.

But I ran into a problem, because it has changed so radically, it has veered a long
way away from the master branch that was originally there. To fix this I wanted to
rename the master branch to something else and move the develop branch to be the new
master.

After some searching, I found [a site that had instructions on how to do it](http://limi.co.uk/posts/renaming-master-branch-on-github).
It's a nice simple process and it worked out very easily. I'm going to repeat it here
in case the other page ever disappears.

 *  On Github, set the default branch to something other than master
 *  Rename the local branches

{% highlight bash %}
git branch -m master legacy
git branch -m dev master
{% endhighlight %}

 * Delete the master branch on Github

{% highlight bash %}
git push origin :master
{% endhighlight %}

 * Push up the new master to Github

{% highlight bash %}
git push origin master:refs/heads/master
{% endhighlight %}

 * Push up the legacy code to Github

{% highlight bash %}
git push origin legacy:refs/heads/legacy
{% endhighlight %}

 * Delete the old branch on Github

{% highlight bash %}
git push origin :dev
{% endhighlight %}

That's it, there is now a new master and the old master is in a branch called legacy.
