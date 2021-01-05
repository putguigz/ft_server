# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gpetit <gpetit@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/29 17:08:49 by gpetit            #+#    #+#              #
#    Updated: 2021/01/05 17:31:11 by gpetit           ###   ########.fr        #
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
RUN apt install -y php-fpm 
RUN apt install -y php-curl php-gd php-intl php-json php-mbstring php-xml php-zip php-mysql

# PHPMYADMIN
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz && mv phpMyAdmin-5.0.4-all-languages phpmyadmin 
RUN mv ./phpmyadmin ./var/www/html
##GERER FICHIERS A CHANGER CONFIG. && sitesAVAILABLE/default

# WORDPRESS
RUN wget https://fr.wordpress.org/wordpress-latest-fr_FR.zip && unzip wordpress-latest-fr_FR.zip -d /var/www && rm wordpress-latest-fr_FR.zip

# LAUNCH EVERYTHING
# RUN service nginx start && service mariadb start && service php7.3-fpm start

#RUN apt install -y php7.3
#RUN apt install -y php-mysql
#RUN apt install -y openssl

EXPOSE 80

