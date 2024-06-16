#!/bin/sh

echo coucou > /var/www/wordpress/index.html

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	chmod -R 755 /var/www/wordpress/
	cd /var/www/wordpress
	wp core download --allow-root
	wp core config --allow-root --dbname=$DB_NAME --dbpass=$DB_PASS --dbuser=$DB_USER --dbhost=mariadb:3306
	wp core install --url=mdjemaa.42.fr --title="Lamest internet website since 1996" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=info@example.com --skip-email
	wp user create toto user@lamb.da --user_pass=titi --role=editor
	# chown -R nobody:nobody /var/www/wordpress/wp-content/
fi

exec /usr/sbin/php-fpm82 -F