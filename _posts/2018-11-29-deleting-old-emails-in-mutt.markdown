---
layout: post
title: "Deleting Old Emails in Mutt"
date: 2018-11-29 12:14
categories: mutt
---
A note for myself so that I won't forget how to delete older emails from my mailboxes.

First of all use the limit search, `l` to show the emails that will be deleted.
A limit string like `~d -01/01/2017` will show all emails older than January 1st, 2017.

Then tag these emails with `T`, you can tweak the search string if needs be here.

To delete the tagged emails, press `;d` and then `$` to sync the mailbox.

**EDIT (2018-12-06)**
I had a mistake in the search string, it's now fixed to the proper one, but what I had before (`~d 01/01/2017-`) would limit to all mails _newer_ than January 1st 2017!
