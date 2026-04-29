FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp_setup.sh /ftp_setup.sh

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod +x /ftp_setup.sh

EXPOSE 21

ENTRYPOINT ["/ftp_setup.sh"]
