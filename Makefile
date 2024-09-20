###############################################################################
#********************** Makefile for Inception project  **********************#
###############################################################################

#********************************  SOURCE  ***********************************#

PATHS = docker-compose.yml
SRCS = $(addprefix $(SRCDIRS)/, $(PATHS))
SRCDIRS = srcs

#******************************  COLORS  *************************************#

GREEN			=	\033[0;32m
END				=	\033[0m

#******************************  RULES  **************************************#

all: hosts starts_volumes up

status:
	@sudo docker compose -f $(SRCS) ps -a

up:
	@sudo docker compose -f $(SRCS) up -d --build

down:
	@sudo docker compose -f $(SRCS) down -v --remove-orphans

starts_volumes:
	mkdir -p /home/hvecchio/data
	mkdir -p /home/hvecchio/data/mysql
	mkdir -p /home/hvecchio/data/wordpress
	mkdir -p /home/hvecchio/data/ftp
	sudo chown -R hvecchio /home/hvecchio/data
	sudo chmod -R 777 /home/hvecchio/data

hosts:
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 hvecchio.42.fr" >> /etc/hosts
	sudo echo "127.0.0.1 adminer.hvecchio.42.fr" >> /etc/hosts

re: down up

clean:
	sudo docker compose -f $(SRCS) down -v --remove-orphans --rmi all
	sudo sed -i '/127\.0\.0\.1\t${USER}\.42\.fr/d' /etc/hosts

fclean: clean
	sudo rm -rd /home/hvecchio/data/mysql
	sudo rm -rd /home/hvecchio/data/wordpress
	sudo rm -rd /home/hvecchio/data