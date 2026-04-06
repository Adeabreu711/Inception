# pull base image
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

#PHP-FPM INSTALL
RUN apt-get install -y \
	php7.4-fpm \
	php7.4-mysql \
	php7.4-curl \
	php7.4-gd \
	php7.4-mbstring \
	php7.4-xml \
	php7.4-zip

#WP-CLI INSTALL
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp


COPY ./tools/wp_setup.sh /wp_setup.sh

RUN chmod +x /wp_setup.sh

EXPOSE 9000

ENTRYPOINT ["/wp_setup.sh"]
