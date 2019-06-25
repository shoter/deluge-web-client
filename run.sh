docker rm test
docker run -i -P --mount source=deluge_damian,target=/home/ftpuser --name test -t deluge-web-client
