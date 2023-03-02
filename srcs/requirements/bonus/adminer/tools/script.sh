#!/bin/sh

curl -Lo /var/www/adminer.php "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php"
chown nginx:nginx /var/www/adminer.php

php -S 0.0.0.0:80