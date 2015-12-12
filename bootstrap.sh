sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password_again password root'

echo 'Adding ppa:ondrej/php-7.0 to repositories'
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:ondrej/php-7.0

echo 'Updating repositories'
sudo apt-get update
sudo apt-get install -y git vim
sudo apt-get install -y mariadb-server apache2 apache2-mpm-worker libapache2-mod-fastcgi php7.0 php7.0-common php7.0-fpm php7.0-mysql

echo 'Configuring apache2 and php7'
sudo cp provision/php7-fpm.conf /etc/apache2/conf-available/php7-fpm.conf

sudo a2dismod mpm_prefork
sudo a2enmod actions fastcgi alias mpm_worker
sudo a2enconf php7-fpm

sudo service apache2 restart
sudo service php7.0-fpm restart

sudo chown -R vagrant:www-data /var/www/
echo '<?php phpinfo();' > /var/www/html/info.php

echo 'If you dont see a sea of red above, you are probably good to go.'