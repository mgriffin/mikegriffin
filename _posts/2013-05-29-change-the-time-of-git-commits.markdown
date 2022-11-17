---
layout: post
title: "Change the Time of Git Commits"
date: 2013-05-29 10:46
tags: 
---
I've been working off a virtual machine for some dev work recently and when I resumed the VM after
it had been asleep for a while, the time was off. I hadn't set up ntp to set the time and didn't
notice it was a few days behind until after I pushed some commits up to github.

The timestamps were all way off and I didn't like it, not one little bit.

After some finagling around on the interwebs, I found a solution: interactive git rebase

Here's the steps I followed to fix the times on the commits. I wanted to change the time on the
last two commits so I used `HEAD~2`

{% highlight bash %}
git rebase -i HEAD~2
{% endhighlight %}

Change the first word from `pick` to `edit` on both lines and exit

{% highlight bash %}
git commit --amend --date="Tue May 28 15:39:08 2013 +0100"
git rebase --continue
{% endhighlight %}

Do the same for the other commit.

When you're happy, you can force a push to github (but make sure no one else has pulled from it
in the meantime)

{% highlight bash %}
git push -f origin master
{% endhighlight %}

And, hey presto, that's how you modify the commit time through git. Now, go off and fix ntp, you fool!
