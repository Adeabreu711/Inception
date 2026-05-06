FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y nginx openssl

# Generation du certficifat SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
	/etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=alde-abr.42.fr/UID=alde-abr"

# Config NGINX
COPY ./config/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
