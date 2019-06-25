#!/bin/bash
service vsftpd restart || true

sudo -u ftpuser deluged &
sudo -u ftpuser deluge-web &


echo 'deluge-web-client started!';
bash
