---
layout: post
title: "Deleting Old Emails in Mutt"
date: 2018-11-29 12:14
categories: mutt
---
A note for myself so that I won't forget how to delete older emails from my mailboxes.

First of all use the limit search, `l` to show the emails that will be deleted.
A limit string like `~d 01/01/2017-` will show all emails older than January 1st, 2017.

Then tag these emails with `T`, you can tweak the search string if needs be here.

To delete the tagged emails, press `;d` and then `$` to sync the mailbox.
