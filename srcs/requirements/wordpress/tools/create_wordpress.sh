#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress already downloaded"
else

######## MANDATORY ########

	wget https://wordpress.org/wordpress-6.3.1.tar.gz
	tar xfz wordpress-6.3.1.tar.gz
	mv wordpress/* .
	rm -rf wordpress-6.3.1.tar.gz
	rm -rf wordpress
	sh /var/www/tesla2.sh
	rm -rf /var/www/tesla2.sh
	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}
fi

exec "$@"
