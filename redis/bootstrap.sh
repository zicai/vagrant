#!/bin/bash
# 参考 https://github.com/mdevilliers/vagrant-redis/blob/master/init.sh
echo 'execute bootstrap.sh'
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo cp /vagrant/sources.list /etc/apt/sources.list

sudo apt-get update

sudo apt-get -y install redis-server
/etc/init.d/redis-server stop
echo 'redis 安装完成'

cp -u /vagrant/redis.conf /etc/redis/6379.conf
cp -u /vagrant/redis-server /etc/init.d/redis_6379

update-rc.d redis_6379 defaults

chmod a+x /etc/init.d/redis_6379
sudo /etc/init.d/redis_6379 start
echo 'execute bootstrap.sh done'