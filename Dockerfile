FROM debian:stretch

COPY ./user_list /etc/vsftpd/user_list
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN \
apt-get update && \
apt-get install -y \
procps \
vim \
vsftpd ftp \
deluged \
deluge-web \
sudo

RUN useradd -m ftpuser; 
RUN (echo 'pass'; echo 'pass') | passwd ftpuser

RUN mv /etc/vsftpd/vsftpd.conf /etc/vsftpd.conf

EXPOSE 8112 20 21

VOLUME /home/ftpuser
VOLUME /var/log/vsftpd

COPY ./start.sh /bin/start.sh
ENTRYPOINT ["/bin/start.sh"]
