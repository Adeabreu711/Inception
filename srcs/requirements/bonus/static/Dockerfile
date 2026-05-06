FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y nginx

# Config Nginx + fichiers du site
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site/ /var/www/static/
RUN chown -R www-data:www-data /var/www/static

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
