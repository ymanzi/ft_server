#get Debian Buster
FROM debian:10

#init
RUN apt-get clean && apt-get update
RUN apt-get upgrade

#install nginx/ mariadb(mysql) / php
RUN apt-get install apt-utils vim nginx mariadb-server mariadb-client php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget git -y

#install wordpress
#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar -xvzf latest.tar.gz
#RUN mv wordpress /var/www/html/


#copy files
#COPY srcs/php.ini /etc/php/7.3/fpm/
RUN rm -rf /var/www/html
COPY srcs/html /var/www/html
#COPY srcs/phpmyadmin /var/www/html/phpmyadmin
COPY /srcs/default /etc/nginx/sites-available/
COPY /srcs/default.conf /etc/nginx/conf.d/
RUN rm /etc/nginx/sites-enabled/default
#RUN mkdir /var/www/html/nginx
#RUN mv /var/www/html/index.nginx-debian.html nginx
#COPY srcs/wordpress.conf /etc/nginx/sites-available/

#copy init files
COPY /srcs/start.sh .
COPY /srcs/wordpress.sql .

EXPOSE 80
EXPOSE 443

#run init

CMD bash start.sh && tail -f /dev/null
