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
  - zotero
---

# My conclusions

> Simple DO NOT use `Mendeley`.\
`Zotero` can do everything `Mendeley` could, even more elegantly.

> Sadly the development of `Docear` stopped, so don't use it



# Working flows

## Collecting efficiently

Add a new collection, search and add using the `Zotero connector` plugin for Chrome.

Download paper using `sci-hub-fy` plugin, if necessary.

Make sure meta-data are correct at the very beginning.

Files should be managed by `ZotFile`, saved in `Dropbox`.


## Reading on tablet 

`ZotFile` + `Dropbox` + `Book Note+` or other tablets.
Helps to concentrate on papers.

<!-- more -->

## Citing 

Use $\LaTeX$ or MS Word. Both are easy.


# Organize


## My tag system (as of 2020-10-10 03:54:24):

Tag Name | Description and purpose | Rate
:---- |:-------- |:----
**Status system** |
`ph:New_Unread` | Newly added. Every time, after adding new items, in the whole library, sorted by **date modified**, and tag all new items. | N/A
`ph:ToSkim` | Try to skim all `ph:New`. | N/A
`ph:ToStudy` | Worthy of further study, but not yet, maybe due to no time or not related to the current work at hand. | $\ge 2$
`ph:Skimmed` | Skim introduction, conclusion, figures, tables. Add a summary. | Rate it.
`ph:Read` | Read more details than `ph:Skimmed` but not studied as in `ph:Studied`. | $\ge 2$
`ph:Studied` | Studied in great details, making clear of every details. | $\ge 3$
`ph:Implemented` | Implemented. | $\ge 4$
`ph:Cited` | Cited in my papers, posts, reports, etc. | $\ge 3$
**Todo system** |
`ph:Todo:Implement` | To implement the methods or simulations in the paper. | $\ge 4$
`ph:Todo:***` | Other things to do about the paper, other than `ToSkim` or `ToRead`. | Depends
**Rating system** |
`ph:Rate:0/5` | Not related. Keep for record. 
`ph:Rate:1/5` | Related. Will not cite.
`ph:Rate:2/5` | Worth reading. Not worth citing.
`ph:Rate:3/5` | **Good**. Related. **Cite if possible**.
`ph:Rate:4/5` | **Very Good**. Very related. **Should cite**. Should study in detail. 
`ph:Rate:5/5` | **Classical; highly cited; fundamental**. Very related. **Must cite**. Must study.
**Other tags** |
`ph:Printed` | Printed our for intensive studies. **Add comments back to PDF for electric records!!** | $\ge 3$
`ph:Methods:***` | Particular methods I want to highlight. | N/A
`No prefix` | Regular tags. | N/A

My system is inspired by the following very insightful `Tag System`:
> 2020-02-14 15:24:10:\
> This is the best practice of using the tag system in Zotero that I ever heard of.
> 
> [2019, Damien Goutte-Gattat, "Managing academic literature with Zotero and Docear"](https://incenp.org/notes/2019/managing-academic-literature.html)
>
> <img src="tutorial-zotero-reference-management/Snipaste_2020-02-14_15-25-16.png" width="400px" title="Using tags to organize reading workflow.">
> 
> 1. Ideally this tag should not be used; it’s better to take the time to actually skim the paper rather than marking it as “to be skimmed”.
> 2. “Skimmed” references should be accompanied with a note summarizing them.
> 3. All references tagged with DGG:Status:ToRead or higher should have been imported into Docear.
> 4. Typically the case for papers I want to present in a journal club or a similar context.
> 5. More precise tags can be added “below”, similar to what is done for the Topics category.

Different from Damien who doesn't use `Collections` much, I use them to organize papers into specific disciplines.

## My collection system

TBD



# Others 

## Some reasons for my conclusions at the beginning

The problem of `Mendeley` is that it locks you in, in almost every aspect:
- the database is encrypted and you cannot port out your the data completely to another software.
- the annotation is not embedded in PDF files, meaning you have to rely on Mendeley to read, search, edit your annotations.
 - no batch operations to export annotations.
