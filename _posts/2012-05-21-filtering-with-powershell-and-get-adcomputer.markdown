---
layout: post
title: "Filtering With Powershell and Get-ADComputer"
date: 2012-05-21 16:53
tags: 
---
Using Powershell to automate Windows administration tasks is a fairly common
thing. I wanted to find out which Active Directory Computer accounts were
obsolete or have never been used and then move them into a different
Organisational Unit to clean things up a little.

Finding the obsolete accounts was easy enough. I wanted to find any computer that
hadn't logged on to the domain in the last year.

{% highlight ruby %}
$d = [DateTime]::Today.AddDays(-365)
Get-ADComputer -filter {(enabled -eq "true") -and (lastlogondate -le $d)} -properties cn,lastlogondate
{% endhighlight %}

This gave me the name and last logon date.

From here, I used
{% highlight ruby %}
Move-ADObject -Targetpath 'ou=disabled computers,dc=example,dc=com'
{% endhighlight %}
and it moved the computer accounts to the disabled computers OU.


The full command was
{% highlight ruby %}
$d = [DateTime]::Today.AddDays(-365)
Get-ADComputer -filter {(enabled -eq "true") -and (lastlogondate -le $d)} -properties cn,lastlogondate | Move-ADObject -Targetpath 'ou=disabled computers,dc=example,dc=com'
{% endhighlight %}

The problem was that this didn't take into account any computers that hadn't logged 
in at all (i.e. they had a null lastlogondate). The first thing I tried was:

{% highlight ruby %}
Get-ADComputer -filter {(enabled -eq "true") -and (lastlogondate -eq $null)} -properties cn,lastlogondate
{% endhighlight %}

but that spat back an error:
{% highlight ruby %}
Get-ADComputer : Variable: 'null' found in expression: $null is not defined.  At line:1 char:15
{% endhighlight %}

After much searching and trying different things, I found that this worked:

{% highlight ruby %}
Get-ADComputer -filter {enabled -eq "true"} -properties cn,lastlogondate | where {$_.lastlogondate -eq $null}
{% endhighlight %}

Unfortunately this takes all the enabled computer accounts and then filters down
through them looking for the ones that have a lastlogondate that equals $null. This
means that it's a lot slower than if we were able to apply the filter directly but
for my purposes, it worked and that was all I needed.

It's inportant to remember to put in the -properties section to bring back the 
lastlogondate as it isn't returned by default!
