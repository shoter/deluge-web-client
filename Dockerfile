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
deluge-web 

RUN useradd -m ftpuser; 
RUN (echo 'pass'; echo 'pass') | passwd ftpuser

RUN mv /etc/vsftpd/vsftpd.conf /etc/vsftpd.conf
RUN mkdir /home/ftpuser/downloading
RUN mkdir /home/ftpuser/completed
RUN mkdir /home/ftpuser/backups
RUN mkdir /home/ftpuser/autoadd

EXPOSE 8112 20 21

VOLUME /home/ftpuser
VOLUME /var/log/vsftpd

COPY ./start.sh /bin/start.sh
ENTRYPOINT ["/bin/start.sh"]
