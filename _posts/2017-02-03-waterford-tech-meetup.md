---
layout: post
title: Speaking at the Waterford Tech Meetup
date: 2017-02-03 22:50
categories: speaking
---
I was asked to speak at the January Waterford Tech Meetup on January 25th at Boxworks.
I spoke about a project that I've been working on for quite some time for my Dad.
He takes a lot of photographs and wanted to update the site he uses to show odd his photos, it was running an old version of ZenPhoto.
Now it's a static site hosted on GitHub Pages and using AWS S3 to store the photos.

I talked about how to use Dropbox and webhooks to automatically update the GitHub Pages site and upload the photos to S3.
At the moment it's not very sophisticated, it lacks a lot of checks and tests to ensure that things aren't overwritten, but as it's backed by a Git repository, I figure that I'll always be able to manually fix things.

My slides from the night are at [https://speakerdeck.com/mgriffin/update-github-pages-through-dropbox](https://speakerdeck.com/mgriffin/update-github-pages-through-dropbox) and my Dad's site is [https://www.photosofblacklion.net]([https://www.photosofblacklion.net).
Go check them both out and take a look at the relevant repositories at [https://github.com/PhotosOfBlacklion](https://github.com/PhotosOfBlacklion).
Pull Requests and questions welcome!
