---
layout: post
title: "Change the Git Email Address Recursively"
date: 2012-11-28 02:48
tags: 
---
Have you ever started a git repository and made some commits before realising
that you hadn't set up your email address correctly? I seem to do it too often,
especially in work where we have an internal git server. There is a simple way
to fix it: git filter-branch

{% highlight bash %}
git filter-branch --env-filter "export GIT_AUTHOR_EMAIL='<correct email address>'" HEAD
{% endhighlight %}

This will change all the author email addresses to the same address. This may
or may not be what you want to do. If you want to only change ones that match
another address, you can do this:

{% highlight bash %}
git filter-branch --env-filter "
  if [ $GIT_AUTHOR_EMAIL = '<wrong email address>' ];
  then
    export GIT_AUTHOR_EMAIL='<correct email address>'
  fi
" HEAD
{% endhighlight %}

If you've already pushed to a remote server, you will probably have to force a
push to get it to accept it. If anyone else has pulled from this repository,
then there might be problems. 
