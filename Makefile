DOCKER_DIR	:= ./srcs

DOCKER_F	:= $(DOCKER_DIR)/docker-compose.yml


up:
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

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

re : fclean up


.PHONY: up build start stop rm down fclean