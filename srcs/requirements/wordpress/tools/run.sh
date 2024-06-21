#!/bin/sh

echo coucou > /var/www/wordpress/index.html

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	DB_PASS=$(cat /run/secrets/DB_PASS)
	WP_APASS=$(cat /run/secrets/WP_APASS)
	WP_UPASS=$(cat /run/secrets/WP_UPASS)
	chmod -R 755 /var/www/wordpress/
	cd /var/www/wordpress
	wp core config --allow-root --dbname=$DB_NAME --dbpass=$DB_PASS --dbuser=$DB_USER --dbhost=mariadb:3306
	wp core install --url=mdjemaa.42.fr --title="Lamest internet website since 1996" --admin_user=$WP_ADMIN --admin_password=$WP_APASS --admin_email=$WP_AMAIL --skip-email
	wp user create $WP_USER $WP_UMAIL --user_pass=$WP_UPASS --role=editor
	chown -R nobody:nobody /var/www/wordpress/wp-content/
fi

exec /usr/sbin/php-fpm82 -F