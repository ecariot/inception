NAME		= inception

all:	inception

${NAME}: volume build up

build:
		docker-compose -f ./srcs/docker-compose.yml build

volume:
		sudo mkdir -p /home/emcariot/data/mysql
		sudo mkdir -p /home/emcariot/data/wordpress

up:
		docker-compose -f ./srcs/docker-compose.yml up -d

down:
		docker-compose -f ./srcs/docker-compose.yml down

logs:
		docker-compose -f./srcs/docker-compose.yml logs

clean:	down
		docker container prune --force

fclean:	clean
		sudo rm -rf /home/emcariot/data
		docker system prune --all --force --volumes
		docker network prune --force
		docker volume prune --force
		docker volume rm srcs_datadb
		docker volume rm srcs_wordpress

re:		fclean all

.PHONY:	all volume up down clean fclean re
