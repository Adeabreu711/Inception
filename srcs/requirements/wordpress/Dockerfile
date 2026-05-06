FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y

# Installation de PHP-FPM
RUN apt-get install -y \
	php7.4-fpm \
	php7.4-mysql \
	php7.4-curl \
	php7.4-gd \
	php7.4-mbstring \
	php7.4-xml \
	php7.4-zip \
	curl

# Installation de WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Config PHP-FPM (écoute sur port 9000)
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' \
	/etc/php/7.4/fpm/pool.d/www.conf

# Initialisation Wordpress	
COPY ./tools/wp_setup.sh /wp_setup.sh
RUN chmod +x /wp_setup.sh

EXPOSE 9000
ENTRYPOINT ["/wp_setup.sh"]
