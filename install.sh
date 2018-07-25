#!/bin/sh -x

Install_packages()
{
   yum install httpd php* wget mariadb nfs* -y
   
 }
Aws_cli()
{
  curl -O https://bootstrap.pypa.io/get-pip.py
  python get-pip.py
  pip install awscli --upgrade --user
  export PATH=~/.local/bin:$PATH
  aws configure set default.region us-east-1
  aws efs describe-file-systems --region us-east-1
}
starting_service()
{
      systemctl start httpd
 }
nfs_conf()
{
     echo "172.31.18.45:/nfs_share /var/www/html     nfs     defaults     0     0     "| tee --append /etc/fstab
     mount -a
}
Drupal_deploy()
{
      wget https://ftp.drupal.org/files/projects/drupal-7.53.tar.gz
      tar -xvzf drupal-7.53.tar.gz
      cp -R drupal-7.53/* /var/www/html
      mkdir /var/www/html/sites/default/files
      cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php
      chown -R apache:apache /var/www/
}
restart_service()
{
      systemctl reload httpd
      systemctl enable httpd
}
Install_packages
starting_service
#nfs_conf
Drupal_deploy
restart_service   
echo " successful installation!"
