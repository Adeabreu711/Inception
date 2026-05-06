#!/bin/bash

#secret
FTP_PASS=$(cat /run/secrets/ftp_password)

if [! id "$FTP_USER" &>/dev/null;] then
	# Créer le user FTP
	useradd -m ${FTP_USER}
	echo "${FTP_USER}:${FTP_PASS}" | chpasswd

	# Donner accès au dossier wordpress
	chown -R ${FTP_USER}:${FTP_USER} /var/www/wordpress
fi

vsftpd /etc/vsftpd.conf
