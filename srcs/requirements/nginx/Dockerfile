FROM debian:bullseye

RUN apt -y update && apt upgrade -y && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx
RUN rm -rf /etc/nginx/sites-available/default

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY ./tools/script.sh /tmp/script.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE	443

ENTRYPOINT	["sh", "/tmp/script.sh"]