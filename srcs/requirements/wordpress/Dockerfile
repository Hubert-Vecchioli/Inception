FROM debian:bullseye

RUN		apt -y update && \
		apt install -y php && \
		PHP_VERSION=7.4 && \
		apt install -y \
			php-fpm \
			php-mysql \
			php-cli \
			php-mbstring \
			mariadb-client \
			curl && \
		rm -rf /etc/php/7.4/fpm/pool.d/www.conf && \
		mkdir -p /run/php

COPY	./tools/script.sh /tmp/script.sh
COPY	./conf/www.conf /tmp/www.conf

RUN		chmod 755 /tmp/script.sh

ENTRYPOINT	["sh", "/tmp/script.sh"]