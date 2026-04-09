#!/bin/bash

#--------------mariadb start--------------#
service mariadb start
sleep 3

#--------------secrets read--------------#
MYSQL_PASSWORD=$(cat /run/secrets/db_password)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

#--------------mariadb config--------------#
mysqladmin -u root password ${MYSQL_ROOT_PASSWORD}

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
mariadb -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
# Shutdown mariadb to restart with new config
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Restart mariadb with new config in the background to keep the container running
exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
