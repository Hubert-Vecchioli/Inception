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

all: host starts_volumes up

# is $(SRCS) needed? TBD
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

host:
	echo "127.0.0.1 hvecchio.42.fr" | sudo tee -a /etc/hosts > /dev/null;
	echo "127.0.0.1 adminer.hvecchio.42.fr" | sudo tee -a /etc/hosts > /dev/null;

re: down up

clean:
	sudo docker compose -f $(SRCS) down -v --remove-orphans --rmi all

fclean: clean
	sudo rm -rd /home/hvecchio/data/mysql
	sudo rm -rd /home/hvecchio/data/wordpress
	sudo rm -rd /home/hvecchio/data