---
layout: post
title: "Recovering From a File That Should Have Pointers in Git"
date: 2019-10-17 22:40
tags: git
---
I was working away on a project that a few other people have been working on and I ran into a problem trying to update the branch I was working on.
It turns out that at some stage in the past, someone tried badly to add a file to the repository using `git lfs`.
It left it in this weird zombie state where I wasn't able to checkout the original copy to remove the changes, or stash it, or anything.

I kept getting this error message:

```bash
$ git co [filename]
Updated 1 path from the index
Encountered 1 file(s) that should have been pointers, but weren't:
        [filename]
```

After much searching, I found [an old GitHub issue](https://github.com/git-lfs/git-lfs/issues/1939) which described my problem, but none of the solutions worked, or seemed feasible.

I have no idea how I stumbled across the thing that did fix it, but I'm recording it here for the next time I run into it:

```
$ git lfs migrate import --no-rewrite [filename]
```

So there we go, it's no longer part of the `git status` output.

There was one other little step that was needed during the merge:

```
$ git merge origin/master
warning: Cannot merge binary files: [filename] (HEAD vs. origin/master)
Auto-merging [filename]
CONFLICT (content): Merge conflict in [filename]
Automatic merge failed; fix conflicts and then commit the result.
```

A quick `git reset HEAD [filename]` later, and I was able to complete the merge.
