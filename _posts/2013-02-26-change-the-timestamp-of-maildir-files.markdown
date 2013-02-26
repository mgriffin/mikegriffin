---
layout: post
title: "Change the Timestamp of Maildir Files"
date: 2013-02-26 12:47
comments: true
categories: 
---
I've been moving some things around and set up my own mail hosting using Postfix and 
Dovecot. I set it up to save my mails into a Maildir format mailbox and then
proceded to copy in old mails so that I could keep everything together. Unfortunately
as I was doing this, the timestamps of the files went out of sync with the delivery
times of the mails. This meant that some of the mails were sorted differently to
what they should have been. I didn't like that, so I set to work.

I found out that `touch` can be used to set a timestamp on a file with the `-t` flag.
This was a good start, but I didn't want to have to edit each file, find the right
date, transform that date by hand and then run `touch` on the file to set the timestamp,
especially as the filenames were all about 60 characters long and very similar. The
potential for making a mistake was too high.

That meant that some small amount of scripting was in order to solve the issue. I
used `grep` to capture the date and then cut out the unwanted fields from the returned
line. There was only one field that I didn't want, so instead of defining the ones I
did want, I defined the one I wanted to get rid of and then used the flag `--complement`
to invert the selection. That was a nice handy tip to find.

Next, I created the timestamp in the format that `touch` wanted. I used `date` for this
and fed in the line from above. This was formatted using the `+` flag.

Lastly, put it all together, `touch` the file and output a status message saying that
it was done.

This is a very simple script and could be simplified even further by combining the
commands into one. I thought that would be less readable for future so I left it as is.
It has to be run from the directory that holds the files, has no error checking and 
would probably bomb out badly if it met files that don't match, but it worked for me
and it might even work for you.

Here it is in all its glory.

{% highlight bash %}
#!/bin/bash

for i in `ls`
do
  # Find the date field and then remove up to the first space (Date: )
  DATE=$(grep '^Date:' $i | cut -d' ' -f1 --complement)

  # Create a timestamp from the date above
  STAMP=$(date --date="$DATE" +%Y%m%d%H%M)

  # touch the file with the correct timestamp
  touch -t $STAMP $i

  echo "$i stamped"
done
{% endhighlight %}
