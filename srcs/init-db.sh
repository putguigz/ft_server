#!/bin/bash

service mariadb start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mariadb -u root < /tmp/wordpress.sql

if [ "$(echo $AUTOINDEX)" = "OFF" ]
then 
	sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/default
fi
