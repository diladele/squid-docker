docker run -it --name squid-runtime diladele/squid:3.5.19 /usr/local/bin/firstrun.sh
docker run -d --name squid --volumes-from squid-runtime -p 3128:3128 -t diladele/squid:3.5.19
