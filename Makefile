all:
	make run

run:
	mkdir -p /home/tobi/data/wordpress /home/tobi/data/mariadb
	make build
	make up

up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down

build:
	docker compose -f ./srcs/docker-compose.yml build

fclean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	rm -rf /home/tobi/data/wordpress/*
	rm -rf /home/tobi/data/mariadb/*

re:
	make fclean
	make run

