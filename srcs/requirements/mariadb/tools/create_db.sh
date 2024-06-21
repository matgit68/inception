#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
		DB_ROOT_PASS=$(cat /run/secrets/DB_ROOT_PASS)
		DB_PASS=$(cat /run/secrets/DB_PASS)
        sed -i "s|CH_NAME|$DB_NAME|g" /tmp/create_db.sql
        sed -i "s|CH_ROOT_PASS|$DB_ROOT_PASS|g" /tmp/create_db.sql
        sed -i "s|CH_PASS|$DB_PASS|g" /tmp/create_db.sql
        sed -i "s|CH_USER|$DB_USER|g" /tmp/create_db.sql
	
	cat /tmp/create_db.sql
	sleep 3
	/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
fi

rm -f /tmp/create_db.*

exec "mysqld_safe"