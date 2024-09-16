FROM debian:bullseye

RUN apt update -y && \
	apt upgarde -y &&\
	apt-get install -y mariadb-server mariadb-client && \
	mkdir -p /var/run/mysql && \
	chown -R mysql:mysql /var/run/mysql && \
	chown -R mysql:mysql /etc/mysql

COPY ./conf/doc.cnf /etc/mysql/mariadb.conf.d/doc.cnf
COPY ./conf/init.sql /tmp/init.sql
COPY ./tools/script.sh /tmp/script.sh

RUN chown -R mysql:mysql /etc/mysql && \
	chown -R mysql:mysql /tmp/

USER mysql

ENTRYPOINT [ "sh", "/tmp/script.sh" ]