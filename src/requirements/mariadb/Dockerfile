# pull base image
FROM debian:bullseye

RUN apt-get update && apt-get install mariadb-server -y

COPY ./tools/mdb_setup.sh mdb_setup.sh
RUN chmod +x mdb_setup.sh

EXPOSE 3306

ENTRYPOINT ["/mdb_setup.sh"]
