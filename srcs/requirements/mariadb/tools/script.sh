
sed -i 's|{{WORDPRESS_DB_NAME}}|'${WORDPRESS_DB_NAME}'|g' /tmp/init.sql
sed -i 's|{{WORDPRESS_DB_USER}}|'${WORDPRESS_DB_USER}'|g' /tmp/init.sql
sed -i 's|{{WORDPRESS_DB_PASSWORD}}|'${WORDPRESS_DB_PASSWORD}'|g' /tmp/init.sql
sed -i 's|{{MARIADB_PASSWORD}}|'${MARIADB_PASSWORD}'|g' /tmp/init.sql

sed -i 's|{{MARIADB_PORT}}|'${MARIADB_PORT}'|g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's|{{MARIADB_ADRRESS}}|'${MARIADB_ADRRESS}'|g' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ -d "/var/lib/mysql/$WORDPRESS_DB_NAME" ]; then
	echo "WordPress already installed"
	mysqld_safe
else
	mysql_install_db
	mysqld --init-file="/tmp/init.sql"
fi