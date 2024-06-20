#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
        sed -i "s/CH_NAME/$DB_NAME/" /tmp/create_db.sql
        sed -i "s/CH_ROOT_PASS/$DB_ROOT_PASS/" /tmp/create_db.sql
        sed -i "s/CH_PASS/$DB_PASS/" /tmp/create_db.sql
        sed -i "s/CH_USER/$DB_USER/" /tmp/create_db.sql
	
	cat /tmp/create_db.sql
	sleep 5
	#/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
fi

#rm -f /tmp/create_db.*

#su -l mysql

exec "sh"
#exec "/usr/bin/mysqld --skip-log-error"

