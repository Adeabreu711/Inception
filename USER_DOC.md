**User Documentation**
Services Provided
WordPress: Content management system available at https://alde-abr.42.fr
NGINX: Web server secured with TLS 1.2 / 1.3
MariaDB: Database (internal access only)
Data is stored in /home/alde-abr/data/
Starting and Stopping

Start:

make

Stop:

make down

Check status:

sudo docker ps
Accessing the Website

Main site: https://alde-abr.42.fr

Admin panel: https://alde-abr.42.fr/wp-admin

(Accept the self-signed certificate warning in your browser.)

**Credentials**

Passwords are located in the secrets/ directory:

db_password.txt
db_root_password.txt
ftp_password.txt
wp_admin_password.txt
wp_password.txt

Usernames are defined in srcs/.env:

WP_ADMIN_NAME (admin)
WP_USER_USER (subscriber)
Checking Services

Status:

sudo docker ps

Logs:

sudo docker compose -f srcs/docker-compose.yml logs

Test access:

curl -k https://alde-abr.42.fr
