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

# Files
df -hl 查看磁盘剩余空间 
df -h 查看每个根路径的分区大小 
du -sh [目录名] 返回该目录的大小 
du -sm [文件夹] 返回该文件夹总M数

# Users and Groups
```
id # 查看当前用户的信息
```

```
/etc/passwd # 每一行都表示的是一个用户的信息
```

```
/etc/group # 用户组的配置文件
```

```
/etc/sudoers # 配置root用户权限
```

```
chown # 改变所有者
```

```
chgrp # 改变所属用户组
```

参考资料：https://blog.csdn.net/yuexiaxiaoxi27172319/article/details/45390501

# Firewall
see: https://www.centos.bz/2017/12/%E5%BC%80%E5%90%AFufw%E9%98%B2%E7%81%AB%E5%A2%99%E7%9A%84%E4%B8%80%E4%BA%9B%E5%91%BD%E4%BB%A4/

```
sudo ufw status verbose
```
```
sudo ufw enable
```
```
sudo ufw disable
```


# nginx

```
sudo nginx -s reload
```

# V2ray

```
/usr/bin/v2ray/v2ray # V2Ray 程序；
/usr/bin/v2ray/v2ctl # V2Ray 工具；
/etc/v2ray/config.json #配置文件；
```

```
service v2ray start
```
```
service v2ray reload
```
```
service v2ray force-reload
```
```
service v2ray start|stop|status|reload|restart|force-reload # all commends
```

`v2rayN`教程：https://github.com/233boy/v2ray/wiki/V2RayN%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B


# SS

```
/etc/shadowsocks.json # 配置文件地址
```

```
/etc/init.d/shadowsocks restart # 重启
```

```
sudo ssserver -c /etc/shadowsocks.json -d stop  # 别一种重启方法
sudo ssserver -c /etc/shadowsocks.json -d start
```

From: https://github.com/shadowsocks/shadowsocks/blob/master/README.md

