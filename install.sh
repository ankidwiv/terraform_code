#!/bin/sh -x

Install_packages()
{
   yum install httpd php* wget mariadb nfs* -y
   
 }
Aws_cli()
{
 my_region=`curl -s 169.254.169.254/latest/meta-data/placement/availability-zone| sed 's/[a-z]$//'`
 my_domain=`curl -s 169.254.169.254/latest/meta-data/services/domain`
 mkdir /mnt/efs
 curl -O https://bootstrap.pypa.io/get-pip.py
 python get-pip.py
 pip install awscli --upgrade --user
 export PATH=~/.local/bin:$PATH
 aws configure set default.region $my_region
 aws efs describe-file-systems --region $my_region
 fs_id=`aws efs describe-file-systems --region us-east-1| grep fs- |awk '{print $2}'|tr -d \'\"\,`
 fs_name="$fs_id.nfs.$my_region.$my_domain"
 Mount_target="$fs_id.$my_region.$my_domain"
 mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $Mount_target:/ /mnt/efs
 mount -a
}
starting_service()
{
      systemctl start httpd
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
Drupal_deploy
restart_service
Aws_cli   
echo " successful installation!"
