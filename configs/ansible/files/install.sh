#!/bin/bash

# create swap
# Source: https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-18-04
echo 'Creating swap file'
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sysctl vm.swappiness=10
cd /etc/sysctl.conf /etc/sysctl.conf.bckp
echo 'vm.swappiness=10' >> /etc/sysctl.conf

echo 'Configure LEMP to restart is machine does'
systemctl restart php7.2-fpm
systemctl reload nginx
systemctl reload mysql

# install wordpress files
echo 'Install Wordpress files'
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php
mv /var/www/html /var/www/html_bckp
cp -a ./wordpress/ /var/www/html
chown -R www-data:www-data /var/www/html
