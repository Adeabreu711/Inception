FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php php-mysqli wget

RUN mkdir -p /var/www/html
RUN wget -O /var/www/html/index.php https://www.adminer.org/latest.php

COPY tools/adminer_setup.sh /adminer_setup.sh
RUN chmod +x /adminer_setup.sh

EXPOSE 8081

CMD ["/adminer_setup.sh"]
