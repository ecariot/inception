NAME = inception

all: inception

build:

		docker-compose -f srcs/docker-compose.yml up -d --build
volume:
		rm -rf /home/emcariot/data
		mkdir -p /home/emcariot/data
		mkdir -p /home/emcariot/data/mysql
		mkdir -p /home/emcariot/data/wordpress
down:
		docker-compose -f srcs/docker-compose.yml down
stop:
		docker-compose -f srcs/docker-compose.yml stop
rm: stop
		docker-compose -f srcs/docker-compose.yml rm
clean: down
		docker system prune -af
		docker volume prune --force
fclean: docker stop $$(docker ps -qa)
		docker system pune --all --force --volumes
re: down
	docker-compose -f srcs/docker-compose.yml up -d --build

.PHONY: all build down re clean fclean
