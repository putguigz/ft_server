# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gpetit <gpetit@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/29 17:08:49 by gpetit            #+#    #+#              #
<<<<<<< Updated upstream
#    Updated: 2021/01/07 18:52:02 by gpetit           ###   ########.fr        #
=======
#    Updated: 2021/01/08 10:07:37 by gpetit           ###   ########.fr        #
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz && mv phpMyAdmin-5.0.4-all-languages phpmyadmin && mv ./phpmyadmin ./var/www/html
=======
WORKDIR /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz && mv phpMyAdmin-5.0.4-all-languages phpmyadmin 
RUN mkdir /var/www/html/phpmyadmin/tmp && chmod 755 /var/www/html/phpmyadmin/tmp
>>>>>>> Stashed changes
##GERER FICHIERS A CHANGER CONFIG. && sitesAVAILABLE/default

# WORDPRESS
RUN cd /var/www/html && wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz

COPY ./srcs/default /etc/nginx/sites-available/default
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
<<<<<<< Updated upstream
COPY ./srcs/wordpress-db-init.sql /tmp/wordpress-db-init.sql

#CMD service mariadb start && mariadb -u root --skip-password < /tmp/wordpress-db-init.sql
CMD service nginx start && service mariadb restart && service php7.3-fpm start && bash && mariadb -u root < /tmp/wordpress-db-init.sql && bash

=======

CMD service mariadb start && echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root \
	&& echo "GRANT ALL ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root \
	&& echo "FLUSH PRIVILEGES;" | mysql -u root \
	&& service nginx start && service mariadb restart && service php7.3-fpm start && bash
>>>>>>> Stashed changes

EXPOSE 80

