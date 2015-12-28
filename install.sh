#!/bin/bash

yum -y install gcc gcc-c++
yum -y install openssl
yum -y install zlib-devel
yum -y install python
yum -y install git
git clone https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install 0.6.21 --without-ssl
yum -y install epel-release
yum -y install nodejs npm --enablerepo=epel

echo "[mongodb]" >> /etc/yum.repos.d/mongodb.repo
echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb.repo
echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/" >> /etc/yum.repos.d/mongodb.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/mongodb.repo
echo "enabled=1" >> /etc/yum.repos.d/mongodb.repo
yum install -y mongodb-org
service mongod start
chkconfig mongod on

git clone git://github.com/opinsys/walma.git
cd walma
npm install
bin/setupdb
npm start

echo "cd /root/walma" >> /etc/rc.local
echo "npm start" >> /etc/rc.local

