# Dev Documentation

## Prerequisites
Docker
Docker Compose
Make
Git

## Installation
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Install docker

sudo apt install docker-compose-plugin
# Install Docker Compose
```

## Configuration

### .env
MYSQL_DB=example
MYSQL_USER=mysql-user
MYSQL_PASS=secret
DOMAIN_NAME=example.42.fr
WP_TITLE=Example
WP_ADMIN_NAME=alde-abr
WP_ADMIN_EMAIL=alde-abr@student.42.fr
WP_ADMIN_PASS=secret
WP_USER_NAME=user
WP_USER_ROLE=subscriber
WP_USER_EMAIL=user@42.fr
WP_USER_PASS=secret
FTP_USER=ftp_user
FTP_PASS=secret

### Secrets
```bash
mkdir secrets
#Create the secrets folder in the root of the cloned project 

echo "exemplepass" > db_password.txt
echo "exemplepass" > db_root_password.txt
echo "exemplepass" > ftp_password.txt
echo "exemplepass" > wp_admin_password.txt
echo "exemplepass" > wp_password.txt
chmod 600 secrets/*.txt
#Create/Replace secret files and restrict writting
```

## Build / Lauching

### Makefile
```bash
make			# Build and start
make down		# Stop
make clean		# Stop containers
make fclean		# Stop containers and clean volumes
make re			# Rebuild
```

### Docker Compose
```bash
docker compose -f srcs/docker-compose.yml up --build
# Build images and start container

sudo docker compose -f srcs/docker-compose.yml down
# Stop container

sudo docker compose -f srcs/docker-compose.yml down -v
# Stop container and clean volumes
```

## Manage Container/Volumes

```bash
sudo docker ps						# List active containers
sudo docker compose ps				# List active compose container
sudo docker network ls				# List active networks
sudo docker volume ls				# List volumes
sudo docker image ps				# List active Images
sudo docker logs *service*			# Show *service* logs
sudo docker restart *service*		# Restart *service*
sudo docker exec -it *service* sh	# Shell *service* access
```

## Data
The data is persistant and is stored in the /home/alde-abr/date folder until you down volumes.

Database: /home/alde-abr/data/mariadb_service [MariaDB]
WordPress: /home/alde-abr/data/wordpress_service [Wordpress]
Minecraft: /home/alde-abr/data/minecraft_service [Minecraft]

## Service

### Docker
Docker is a tool that allows applications to run in isolated and reproducible containers.

```bash
sudo service docker start
# Start Docker on the OS

docker exec -it *service_name* bash
# Access the *service_name* container terminal

docker compose ps
# Display the status of containers in the Compose setup

docker images
# List Docker images available on the system

docker network inspect *network_name*
# Display details of the specified network

openssl s_client -connect localhost:*port*
# Retrieve the SSL certificate for the specified port

curl -v http://localhost:*port*
# Attempt to connect to the specified port
```

### NGINX
NGINX is a web server that receives HTTPS requests and forwards them to WordPress via FastCGI.

```bash
docker exec -it nginx nginx -t
docker exec -it nginx cat /etc/nginx/nginx.conf
# Test the NGINX configuration

openssl s_client -connect localhost:443
# Retrieve the SSL certificate for port 443

curl -v http://localhost:443
# Attempt to connect to port 443
```

### MariaDB
MariaDB is used to store WordPress data in a database.

```bash
mariadb -u *user* -p *db_name*
# Connect as *user* to the database *db_name*

mariadb -u root -p
# Connect as root user

SHOW DATABASES;
# Display available databases

USE *db_name*;
# Select the database *db_name*

SHOW TABLES;
# Show all tables in the selected database
# (only works after USE)

SELECT USER();
# Display the current user

SHOW GRANTS;
# Show privileges of the current user

quit;
# Exit the SQL terminal
```

### FTP Server
FTP allows file transfers directly into the WordPress directory from your computer without using the web interface.

```bash
ftp -p localhost 21
# Connect via FTP

put *file.txt*
# Upload a file

get *file.txt*
# Download a file

quit
# Exit FTP
```

### Redis
Redis caches WordPress SQL query results in RAM to avoid recalculating them on every request, improving website performance.

```bash
docker exec -it wordpress wp redis status --allow-root --path=/var/www/wordpress
# Check Redis status from WordPress

docker exec -it redis redis-cli info stats | grep -E "hits|misses"
# Show cache hits and misses statistics
```
### Adminer
