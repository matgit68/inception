FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY tools/create_db.* /tmp/
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN sh /tmp/create_db.sh && rm -f /tmp/create_db.*

USER mysql

CMD [ "cat" ]
#CMD ["/usr/bin/mysqld", "--skip-log-error"]
