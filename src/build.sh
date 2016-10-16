docker rm -f squid-runtime squid
docker rmi -f diladele/squid:3.5.19
docker build --force-rm --no-cache --rm=true -t diladele/squid:3.5.19 .
