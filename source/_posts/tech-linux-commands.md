---
title: Linux 常用命令
comments: true
mathjax: false
abbrlink: 817c7d82
categories:
  - [Techniques, Software]
tags:
  - Linux
hide: true
date: 2019-05-14 09:44:28
updated: 2019-05-14 09:44:42
---



df -hl 查看磁盘剩余空间 
df -h 查看每个根路径的分区大小 
du -sh [目录名] 返回该目录的大小 
du -sm [文件夹] 返回该文件夹总M数


# nginx

`sudo nginx -s reload`

# SS

From: https://github.com/shadowsocks/shadowsocks/blob/master/README.md

`ss`配置文件地址：`/etc/shadowsocks.json`

重启：\
```bash
sudo ssserver -c /etc/shadowsocks.json -d stop
sudo ssserver -c /etc/shadowsocks.json -d start
```
or
```bash
/etc/init.d/shadowsocks restart
```
