FROM debian:bullseye

RUN apt -y update apt install -y php
RUN apt install -y php-fpm php-mysql php-cli php-mbstring mariadb-client curl
RUN	apt-get install -y php php-cgi php-fpm php-mysql mariadb-client && mkdir -p /run/php

COPY	./tools/script.sh /tmp/script.sh
COPY	./conf/www.conf /tmp/www.conf

RUN		chmod 755 /tmp/script.sh

ENTRYPOINT	["sh", "/tmp/script.sh"]
