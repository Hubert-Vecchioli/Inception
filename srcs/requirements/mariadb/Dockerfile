FROM debian:bullseye

RUN apt update -y && apt upgarde -y && apt-get install -y mariadb-server mariadb-client
RUN	mkdir -p /var/run/mysql && chown -R mysql:mysql /var/run/mysql && chown -R mysql:mysql /etc/mysql

## TO BE DELETED: https://hub.docker.com/_/mariadb/

COPY ./conf/doc.cnf /etc/mysql/mariadb.conf.d/doc.cnf
COPY ./conf/init.sql /tmp/init.sql
COPY tools/script.sh /home/script.sh

RUN chown -R mysql:mysql /etc/mysql
RUN chown -R mysql:mysql /tmp/
RUN chmod +x /home/script.sh

ENTRYPOINT [ "sh", "/tmp/script.sh" ]