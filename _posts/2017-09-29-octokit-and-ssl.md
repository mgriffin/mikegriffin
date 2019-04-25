---
layout: post
title: Octokit and SSL
date: 2017-09-29 11:54
categories: memory
---
I do a lot of work using self signed certificates and sometimes I want to use [octokit.rb](http://octokit.github.io/octokit.rb/).
By default, octokit tries to verify the SSL cert and fails with an error like:

```
SSL_connect returned=1 errno=0 state=error: certificate verify failed
```

To get past this, you can [disable this setting](http://octokit.github.io/octokit.rb/#SSL_Connection_Errors) by adding:

```
client.connection_options[:ssl] = { :verify => false }
```

I'm adding this here because I keep having to look it up and it takes me a while to find it each time.

### EDIT 2019-04-25

This has changed in the last while and now it needs this instead:

```
client.ssl_verify_mode = OpenSSL::SSL::VERIFY_NONE
```
