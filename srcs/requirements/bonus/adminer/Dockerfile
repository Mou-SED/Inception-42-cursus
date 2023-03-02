FROM alpine:3.16

RUN sed -i "s/6/5/g" /etc/apk/repositories

RUN adduser -S nginx && addgroup -S nginx
RUN apk update && apk add --no-cache curl php7 mariadb-client php7-pdo php7-pdo_mysql

COPY ./tools/script.sh /tmp

CMD [ "/tmp/script.sh" ]

