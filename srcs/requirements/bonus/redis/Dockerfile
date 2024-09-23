FROM debian:bullseye

RUN	apt-get -y update && \
	apt install redis-server -y

CMD	["redis-server", "--protected-mode no"]