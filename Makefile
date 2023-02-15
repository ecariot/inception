NAME = inception

all: inception

${NAME}: build up

build:

		sudo docker-compose -f srcs/docker-compose.yml build
volume:
		sudo rm -rf /home/emcariot/data
		sudo mkdir -p /home/emcariot/data
		sudo mkdir -p /home/emcariot/data/mysql
		sudo mkdir -p /home/emcariot/data/wordpress
up:
		sudo docker-compose -f srcs/docker-compose.yml up -d --remove-orphans
down:
		sudo docker-compose -f srcs/docker-compose.yml down
stop:
		sudo docker-compose -f srcs/docker-compose.yml stop
rm: stop
		sudo docker-compose -f srcs/docker-compose.yml rm
clean: rm
		docker system prune -af
re: clean ${NAME}

.PHONY: all clean
