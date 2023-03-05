DOCKER_DIR	:= ./srcs
MARIADB_DIR	:= /home/moseddik/data/mariadb
WPRESS_DIR	:= /home/moseddik/data/wordpress

DOCKER_F	:= $(DOCKER_DIR)/docker-compose.yml

MAKEFLAGS := --silent


up:
	@mkdir -p $(MARIADB_DIR)
	@mkdir -p $(WPRESS_DIR)
	@docker-compose -f $(DOCKER_F) up -d --build

build:
	@docker-compose -f $(DOCKER_F) build

start:
	@docker-compose -f $(DOCKER_F) start

stop:
	@docker-compose -f $(DOCKER_F) stop

rm:
	@docker-compose -f $(DOCKER_F) rm

rmi:
	@docker image rm $(shell docker image ls -aq)

down:
	@docker-compose -f $(DOCKER_F) down

fclean: down
	@printf "Total clean of all configurations docker\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf /home/moseddik/data/*

re : fclean up

logs:
	docker-compose -f $(DOCKER_F) logs --follow


.PHONY: up build start stop rm down fclean re