FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site/ /var/www/static/

RUN chown -R www-data:www-data /var/www/static

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
