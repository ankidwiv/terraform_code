#!/bin/sh -x

Install_packages()
{
    sudo yum install httpd php* wget mariadb -y
 }
starting_service()
{
     sudo systemctl start httpd
 }
nfs_conf()
{
     echo "172.31.18.45:/nfs_share /var/www/html     nfs     defaults     0     0     "| tee --append /etc/fstab
     mount -a
}
Drupal_deploy()
{
     sudo wget https://ftp.drupal.org/files/projects/drupal-7.53.tar.gz
     sudo tar -xvzf drupal-7.53.tar.gz
     sudo cp -R drupal-7.53/* /var/www/html
     sudo mkdir /var/www/html/sites/default/files
     sudo cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
     sudo chown -R apache:apache /var/www/
}
restart_service()
{
     sudo systemctl reload httpd
     sudo systemctl enable httpd
}
Install_packages
starting_service
#nfs_conf
Drupal_deploy
restart_service   
echo " successful installation!"
