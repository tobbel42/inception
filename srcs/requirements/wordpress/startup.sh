#!/bin/bash


#creating a config file for wp (location && credentials of DB)
#creating root user with credentials
#creating normal user with credentials
wp-cli core config\
	--dbhost=$DB_HOST\
	--dbname=$DB_NAME\
	--dbuser=$DB_USER\
	--dbpass=$DB_USERPASS\
	--allow-root &&\
wp-cli core install\
	--allow-root\
	--url="$WP_URL"\
	--title="$WP_TITLE"\
	--admin_user="$WP_ADMIN"\
	--admin_password="$WP_ADMIN_PASS"\
	--admin_email="$WP_ADMIN_MAIL" &&\
wp-cli user create $WP_USER "$WP_USER_MAIL"\
	--role=author\
	--user_pass="$WP_USER_PASS"\
	--allow-root\

#run the fpm ("wp-server")
php-fpm7.3 -F