#!/bin/bash 
# this is only for centos 6.x system
test -f /etc/yum.repos.d/epel.repo && mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

yum install -y  mysql.`uname -i` yum-plugin-replace
yum replace -y mysql --replace-with mysql55w
yum install -y mysql55w mysql55w-server
mkdir -p /data  

Git_URL=https://raw.githubusercontent.com/changelit/scripts/master/mysql/v5.5
wget $Git_URL/my.cnf -O /etc/my.cnf
chkconfig mysqld on 
service mysqld start
