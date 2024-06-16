FROM alpine:3.19

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk upgrade && apk add php82 php82-fpm php82-mysqli php82-iconv php82-phar wget unzip

COPY ./conf/www.conf /etc/php82/php-fpm.d/

RUN wget https://wordpress.org/latest.zip && unzip latest.zip -d /var/www/ && rm -rf latest.zip
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/run.sh .

ENTRYPOINT [ "sh", "/run.sh" ]