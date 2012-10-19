---
layout: post
title: "Puppet Errors With Version 3.0 and Passenger"
date: 2012-10-05 10:39
comments: true
categories: 
---
I have set up a test [Puppet](http://puppetlabs.com/) server in work to manage
server configurations. I'm using version 3.0.0 on a debian host with a
Passenger frontend. This is the recommended method of doing it but it seems
there is a [bug](https://projects.puppetlabs.com/issues/16769) in this setup
that stops clients from connecting and requesting a certificate.

I was getting the following error

{% highlight bash %}
Info: Creating a new SSL key for client.puppet.example
Error: Could not request certificate: Error 400 on SERVER: header too long
Exiting; failed to retrieve certificate and waitforcert is disabled
{% endhighlight %}

I also wasn't seeing any certificates being created on the puppet master server.

After reading the [bug report](https://projects.puppetlabs.com/issues/16769),
removing `+ExportCertData` from the SSLOptions section and restarting apache, I was
able to join the clients to the server as expected.

Now it's time to write some manifests and push the configuration out to my test
servers. 
