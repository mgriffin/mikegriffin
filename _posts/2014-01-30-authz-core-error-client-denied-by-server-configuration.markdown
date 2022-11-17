---
layout: post
title: "Authz_core:error Client Denied by Server Configuration"
date: 2014-01-30 12:11
tags: 
---
I upgraded a copy of apache that was being used in work earlier and I ran in to some errors 
that were quite puzzling.

Every time I went to access the site, I was shown an error in the logs that read:

{% highlight yaml %}
  [authz_core:error] [pid 26128:tid 2964360000] [client <IPADDRESS>:49688] AH01630: client denied by server configuration: /path/to/file.wsgi
{% endhighlight %}

Nothing had changed in the application so after consulting the great google, I
found out that ``mod_authz_core`` was introduced in Apache2.3. This changes the
way that access control is declared from

{% highlight yaml %}
  Order allow, deny
  Allow from all
{% endhighlight %}

to :

{% highlight yaml %}
  Require all granted
{% endhighlight %}

This means that the total configuration for a ``Directory`` is now something like:

{% highlight yaml %}
  <Directory /path/to/directory>
    Options FollowSymlinks
    AllowOverride none
    Require all granted
  </Directory>
{% endhighlight %}

Restart apache and it'll all work nicely.
