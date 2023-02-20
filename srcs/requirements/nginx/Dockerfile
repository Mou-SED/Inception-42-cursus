FROM alpine:3.16

# WORKDIR /etc/nginx
RUN apk update && apk upgrade && apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/index.html /var/www/

EXPOSE 80

CMD ["nginx"]