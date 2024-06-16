FROM alpine:3.19

RUN apk update && apk upgrade && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -out /etc/nginx/ssl/mdjemaa.crt -keyout /etc/nginx/ssl/mdjemaa.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mdjemaa.42.fr/UID=mdjemaa"

COPY conf/nginx.conf /etc/nginx/http.d/mdjemaa.conf

RUN chown root /var/www/; chmod -R 755 /var/www/

CMD [ "nginx", "-g", "daemon off;" ]