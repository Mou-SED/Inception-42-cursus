#!/bin/sh

adduser -S nginx
addgroup -S nginx
chown -R nginx:nginx /var/www

mv /tmp/index.html /var/www/

cd /var/www
tee info.php << end
<?php phpinfo(); ?>
end

mkdir -p /var/www/wordpress
cd /var/www/wordpress

wp core download  --allow-root

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$DB_HOST --allow-root 

wp core install --url=moseddik.42.fr/wordpress --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PWD --admin_email=$ADMIN_EMAIL --skip-email --allow-root

wp user create $DB_USER test@gmail.com --role=author --user_pass=$DB_PWD --allow-root

wp theme install inspiro --activate --allow-root

php-fpm7