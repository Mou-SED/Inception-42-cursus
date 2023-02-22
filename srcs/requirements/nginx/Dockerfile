FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl/ && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/moseddik.42.key -out /etc/nginx/ssl/moseddik.42.crt \
	-subj "/C=MA/ST=/L=/O=/OU=/CN=moseddik"

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

COPY ./tools/index.html /var/www/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
