# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gpetit <gpetit@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/29 17:08:49 by gpetit            #+#    #+#              #
#    Updated: 2021/01/08 10:39:48 by gpetit           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER gpetit <gpetit@student.42.fr>

# OVERALL MAJ
RUN apt update && apt -y upgrade

# TOOLS
RUN	apt install -y vim && apt install -y wget && apt install -y curl && apt install -y unzip 

# NGINX
RUN	apt install -y nginx && service nginx start

# MARIADB
RUN apt-get install -y software-properties-common dirmngr apt-transport-https && apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' && add-apt-repository 'deb [arch=amd64] https://ftp.igh.cnrs.fr/pub/mariadb/repo/10.5/debian buster main' && apt update && apt install -y mariadb-server

# PHP
RUN apt install -y php-fpm php-curl php-gd php-intl php-json php-mbstring php-xml php-zip php-mysql

# PHPMYADMIN
WORKDIR /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz && mv phpMyAdmin-5.0.4-all-languages phpmyadmin 
WORKDIR /var/www/html/phpmyadmin/tmp
RUN chmod 777 /var/www/html/phpmyadmin/tmp

# WORDPRESS
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz

#IMPORTATION DES FICHIERS DE CONFIG
COPY ./srcs/default /etc/nginx/sites-available/default
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./srcs/wordpress-db-init.sql /tmp/wordpress-db-init.sql

# COMMANDES AU DEMARRAGE 
CMD service mariadb start && echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root \
	&& echo "GRANT ALL ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root \
	&& echo "FLUSH PRIVILEGES;" | mysql -u root \
	&& service nginx start && service php7.3-fpm start && bash

EXPOSE 80

