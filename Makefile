.PHONY : all down clean fclean re debug

NAME = inception
COMP = src/docker-compose.yml
USER = alde-abr

all:
	mkdir -p /home/$(USER)/data/wordpress_data
	mkdir -p /home/$(USER)/data/mariadb_data
	mkdir -p /home/$(USER)/data/minecraft_data
	docker compose -f $(COMP) up --build

down:
	sudo docker compose -f $(COMP) down

clean:
	sudo docker compose -f $(COMP) down -v

fclean: clean
	sudo docker system prune -af
	sudo rm -rf /home/$(USER)/data

re: fclean all
