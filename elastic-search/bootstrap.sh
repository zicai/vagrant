#!/bin/bash
echo 'execute bootstrap.sh'
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo cp /vagrant/sources.list /etc/apt/sources.list

sudo apt-get update

chmod a+x /vagrant/elastic-search.sh
/vagrant/elastic-search.sh 1.7

echo 'execute bootstrap.sh done'