FROM debian:bullseye

# INSTALL DEPENDENCIES
RUN	apt-get -y update && \
	apt install redis-server -y

CMD	["redis-server", "--protected-mode no"]