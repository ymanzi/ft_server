#!/bin/bash

service nginx start
service php7.3-fpm start
service mysql start
mariadb < wordpress.sql
#ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

service nginx restart
service php7.3-fpm restart
