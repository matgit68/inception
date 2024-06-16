#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
        sed -i "s/DB_NAME/$DB_NAME/" /tmp/create_db.sql
        sed -i "s/DB_ROOT_PASS/$DB_ROOT_PASS/" /tmp/create_db.sql
        sed -i "s/DB_PASS/$DB_PASS/" /tmp/create_db.sql
        sed -i "s/DB_USER/$DB_USER/" /tmp/create_db.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
fi