all: dir up

dir:
	@mkdir -p ~/data ~/data/mariadb ~/data/wordpress

pass:
	@openssl rand -base64 12 > secrets/DB_ROOT_PASS.txt
	@openssl rand -base64 12 > secrets/DB_PASS.txt
	@echo "Create wordpress admin pass :"
	@./pass.sh > secrets/WP_APASS.txt;
	@chmod 600 secrets/WP_APASS.txt
	@echo "Create wordpress user pass :"
	@./pass.sh > secrets/WP_UPASS.txt;
	@chmod 600 secrets/WP_UPASS.txt

up:
	@docker compose -f srcs/docker-compose.yml up --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down fclean dir up

fclean:
	@docker system prune -a -f
	@rm -rf ~/data
	@rm -rf ~/secrets/*
