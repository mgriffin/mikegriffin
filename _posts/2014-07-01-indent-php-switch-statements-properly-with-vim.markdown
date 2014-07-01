---
layout: post
title: "Indent PHP Switch Statements Properly With Vim"
date: 2014-07-01 15:42
comments: true
categories: 
---
I use vim as my main editor and it works great, except for one thing. Indenting `switch`
statements in vim. For some reason, vim seems to think that this is the right way:

{% highlight php %}
switch ($narf) {
case 'troz':
    // stuff goes here
    break;
}
{% endhighlight %}

But everyone knows that's wrong. There is a simple solution though, just add

{% highlight bash %}
let g:PHP_vintage_case_default_indent = 1
{% endhighlight %}

to your `.vimrc` and work away without any issues. This is what happens after adding
that line:

{% highlight php %}
switch ($narf) {
    case 'troz':
        // stuff goes here
        break;
}
{% endhighlight %}

I've been fighting this for so long so to finally find the solution is a huge relief.
It's amazing what you find when you break down and actually look through the 
documentation!
