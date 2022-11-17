---
layout: post
title: "Moving From LastPass to 1Password"
date: 2015-10-19 21:23
tags: 
---

Last weekend I moved my passwords from LastPass to 1Password.
This was partly due to the notice that [LogMeIn bought LastPass](https://blog.lastpass.com/2015/10/lastpass-joins-logmein.html/) and partly to test out if it was possible.

There were some manual steps involved and some caveats, which I'll document here.

### Export your passwords
The first thing to do is to export everything from LastPass to a CSV file.
If you use the browser plugin, you can do this by going to:

```
Tools -> Advanced Tools -> Export To -> LastPass CSV File
```

You'll be prompted for your password and then a location to save the file.
I chose to save it to the Desktop.

### Modify the CSV file
I removed some old passwords that I don't need any more before fixing up and reordering the columns.
The original headers are:

```
url,username,password,extra,name,grouping,fav
```

but the 1Password headers are:

```
title,location,username,password,notes
```

I moved them around so that `url` became `location` and `name` became `title`.
I also deleted the `extra`, `grouping` and `fav` columns.

I removed any Secure Notes and saved them into another file for later.

### Import into 1Password
Importing was easy.
Open 1Password, got to `File -> Import`, select the file and hey presto, all done.
A quick check to make sure everything was there and I was done.

### Caveats
- Make sure to remove the header line from the CSV file before you import or else you will be left with a new entry with the headers in it.
- Don't try to import Secure Notes, it just made some more Logins for me.
