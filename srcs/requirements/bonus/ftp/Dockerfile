FROM debian:bullseye
RUN apt-get update && apt-get install -y vsftpd

# Configuration FTP
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp_setup.sh /ftp_setup.sh
RUN mkdir -p /var/run/vsftpd/empty \
	&& chmod +x /ftp_setup.sh

EXPOSE 21 21100-21110
ENTRYPOINT ["/ftp_setup.sh"]
