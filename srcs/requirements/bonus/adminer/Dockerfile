FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y php php-mysqli wget

# Setup Adminer
RUN mkdir -p /var/www/html \
	&& wget -O /var/www/html/index.php https://www.adminer.org/latest.php

# Config fichier
COPY tools/adminer_setup.sh /adminer_setup.sh
RUN chmod +x /adminer_setup.sh

EXPOSE 8081
CMD ["/adminer_setup.sh"]
