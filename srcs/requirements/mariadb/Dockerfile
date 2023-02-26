FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/my.cnf

COPY ./tools/script.sh /tmp/script.sh

ENTRYPOINT [ "/tmp/script.sh" ]

EXPOSE 3306

