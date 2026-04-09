#!/bin/bash

#--------------secrets read--------------#
MYSQL_PASS=$(cat /run/secrets/db_password)
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_password)
WP_USER_PASS=$(cat /run/secrets/wp_password)

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	wp core download --path=/var/www/wordpress --locale=fr_FR --allow-root

	wp config create \
		--dbname=$MYSQL_DB \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASS \
		--dbhost=mariadb \
		--path=/var/www/wordpress \
		--allow-root

	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--path=/var/www/wordpress \
		--allow-root

	wp user create \
		$WP_USER_NAME \
		$WP_USER_EMAIL \
		--role=$WP_USER_ROLE \
		--user_pass=$WP_USER_PASS \
		--path=/var/www/wordpress \
		--allow-root
fi

mkdir -p /run/php
chown -R www-data:www-data /run/php
chown -R www-data:www-data /var/www/wordpress

exec php-fpm7.4 -F
