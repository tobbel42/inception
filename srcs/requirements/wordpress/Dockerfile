FROM debian:buster

#installing php && wordpress-cli 
RUN apt-get update &&\
	apt-get install -y curl php php-mysql php-fpm mariadb-client&&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp-cli


#exposing Port 9000
EXPOSE 9000

#lets the php-fpm listen on port 9000
COPY ./www.conf /etc/php/7.3/fpm/pool.d

#import of startup-script
COPY ./startup.sh /var/www/wordpress/startup.sh

#we want to install wordpress into this path
WORKDIR /var/www/wordpress

#download of wp data, giving the startupscript exec rights 
RUN wp-cli core download --allow-root &&\
	chmod +x /var/www/wordpress/startup.sh &&\
	mkdir /run/php/ && touch /run/php/php7.3-fpm.pid

#run the startup script, neccesary because we need to connect to mariaDB to
#install wp, which is not possible at build time 
CMD [ "bash", "/var/www/wordpress/startup.sh"]

