---
layout: post
title: "Using Pipe With Ruby Scripts"
date: 2016-05-25 11:50
comments: true
categories: 
---
I've been writing some Ruby scripts recently to parse some text files and I was
looking for a way to pass in only part of a file instead of the full 1500
lines. If I was bash scripting, I could use `head` to extract part of the text
file and then pipe it in to my script. But that wasn't going to work in this
case because I was passing the filename as a command line argument like this:

```
input = File.open(ARGV[0])
```

A quick search and I found [this blog
post](http://www.jstorimer.com/blogs/workingwithcode/7766125-writing-ruby-scripts-that-respect-pipelines)
describing exactly what I wanted to achieve.

Instead of using `File.open(ARGV[0])`, I could use `ARGF.read` and it would work in both
scenarios. Now I can run the Ruby script in two ways:

```
./script.rb filename
```

or

```
head filename | ./script.rb
```

Very handy.
