FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client

ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASS=${DB_PASS}
ENV DB_ROOT_PASS=${DB_ROOT_PASS}

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY tools/create_db.* /tmp/
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT [ "sh" , "/tmp/create_db.sh" ]