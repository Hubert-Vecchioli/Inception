FROM debian:bullseye

RUN	apt update -y && apt upgrade -y && apt-get install -y mariadb-server mariadb-client
RUN	mkdir -p /var/run/mysqld
RUN	chown -R mysql:mysql /var/run/mysqld && chown -R mysql:mysql /etc/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/init.sql /tmp/init.sql
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN	chown -R mysql:mysql /etc/mysql && \
RUN	chown -R mysql:mysql /tmp/

USER	mysql

ENTRYPOINT	["sh", "/tmp/entrypoint.sh"]