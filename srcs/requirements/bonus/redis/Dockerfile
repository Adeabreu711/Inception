FROM debian:bullseye
RUN apt-get update \
	&& apt-get install -y redis-server

# Config Redis
COPY tools/redis_setup.sh /redis_setup.sh
RUN chmod +x /redis_setup.sh

EXPOSE 6379
ENTRYPOINT [ "/redis_setup.sh" ]
