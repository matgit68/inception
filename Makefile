all: init pass up

init:
	@mkdir -p ~/data ~/data/mariadb ~/data/wordpress
	@if [ ! -e secrets/.EVIDENCE ]; then \
		srcs/requirements/tools/pass.sh secrets/DB_ROOT_PASS.txt --auto; \
		chmod 600 secrets/DB_ROOT_PASS.txt; \
		srcs/requirements/tools/pass.sh secrets/DB_PASS.txt --auto; \
		chmod 600 secrets/DB_PASS.txt; \
		echo "Create wordpress admin pass :"; \
		srcs/requirements/tools/pass.sh secrets/WP_APASS.txt; \
		chmod 600 secrets/WP_APASS.txt; \
		echo "Create wordpress user pass :"; \
		srcs/requirements/tools/pass.sh secrets/WP_UPASS.txt; \
		chmod 600 secrets/WP_UPASS.txt; \
		touch secrets/.EVIDENCE; \
		chmod 600 secrets/.EVIDENCE; \
	fi

up:
	@docker compose -f srcs/docker-compose.yml up --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down fclean all

fclean:
	@docker system prune -a -f
	@sudo rm -rf ~/data
	@sudo rm -rf ~/secrets/*
