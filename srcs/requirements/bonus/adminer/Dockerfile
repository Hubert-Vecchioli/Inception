FROM debian:bullseye

RUN	apt -y update && \
	apt install -y \
		wget \
		php \
		php-mysql

COPY ./tools/script.sh /tmp/script.sh

ENTRYPOINT ["sh", "/tmp/script.sh"]
