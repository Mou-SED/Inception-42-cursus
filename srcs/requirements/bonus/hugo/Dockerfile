FROM alpine:3.16

RUN apk add hugo git

COPY ./tools/readme.md /tmp

COPY /tools/script.sh /tmp/script.sh

EXPOSE 1313

ENTRYPOINT [ "/tmp/script.sh" ]