---
layout: post
title: "Rolling Back the Master Branch With Git"
date: 2018-02-13 14:35
comments: true
categories: 
---

Have you ever wanted to roll back your `master` branch in a Git repository so that there is nothing left of your commits?
I hadn't either, until someone asked me was it possible.

I set about trying to find out.

Rolling back the master branch is relatively easy, it's the same as for any branch really.
My method is only one of many ways to do this, I first check out the commit that I want to roll back to:

```
git checkout [SHA]
```

I then rename the `master` branch to something else (`master-old` seems appropriate):

```
git branch -m master master-old
```

Next, create a new branch called `master`, and delete `master-old`:

```
git checkout -b master
git branch -D master-old
```

This looks like it would do what you want, doesn't it?
But there is a catch (isn't there always?)

The commits are still in the repository, hidden away but accessible if you know the commit SHAs.
So, how do we remove them?

We can expire the [reference logs](https://git-scm.com/docs/git-reflog) and then do a garbage collection to prune out anything that isn't referenced:

```
git reflog expire --expire-unreachable=now --all
git gc --prune=now
```

This removes the commits and won't let us check them out any more.
Here is a full set of commands to demonstrate what is going on.
It includes setting up a repository with a few commits, moving the `master` branch and expiring the reflogs:

```
$ git init
Initialized empty Git repository in /Users/mike/tmp.git/
$ echo 1 > README
$ git add README
$ git commit -m "one"
[master (root-commit) e40921c] one
 1 file changed, 1 insertion(+)
 create mode 100644 README
$ echo 2 >> README
$ git add README
$ git commit -m "two"
[master f7dd565] two
 1 file changed, 1 insertion(+)
$ echo 3 >> README
$ git add README
$ git commit -m "three"
[master a489571] three
 1 file changed, 1 insertion(+)
$ git lg
* a489571 (HEAD -> master) three
* f7dd565 two
* e40921c one
$ git co e40921c
Note: checking out 'e40921c'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at e40921c... one
$ git branch -m master master-old
$ git co -b master
Switched to a new branch 'master'
$ git branch -D master-old
Deleted branch master-old (was a489571).
$ git reflog expire --expire-unreachable=now --all
$ git gc --prune=now
Counting objects: 3, done.
Writing objects: 100% (3/3), done.
Total 3 (delta 0), reused 3 (delta 0)
$ git co a489571
error: pathspec 'a489571' did not match any file(s) known to git.
```
