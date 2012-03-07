---
layout: post
title: "Zenphoto Deleting Album Titles"
date: 2012-03-07 15:37
comments: true
categories: 
---
I run an installation of Zenphoto for my [Dad and the photos he
takes](http://www.photosofblacklion.net). I recently upgraded it from an older
version to version 4.2.1 and since then I have been getting calls to fix the
album titles from him.

It turns out that something was causing the album title to be cleared whenever
the album was moved or edited. I could easily go into the database and fix
it by hand but when there are a few albums going up each weekend, it gets
tiresome to do it each time. So I went looking and digging.

I traced it back to the `print_language_string_list` function in 
`zp-core\admin_functions.php`. This function was returning the input form 
element for the title of the album. It also changed the name of the element
by appending the locale string to the end of it. The upshot of all this was 
that when the form was submitted, it couldn't find the string with the album
name in it, so it set it as a blank string.

To fix it, I edited line 2461 of `zp-core\admin_functions.php` from:

{%highlight php startinline %}
echo '<input name="'.$name.'_'.$locale.'"'.$edit.' type="text" value="'.html_encode($dbstring).'" size="'.$wide.'" />';
{% endhighlight %}

to:

{%highlight php startinline %}
echo '<input name="'.$name.'"'.$edit.' type="text" value="'.html_encode($dbstring).'" size="'.$wide.'" />';
{% endhighlight %}
