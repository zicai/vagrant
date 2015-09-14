#!/bin/bash
# 参考 https://github.com/AlexDisler/mysql-vagrant/blob/master/install.sh
echo 'execute bootstrap.sh'
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo cp /vagrant/sources.list /etc/apt/sources.list

sudo apt-get update

echo 'mysql 默认密码 root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo /etc/init.d/mysql restart


echo 'execute bootstrap.sh done'
