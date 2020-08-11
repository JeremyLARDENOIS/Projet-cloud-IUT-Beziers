#!/bin/bash

###############################CHANGE OPTION HERE
dir=/var/www/html
version=17.0.2
#version=19.0.1
#################################################


#NOT YET IMPLEMENTED
if false
then
#help

help()
{
	echo -e "Usage : ./installnextcloud.sh (ARGS) <repertory_to_install>\n"
	echo "By default, this install nextcloud in /var/www/html/nextcloud with a apache server with sqlite in database"
	echo "-h : Print this message "
	echo "-c : Change parameters by default"
	exit 0
}	
fi

script()
{
sudo apt install unzip sqlite3 apache2 php php-zip php-xml php-curl php-gd php-mbstring php-sqlite3 php-ldap
sudo phpenmod zip dom curl gd mbstring sqlite3 ldap
sudo rm -rf nextcloud-$version.zip 
sudo wget https://download.nextcloud.com/server/releases/nextcloud-$version.zip
sudo unzip nextcloud-$version.zip -d $dir
sudo chown -R www-data:www-data $dir/nextcloud
sudo service apache2 restart
}

hello(){
	echo hello world $dir $version $nb_args
}


script
