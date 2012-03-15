---
layout: post
title: "Dcdiag Errors"
date: 2012-03-15 16:30
comments: true
categories: 
---
Using windows Server 2008 can sometimes throw up some strange and frankly
confusing errors.

Have you ever run dcdiag.exe and found errors that you couldn't understand?
Things like 

    User credentials does not have permission to perform this operation.
    The account used for this test must have network logon privileges
    for this machine's domain.
    ........................ failed test NetLogons

or

    ....................... failed test Replications

or

    ....................... failed test Services


I was pulling my hair out over this one until I realised that I was 
running the command prompt under my own login. Even though I had Domain
Admin privileges, Windows Server 2008, in its infinite wisdom, decided
that I didn't. I had to run the command prompt as an administrator.

  * Click Start
  * Right click Command Prompt
  * Select "Run as Administrator"
  * Run ``dcdiag /v`` as often as you like
