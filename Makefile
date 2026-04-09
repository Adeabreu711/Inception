.PHONY : all down clean fclean re debug

NAME = inception
COMP = srcs/docker-compose.yml

all:
	mkdir -p /home/alexandre/data/wordpress_data
	mkdir -p /home/alexandre/data/mariadb_data
	docker compose -f $(COMP) up --build

down:
	sudo docker compose -f $(COMP) down

clean:
	sudo docker compose -f $(COMP) down -v

fclean: clean
	sudo docker system prune -af
	sudo rm -rf /home/alexandre/data

re: fclean all
