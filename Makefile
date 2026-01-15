WP_DATA = /home/mjuicha/data/wordpress
DB_DATA = /home/mjuicha/data/mariadb

all: up

build:
	clear
	docker compose -f ./srcs/docker-compose.yml build

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

clean:
	@docker system prune -a --volumes -f

re: fclean up

fclean: clean
	@sudo rm -rf $(WP_DATA)/*
	@sudo rm -rf $(DB_DATA)/*

.PHONY: all up build down stop start  clean re fclean 
