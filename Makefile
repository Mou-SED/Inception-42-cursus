DOCKER_DIR	:= ./srcs

DOCKER_F	:= $(DOCKER_DIR)/docker-compose.yml


up:
	@sudo docker-compose -f $(DOCKER_F) up -d

build:
	@sudo docker-compose -f $(DOCKER_F) build

start:
	@sudo docker-compose -f $(DOCKER_F) start

stop:
	@sudo docker-compose -f $(DOCKER_F) stop

rm:
	@sudo docker-compose -f $(DOCKER_F) rm

rmi:
	@sudo docker image rm $(shell docker image ls -aq)

down:
	@sudo docker-compose -f $(DOCKER_F) down

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force


.PHONY: up build start stop rm down fclean