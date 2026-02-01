---
layout: post
title: "All the Parkruns in Mayo in one day"
date: 2026-01-31
tags: 
---
Last Sunday, during our weekly long club run we got to talking about silly challenges.
Someone mentioned they had heard of a "24 park runs in 24 hours" challenge and we chatted about whether or not that'd even be possible.
Whatever about running 24 park runs in 24 hours, for a total of 120km.
That's hard enough.

But then do you do the same Parkrun 24 times?
Or 24 different Parkruns?

And how would that work out logistically?
Is it even possible to drive between 24 different Parkruns in 24 hours?

As the conversation wound along, we started to wonder what was a realistic challenge.
How about all the Parkruns in Mayo?

### How many are there?

There's seven that we were able to come up with:

- Achill
- Ballina
- Bangor
- Castlebar
- Claremorris
- Tourmakeady
- Westport

What's the best order to do them in so that you have to travel the least amount to get around them all?

### How do you even go about finding this out?

I suppose you could go and work out the distances between each one and use a pen and pencil to find it out.
But where's the fun in that!

Instead, I went looking for all the Parkruns from the Parkrun website.
I was able to get the global list in JSON format, and then the fun began!

I wanted to bucket the Irish Parkruns into their respective county.
The JSON file already broke down each Parkrun into their respective countries, and Ireland had a country code of `42`.
I used the reverse lookup API at [https://nominatim.openstreetmap.org/ui/reverse.html](https://nominatim.openstreetmap.org/ui/reverse.html) to get the county information for each of the Irish Parkruns and stored them in a SQLite database.

Next I needed to work out the distance between each one.
I got to use a nice Ruby function called [`Array.combination`](https://ruby-doc.org/3.4.1/Array.html#method-i-combination) to work through each one.
The Open Source Routing Machine (OSRM) API has [a Route service endpoint](https://project-osrm.org/docs/v5.24.0/api/#route-service) which finds the fastest route between coordinates.
Using each of the combinations, I again stored the API results in SQLite along with the duration of the journey.

Then it was down to the simple (ha ha!) way of working through each possible route between all seven Parkruns.
In all there are 5040 permutations!

Once again Ruby comes to the rescue with its [`Array.permutation`](https://ruby-doc.org/3.4.1/Array.html#method-i-permutation) method.
Using this I iterated over _every_ permutation and stored the stops, the duration and the distance.
I was then able to sort this information by the distance and get the longest and shortest journies between all the stops.

So after all this, how long would it take to get between every Parkrun in Mayo, I hear you ask?

### Well, here's what I found out...

The shortest driving distance is `250km` for `Ballina`, `Castlebar`, `Claremorris`, `Tourmakeady Wood`, `Westport`, `Achill Greenway`, `Erris`, which would take `4 hours, 16 minutes`.

The longest driving distance is `490km` for `Castlebar`, `Achill Greenway`, `Claremorris`, `Erris`, `Tourmakeady Wood`, `Ballina`, `Westport`, which would take `7 hours, 50 minutes, 17 seconds`.

There's over three and a half hours difference between the shortest route and the longest one, and almost twice as much driving!

### Look at the code

Find all the code at [https://github.com/mgriffin/parkrun](https://github.com/mgriffin/parkrun)
