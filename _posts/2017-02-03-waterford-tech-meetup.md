---
layout: post
title: Speaking at the Waterford Tech Meetup
date: 2017-02-03 22:50
categories: speaking
---
![](/images/2017-02-03-waterford-tech-meetup/boxworks.jpg)

I was asked to speak at the January Waterford Tech Meetup on January 25th at Boxworks.
I spoke about a project that I've been working on for quite some time for my Dad.
He takes a lot of photographs and wanted to update the site he uses to show odd his photos, it was running an old version of ZenPhoto.
Now it's a static site hosted on GitHub Pages and using AWS S3 to store the photos.

I talked about how to use Dropbox and webhooks to automatically update the GitHub Pages site and upload the photos to S3.
At the moment it's not very sophisticated, it lacks a lot of checks and tests to ensure that things aren't overwritten, but as it's backed by a Git repository, I figure that I'll always be able to manually fix things.

My Dad's site is [https://photosofblacklion.net](https://photosofblacklion.net).
Go check it out and take a look at the relevant repositories at [https://github.com/PhotosOfBlacklion](https://github.com/PhotosOfBlacklion).

Pull Requests and questions welcome!

<script async class="speakerdeck-embed" data-id="b632d0af38ac4fc6ac45832bf9b6971e" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

### Here's a long form version of the talk I gave too.

This project started out because my Dad likes to takes photos and wanted to share photographs of our local village in Cavan, including any activities that were happening around the place. So I set up a PHP based gallery called ZenPhoto. This was running on PHP4 on a Dreamhost box. I upgraded it a few times over the years, but each time something would change and there would be some weirdness about not being able to log in for a while. Or else my Dad would lose the password from the browser auto fill. Anything out of the ordinary would throw him off, so I gave up upgrading it and it's been running OK for a few years. It wasn't fast due to being hosted in the US, and most visitors being in Ireland. and it wasn't particularly pretty (extra clicks to see the full size photo, clunky paginated interface to view 700 photos in an album), but he kept putting photos up and people kept looking at them. Then as more people emigrated, there were more international hits, Australia, Canada, the UK.

He started asking was there anything better available and of course there was. I got thinking about it and my criteria were:

- Cheap
- Fast
- Easy to change the layout
- As simple as possible to upload photos

After lots of messing around in the name of research, and some failed experiments, I decided on:

- AWS S3 to hold the photos (should be pretty cheap, can make use of a CDN easily)
- GitHub Pages to host the HTML (free, I know it pretty well)
- Dropbox to upload photos so they could be processed (don't have to write a multi file resumable file upload app)
- DigitalOcean to host the Sinatra server and process images

So that's the list of things. How do we go from that to an online gallery that is available for anyone to look at with a minimum of visible fuss.

First, a little diversion. Webhooks. I see that there three ways to know if something has changed somewhere:

1. Stand looking at it until it changes.
    This doesn't work all that well, think of watching a kettle boil but you're also waiting for it to be switched on. You'll either need a lot of patience or some way of seeing into the future.

1. Check periodically to see if anything has changed.
    This is the equivalent of someone coming up behind you every five minutes, tapping you on the shoulder and asking, "Are you finished yet?". It might be tolerable if one person does it, but it gets annoying quickly if multiple people do it even if it's a different times. This is called polling and is the simplest way to set up most CI systems. Use a cron job, or schedule it in the CI system itself.

1. Get the application to tell you.
    Like Archimedes jumping up and shouting Eureka when he stepped into the bath, webhooks notify any subscribers when something has happened. The subscriber can be as simple as an HTTP server waiting to be be hit or a full blown CI system.

To get started, I used a Sinatra app on a DigitalOcean Droplet.This listens for a POST request with the correct parameters, does some parsing to check that the request comes from Dropbox, and stores any new photo paths into a MySQL database.

Just like it's important to respond to a regular webpage request as quick as possible, you have to respond to the fired webhook in as short space of time to acknowledge it. For Dropbox, this is 10 seconds. You can do a lot in ten seconds but it's recommended that any heavy lifting be done in an asynchronous process.

My first thought to get past this was a cron job to poll the database...but there's polling again, which I want to avoid.

Secondly, I could have used a job queue instead of the database and a worker like resque to process the queue. But this is essentially polling again, just at a much faster rate.

I decided to go with forking out to another script, which first checks if there's another instance running and if so, exits.

Because this webhook is also fired when files are removed, it checks if there are any new photos to process before looping over each one to do the work.

Then it runs through these steps:

- download the file from dropbox
- delete it from dropbox
- create a thumbnail
- copy the photo and thumbnail to S3
- delete the local files
- add the S3 paths to an array
- and repeat for each photo

At the end of the process, it creates a markdown file in a predefined repository directory. The photograph information is stored in the YAML front matter of a GitHub Pages post file. This is parsed by Jekyll and ends up with a gallery page showing all of the photos.

To get the site to build, the new file has to be committed and pushed to GitHub. These steps are done using the `libgit2/rugged` gem, before the script exits. And that's it.

This code is messy, has minimal error checking and to be honest a bit of a hack job, but it works and that's the important bit at the end of the day. There is logging in place to trace back anything that happened and at worst, it's a Git repository which can be rolled back to a known good state.

Other things that can be added to it are a webhook on the GitHub side that fires on a page build success to send an email or other notification saying that the new gallery is available.

There was also a large data migration project involved to move over 8 years of photographs, 2129 directories and 125702 files to give 63GB of photos. This involved bash scripting, some ruby, some judicious MySQL and a lot of late nights.

To compare the costs, Zenphoto on Dreamhost was costing me $120 a year in hosting with free storage.
The new system is costing:

- $5 a month for a digitalocean droplet (that I use for my own website anyway)
- $0 for GitHub Pages
- $0 for Dropbox because the files get removed after they are copied down
- $1.48 + tax for S3, so round it up to $2
- for a grand total of $7 a month, or $84 dollars a year, a saving of $36!

