#!/bin/sh
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wp-config.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wp-config.php
mv /var/www/wp-config.php /var/www/html/
