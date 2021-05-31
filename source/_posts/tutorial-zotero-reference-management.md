---
title: "[Tutorial] Zotero for PhD or general researchers"
comments: true
mathjax: true
abbrlink: 5e52f5db
date: 2020-02-14 15:22:42
updated:
categories:
  - Tutorials
tags:
  - Zotero
---

# My conclusions

> `Zotero` can do everything `Mendeley` could, even more elegantly. Simple DO NOT use `Mendeley`.

> Sadly the development of `Docear` stopped, so don't use it

> Use <mark>tags</mark> to organize papers, see below for reasons. Leave **collection** just literally a collection of something.

> Set up your own rules ahead and then follow them strictly. Keep polishing your rules as needed.


# Working flow

## Collecting efficiently

Add a new collection, search and add using the `Zotero connector` plugin for Chrome.

Download paper using `sci-hub-fy` plugin, if necessary.

Make sure meta-data are correct at the very beginning.

Files should be managed by `ZotFile`, saved in `Dropbox`.


## Reading on tablet 

`ZotFile` + `Dropbox` + `Boox Note+` or other tablets.
Helps to concentrate on papers.

<!-- more -->

## Writing efficiently 

Use $\LaTeX$ or MS Word. Either is good and easy, once you mastered it.


# Organize Papers using Tags

My tag system (as of 2020-10-22 05:05:32):

## Status tag system

Tag Name | Description and purpose | Rate
:---- |:-------- |:----
`ph:New_Unread` | Newly added. Every time, after adding new items, in the whole library, sorted by **date modified**, and tag all new items. | N/A
`ph:ToSkim` | Try to skim all `ph:New`. | N/A
`ph:ToStudy` | Worthy of further study, but not yet, maybe due to no time or not related to the current work at hand. | $\ge 2$
`ph:Skimmed` | Skim introduction, conclusion, figures, tables. Add a summary. | Rate it.
`ph:Read` | Read more details than `ph:Skimmed` but not studied as in `ph:Studied`. | $\ge 2$
`ph:Studied` | Studied in great details, making clear of every details. | $\ge 3$
`ph:Implemented` | Implemented. | $\ge 4$
`ph:Cited` | Cited in my papers, posts, reports, etc. | $\ge 3$
`ph:Printed` | Printed our for intensive studies. **Add comments back to PDF for electric records!!** | $\ge 3$

## Rating tag system

Tag Name | Description and purpose | Rate
:---- |:-------- |:----
`ph:Rate:0/5` | Not related. Keep for record. 
`ph:Rate:1/5` | Related. Will not cite.
`ph:Rate:2/5` | Worth reading. Not worth citing.
`ph:Rate:3/5` | **Good**. Related. **Cite if possible**.
`ph:Rate:4/5` | **Very Good**. Very related. **Should cite**. Should study in detail. 
`ph:Rate:5/5` | **Classical; highly cited; fundamental**. Very related. **Must cite**. Must study.

## Todo system

Tag Name | Description and purpose | Rate
:---- |:-------- |:----
`ph:Todo:Implement` | To implement the methods or simulations in the paper. | $\ge 4$
`ph:Todo:***` | Other things to do about the paper, other than `ToSkim` or `ToRead`. | Depends

## Content tags (TBD)

Tag Name | Description and purpose
:---- |:--------
`method:***` | Particular methods I want to highlight. Do NOT add this prefix to regular methods like `EKF`.
 | 
`mission:***` | Space missions.
`mission:CubeSat:***` |
 |
`book` & `book:Aerospace` |
`thesis` & `thesis:PhD` |
`patent` | 
 | 
`No prefix` | Regular tags.
`star_tracker_calibration` | Use underline `_` to connect phrases.


## Credits

My system is inspired by the following very insightful `Tag System`:
> 2020-02-14 15:24:10:\
> This is the best practice of using the tag system in Zotero that I ever heard of.
> 
> [2019, Damien Goutte-Gattat, "Managing academic literature with Zotero and Docear"](https://incenp.org/notes/2019/managing-academic-literature.html)
>
> <img src="Snipaste_2020-02-14_15-25-16.png" width="400px" title="Using tags to organize reading workflow.">
> 
> 1. Ideally this tag should not be used; it’s better to take the time to actually skim the paper rather than marking it as “to be skimmed”.
> 2. “Skimmed” references should be accompanied with a note summarizing them.
> 3. All references tagged with DGG:Status:ToRead or higher should have been imported into Docear.
> 4. Typically the case for papers I want to present in a journal club or a similar context.
> 5. More precise tags can be added “below”, similar to what is done for the Topics category.

Different from Damien who doesn't use `Collections` much, I use them to organize papers into specific disciplines.

## Why use tags?

Now I finally realize that using tag is a better way to organize paper.
Although I've heard of this conclusion long time ago, almost when I first started to use a reference management software, I didn't have any experience and thus didn't know how to use a tag system.
Maybe there are some good tutorials, but I just didn't bother to do more search, which I regret.

Here I will briefly explain why and what I've went through to get this conclusion, in my opinion:
- Tags are not a tree structure. 
  - What does this mean? Simple, supposing you want to organize hundreds of papers both by the specific machine learning (ML) methods it used and by the aerospace engineering (AE) problems they tackled, you'll need two trees to achieve the goal. Only then, you can search or locate a paper either the ML method or the AE problem. But with a tag system, you can select either or both tags at the same time.
  - But, nothing is perfect. The tag system also has its cons. The tags are scattered or displayed equally, there is no additional tree structure for tags in Zotero. Sometimes I feel this would be very useful, for example when I want to have a look at all by tags of ML methods.
- Tags can have a tree-ish structure.
  - But, everything has a workaround. This could be solved by maintaining your own prefix system to introduce kind of a tree structure relationship to tags, like what we did in the previous section for the `status tags`.
    - For example, I could do `ml:RNN:LSTM`, `ml:RNN:GRU`, `ml:GP`, `ml:GP:sparse`, `ml:GP:variational`, `ae:orbit_prediction`, `ae:UFO`, etc. Then I can search for GP to get all `*GP*`. Again, this is the tag system for my Zotero.
- Tags are displayed more dense than collections under the Zotero layout. This means you can look at more tags at one glance.
  - Collections are shown as a tree structure. It is a disaster if you have a lot of collections and sub-collections and you want to go through them. Assuming you are an organized people, you will know what I'm talking after you use a collection system for just one year...
- (Last but not least) Tags can be searched, but collections cannot!!! Again, you will know why I'm so excited about my this awakeness if you are a long-term user.

Drawbacks? Never mind. Nothing is perfect. Just seek a workaround. 

Some helpful rules:
- Avoid space in tags.
- Use a consist separator, like colon `:`.
- Update the naming rule frequently as needed.



# Organize Papers using Collections

TBD

Since a tag system seems satisfy all our organization purpose, why do we need a tag system on earth?
- One could do multiple works at the same time period. The papers can be completely unrelated, and there tags have no intersection at all. For example, I collect research papers for researching and may also collect some templates or examples to write a personal statement. In this circumstance, you use `collection` as a collection, literally, then use `tag` to organize the details.
- Collection can help organize tags as well. In Zotero, once you go into a specific collection, only the tags in ths collection will be shown. For example, when I go into a sub-collection named `PhD/Three-body`, I won't see a tag name `ae:UFO`.


## (Reflection) why I use collection system before?

Why I just realized how a tag system is more powerful and helpful than a tree structure collections?
- Well, that's because I gained the intuition from OS file system. Under Windows, if not using Zotero, you manage everything by sub-folders, a naturally tree structure. You have not choice. 
- Tag systems are different based on platforms. It doesn't exist in earlier Windows, and I still didn't master that in macOS. And, the tag system is not easy to migrate. I mean, once you lose or break the system, you loose all your accumulated knowledge, which is a disaster. *But this is based on the file systems intuition to organize papers in Zotero*.
- Once you realize and understand that Zotero doesn't organize papers using sub-folders, there comes changes. In other words, you loose the tree structure of the underlying PDFs in items, once you choose Zotero. The only thing you have is a hashed item in Zotero database and the PDF is only an attachment now. In other words, again, the PDF is not the core or center of the managing anymore. **It takes me so long to realize this and rebuild my mind !!!** Wish I could save you some time. The same even if you use `ZotFile`, which is another story.
- So, now, you can abandon the false sense of security by having the corresponding sub-folder structure shadowing of PDFs on your HDD. The new sense of security shall rely on regular backup (again, another story) and cloud storage (again after again, another story). Zotero can synchronize the database and files. If you use `ZotFile`, Zotero memorizes the links to PDFs as well. Based on my experience, it's very reliable. 
  - I've set up my Zotero from zero on at least four PCs, one Chromebook with a Linux hack, macOS various versions, and Ubuntu Linux, without any problem so far. Just install Zotero, then login, wait for syncing. Then install Dropbox, login, and syncs only the Zotero attachment. At last setup all plugins, `ZotFile` for attachements, `Zutilo` for shortcuts. Done! Simple and reliable.
- Finally, you will understand how silly to keep a tree structure collection system to organize items in Zotero. 
  - A question, if so, why we need the collection? Let's discuss in the next section.


## How to migrate to tag system

Well, set up new rules and be patient. 
Let time do it.



# Must-have plugins

A full list of Zotero plugins is [here](https://www.zotero.org/support/plugins).

My recommended must-haves are:
- Better BibTex for Zotero
- ZotFile
- Zutilo
- Zotero Quicklook



# Others 

## Why do NOT use Mendeley?

The problem of `Mendeley` is that it locks you in, in almost every aspect:
- the database is encrypted and you cannot port out your the data completely to another software.
- the annotation is not embedded in PDF files, meaning you have to rely on Mendeley to read, search, edit your annotations.
 - no batch operations to export annotations.
- see [here: all the hassles when getting rid of Mendeley](https://www.zotero.org/support/kb/mendeley_import)

## Problematic tags

The tag `ae:UFO` may not be a good classification, depending on whether UFO study is a serious AE problem...


## Zotero tricks

Use `Zutilo` to set a shortcut for `Tag selection: focus search box`, where I use `Ctrl + Shift + F`.


