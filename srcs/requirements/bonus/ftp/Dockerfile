FROM alpine:3.16

ENV FTP_USER=ftp-user
ENV FTP_PWD=ftp12345

RUN apk add vsftpd && mkdir -p /home/moseddik/ftp/files && adduser $FTP_USER --disabled-password \
	&& echo "$FTP_USER:$FTP_PWD" | chpasswd \
	&& chown -R $FTP_USER:$FTP_USER /home/moseddik/ftp/files

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]