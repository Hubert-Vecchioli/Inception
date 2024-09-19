if [ -d "/var/lib/mysql/$WORDPRESS_DB_NAME" ]; then
	echo "WordPress already installed"
	mysqld_safe
else
	mysql_install_db
	mysqld --init-file="/tmp/init.sql"
fi