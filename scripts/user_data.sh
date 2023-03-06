#!/bin/bash
wget http://mirrors.myhuaweicloud.com/repo/mirrors_source.sh && sh mirrors_source.sh
yum install -y java
yum install -y tomcat
yum install -y tomcat-webapps
rm -rf /usr/share/tomcat/webapps/ROOT/*

echo "hello, this is "`hostname` >> /usr/share/tomcat/webapps/ROOT/index.html
systemctl start tomcat
