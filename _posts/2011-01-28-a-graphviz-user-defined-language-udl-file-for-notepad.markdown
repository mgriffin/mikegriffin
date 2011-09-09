---
layout: post
title: "A graphviz User Defined Language (UDL) file for notepad++"
date: 2011-01-28 07:58
comments: true
categories: 
---

I started looking into [graphviz](http://www.graphviz.org) for creating network
diagrams yesterday and got on quite well with it. It's very straightforward and
the ability to stick in icons where they might be needed is a nice bonus. I did
however find it hard to look at a bunch of text that wasn't highlighted in any
way.

<!--more-->

To fix this, I made a very simple user-defined language for
[notepad++](http://notepad-plus-plus.org/). I use the Monokai theme so it really
only fits that. It supports comments and all the keywords that I used over the
last few days. So without further ado, here is what I came up with.

{% highlight ruby %}
<NotepadPlus>
    <UserLang name="graphviz" ext="">
        <Settings>
            <Global caseIgnored="no" />
            <TreatAsSymbol comment="no" commentLine="no" />
            <Prefix words1="no" words2="no" words3="no" words4="no" />
        </Settings>
        <KeywordLists>
            <Keywords name="Delimiters">000000</Keywords>
            <Keywords name="Folder+"></Keywords>
            <Keywords name="Folder-"></Keywords>
            <Keywords name="Operators">; [ ] { } =</Keywords>
            <Keywords name="Comment">1/* 2*/ 0//</Keywords>
            <Keywords name="Words1">label fontname shape fontsize style color splines image labelloc rank</Keywords>
            <Keywords name="Words2">-- -></Keywords>
            <Keywords name="Words3"></Keywords>
            <Keywords name="Words4"></Keywords>
        </KeywordLists>
        <Styles>
            <WordsStyle name="DEFAULT" styleID="11" fgColor="F3C989" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="FOLDEROPEN" styleID="12" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="FOLDERCLOSE" styleID="13" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="KEYWORD1" styleID="5" fgColor="FFFF80" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="KEYWORD2" styleID="6" fgColor="00FFFF" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="KEYWORD3" styleID="7" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="KEYWORD4" styleID="8" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="COMMENT" styleID="1" fgColor="75715E" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="COMMENT LINE" styleID="2" fgColor="75715E" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="NUMBER" styleID="4" fgColor="0080FF" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="OPERATOR" styleID="10" fgColor="00FF40" bgColor="272822" fontName="" fontStyle="0" />
            <WordsStyle name="DELIMINER1" styleID="14" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="DELIMINER2" styleID="15" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
            <WordsStyle name="DELIMINER3" styleID="16" fgColor="000000" bgColor="FFFFFF" fontName="" fontStyle="0" />
        </Styles>
    </UserLang>
</NotepadPlus>
{% endhighlight %}
