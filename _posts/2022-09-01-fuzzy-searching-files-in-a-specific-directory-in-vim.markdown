---
layout: post
title: "Fuzzy Searching Files in a Specific Directory in Vim"
date: 2022-09-01 14:34
categories: 
---
I've been using [vimwiki](http://vimwiki.github.io/) for a little while to take notes as I work through the day.
One issue that I had was that I had no easy way to search through older notes without dropping out of vim and manually searching.

I've also been using [FZF](https://github.com/junegunn/fzf) loads and really like how it works, so I wanted to make use of that too.

With the [fzf.vim](https://github.com/junegunn/fzf.vim) I was almost where I wanted to get to.
I could use `:Ag` to search through files in the current directory but this sometimes meant I was in the wrong place when I started the search.

A bit of searching led me to [this GitHub issue](https://github.com/junegunn/fzf.vim/issues/413) where someone asked how to scope a search to a specified directory.
I got pretty excited as this is exactly what I wanted to do!

After some playing around and trial and error, I eventually came up with this little snippet which I added to my `~/.vimrc`

```
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
noremap <leader>v :Rag '^(?=.)' ~/Dropbox/vimwiki/<return>
```

The first `command!` creates a command that can be called as `:Rag <search-term> <directory>` and I've used the second line to map that to `<leader>v`.
The strange looking `'^(?=.)'` was taken from the definition of `[fzf#vim#ag](https://github.com/junegunn/fzf.vim/blob/d3b9fed9c2415a2682cb1c8604e25a351325c22b/autoload/fzf/vim.vim#L594-L604)`.
I don't fully understand it, but it allows a blank search string so that I don't have to supply anything there and it brings up the full search that I can then type into.
Lastly, I've set the directory to search to the one where I store my vimwiki files.
