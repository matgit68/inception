all: dir up

dir:
	@mkdir -p ~/data ~/data/mariadb ~/data/wordpress

up:
	@docker compose -f srcs/docker-compose.yml up --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down fclean dir up

fclean:
	@docker system prune -a -f
	@rm -rf ~/data
