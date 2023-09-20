DC := docker compose -f ./srcs/docker-compose.yml

all: generate
	@mkdir -p /home/$(USER)/data/wordpress
	@mkdir -p /home/$(USER)/data/mysql
	@$(DC) up -d --build
down:
	@$(DC) down

re: clean all

clean:
	@$(DC) down -v --remove-orphans; true;
	@docker rmi -f $$(docker images -q); true;
	@rm -rf ./srcs/requirements/mariadb/tools/initial_db.sql
	@rm -rf ./srcs/requirements/nginx/conf/nginx.conf
	

generate:
	./srcs/requirements/mariadb/tools/tesla.sh
	./srcs/requirements/nginx/tools/tesla3.sh

.PHONY: all down re clean
