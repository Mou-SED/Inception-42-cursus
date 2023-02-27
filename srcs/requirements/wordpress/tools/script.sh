#!/bin/sh

chmod -R 777 /var/www/html

cd /var/www/html

wp core download  --allow-root

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --allow-root 

wp core install --url=example.com --title=inception --admin_user=supervisor --admin_password=strongpassword --admin_email=moseddik.42.fr --allow-root

wp user create moseddik moseddik.42.fr --porcelain --allow-root