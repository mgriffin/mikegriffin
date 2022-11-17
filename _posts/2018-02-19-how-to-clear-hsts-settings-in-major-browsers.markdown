---
layout: post
title: "How to Clear HSTS Settings in Major Browsers"
date: 2018-02-19 14:09
tags: HSTS
---

The page that I refer to most often for clearing HSTS settings is no longer
available except through a [wayback machine
link](https://web.archive.org/web/20170716085502/http://classically.me/blogs/how-clear-hsts-settings-major-browsers)
so I'm adding another redundant copy of the information that was on it to the
web. Here'e the meat of the article:

![](/images/2018-02-09-how-to-clear-hsts-settings-in-major-browsers/firefox.jpg)

## Firefox 26: How to fix "Error code: ssl_error_bad_cert_domain"

If you see "I understand the risks", [follow these instructions](https://support.mozilla.org/en-US/questions/948317).  Otherwise:

1. Close all tabs open with the site
1. [Clear your history](http://support.mozilla.org/en-US/kb/remove-recent-browsing-search-and-download-history)
1. In the address bar, type `about:permissions`
1. Search for and click on the site
1. Click "Forget About This Site"

![](/images/2018-02-09-how-to-clear-hsts-settings-in-major-browsers/chrome.jpg)

## Chrome, Opera: "Cannot connect to the real <domain name>"

1. In the address bar, type `chrome://net-internals/#hsts`
1. Type the domain name in the text field below "Delete domain"
1. Click the "Delete" button
1. Type the domain name in the text field below "Query domain"
1. Click the "Query" button
1. Your response should be "Not found"

## Safari: Clear the HSTS cache.

1. Close Safari
1. Delete the `~/Library/Cookies/HSTS.plist' file
1. Reopen Safari

## References

- [Safari Reference](http://apple.stackexchange.com/questions/107699/does-safari-on-os-x-mavericks-ignore-browsing-history-preferences)
- [Chrome, Opera Reference](https://www.imperialviolet.org/2011/02/17/hstsui.html)
