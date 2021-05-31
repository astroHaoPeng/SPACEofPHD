---
title: (2019 version) Excluding self-citation in Google Scholar
comments: true
mathjax: false
abbrlink: efaf52e4
categories:
  - - Techniques
    - Software
tags:
  - LaTeX
  - tricks
date: 2019-06-29 17:32:53
updated: 2019-06-29 17:32:57
---

When you search "Excluding self-citation in Google Scholar" on Google, the first item is [[By Brinxmat]](https://infonatives.wordpress.com/2009/12/05/excluding-self-citation-in-google-scholar/).
But unfortunately it does not work anymore, at least for me.

However, it gives me some insights and then I fiddling with Google Scholar a little bit.
Now we have an easy solution.

This is the original citation link of one of my paper:\
https://scholar.google.com/scholar?oi=bibs&hl=en&cites=17562392294963478550 \
This link actually works:\
https://scholar.google.com/scholar?hl=en&as_sdt=0%2C31&sciodt=0%2C31&cites=8618462917299343813&scipsc=1&q=-author%3A%22H+Peng%22&btnG=

As you see, the trick is still on the query except that it has been much more complicated than what Brinxmat found in 2010.

So, the manual solution is to:
{% note success %}
1. Open your google scholar profile.
2. Click the **cited by link** for one paper, and figure out the `cites ID` in the address bar. Like the number string `17562392294963478550` in https://scholar.google.com/scholar?oi=bibs&hl=en&cites=17562392294963478550.
3. Paste the ID in the following link
   > https://scholar.google.com/scholar?hl=en&as_sdt=0%2C31&sciodt=0%2C31&cites=`17562392294963478550`&scipsc=1&q=-author%3A%22`H`+`Peng`%22&btnG=
   
   and replace the author name `H`+`Peng` by your name, keep the plus sign.
4. Done!
{% endnote %}

A little explanation:
- After opening a **cited by link**, you will see a checkbox saying "Search within citing articles", then **check the box**.
- Then put `-author:"H Peng"` in the search box, then press Enter.\
  (It is a short hyphen there, not dash. Pay attention to your input method.)
- Then the above link address shows up.
