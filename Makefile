DC := docker compose -f ./srcs/docker-compose.yml

all: generate
	@mkdir -p /home/buozdemi/data/wordpress
	@mkdir -p /home/buozdemi/data/mysql
	@$(DC) up -d --build
	@rm -rf ./srcs/requirements/mariadb/tools/initial_db.sql
down:
	@$(DC) down

re: clean all

clean:
	@$(DC) down -v --remove-orphans
	@docker rmi -f $$(docker images -q)
	@rm -rf ./srcs/requirements/mariadb/tools/initial_db.sql

generate:
	./srcs/requirements/mariadb/tools/tesla.sh

.PHONY: all down re clean
