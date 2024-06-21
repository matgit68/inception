all: init up

init:
	@mkdir -p ~/data ~/data/mariadb ~/data/wordpress
	@if [ ! -e secrets/DB_PASS.txt ]; then \
		srcs/requirements/tools/pass.sh secrets/DB_PASS.txt --auto; \
	fi
	@if [ ! -e secrets/DB_ROOT_PASS.txt ]; then \
		srcs/requirements/tools/pass.sh secrets/DB_ROOT_PASS.txt --auto; \
	fi
	@if [ ! -e secrets/WP_APASS.txt ]; then \
		echo "Create wordpress admin pass :"; \
		srcs/requirements/tools/pass.sh secrets/WP_APASS.txt; \
	fi
	@if [ ! -e secrets/WP_UPASS.txt ]; then \
		echo "Create wordpress user pass :"; \
		srcs/requirements/tools/pass.sh secrets/WP_UPASS.txt; \
	fi

up:
	@docker compose -f srcs/docker-compose.yml up --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down fclean all

fclean:
	@docker system prune -a -f
	@sudo rm -rf ~/data
	@sudo rm -rf secrets/*
