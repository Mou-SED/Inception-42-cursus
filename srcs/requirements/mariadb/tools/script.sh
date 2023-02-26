#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
	mysqld --bootstrap --user=mysql << end
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
	CREATE DATABASE IF NOT EXISTS $db_name;
	CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd';
	GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';
end


mysqld_safe --datadir=/var/lib/mysql