!/bin/bash

sudo apt install unzip sqlite3 apache2 php php-zip php-dom php-curl php-gd php-mbstring php-sqlite3 php-ldap
phpenmod zip dom curl gd mbstring sqlite3 phpldap
wget https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip
unzip nextcloud-17.0.2.zip -d /var/www/html
chown -R www-data:www-data /var/www/html/nextcloud
service apache2 restart
