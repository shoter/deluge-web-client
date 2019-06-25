FROM debian:stretch

COPY ./user_list /etc/vsftpd/user_list
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN \
apt-get update && \
apt-get install -y \
procps \
vsftpd ftp

RUN useradd -m -p pass ftpuser


RUN mv /etc/vsftpd/vsftpd.conf /etc/vsftpd.conf





EXPOSE 80 443
