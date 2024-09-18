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


all: starts_volumes up

# is $(SRCS) needed? TBD
status:
	docker-compose ps -a

up:
	docker-compose -f $(SRCS) up -d build

down:
	docker-compose -f $(SRCS) down -v --remove-orphans

starts_volumes:
	@mkdir -p hvecchio/data
	@mkdir -p hvecchio/data/mysql
	@mkdir -p hvecchio/data/wordpress
	@sudo chown -R hvecchio hvecchio/data
	@sudo chmod -R 777 hvecchio/data

re: down up

clean:
	docker-compose -f $(SRCS) down -v --remove-orphans --rmi all

fclean: clean
	@sudo rm -rd hvecchio/data/mysql
	@sudo rm -rd hvecchio/data/wordpress

.PHONY: all re down clean