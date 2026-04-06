#!/bin/bash

#--------------secrets read--------------#
MYSQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_P=$(cat /run/secrets/wp_password)
WP_U_PASS=$(cat /run/secrets/wp_admin_password)

wp core download --path=/var/www/wordpress --locale=fr_FR

wp config create \
	--dbname=$MYSQL_DB \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=mariadb

wp core install \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_N \
	--admin_password=$WP_ADMIN_P \
	--admin_email=$WP_ADMIN_E

wp user create \
	--role=author \
	$WP_USER_N \
	$WP_USER_E \
	--user_pass=$WP_U_PASS

exec php-fpm7.4
