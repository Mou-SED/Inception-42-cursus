#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db
fi
	mysqld --bootstrap --user=mysql << end
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	CREATE DATABASE IF NOT EXISTS $DB_NAME;
	CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
	GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
end


mysqld_safe --datadir=/var/lib/mysql