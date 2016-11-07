#
# Docker file for running Squid Proxy Server
#
FROM ubuntu:16.04

MAINTAINER support@diladele.com

# set configuration variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV SQUID_CACHE_DIR /var/spool
ENV SQUID_LOG_DIR /var/log/squid
ENV SQUID_CONFIG_DIR /etc/squid

# install apt utils
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils curl && \
    curl http://packages.diladele.com/diladele_pub.asc -o diladele_pub.asc && \
    apt-key add diladele_pub.asc && \
    rm diladele_pub.asc && \
    echo "deb http://ubuntu16.diladele.com/ubuntu/ xenial main" > /etc/apt/sources.list.d/ubuntu16.diladele.com.list && \
    rm -rf /var/lib/apt/lists/*

# install squid
RUN apt-get update && apt-get install -y --no-install-recommends \
            libecap3 \
            squid-common \
            squid \
            squidclient && \
    rm -rf /var/run/squid.pid && \
    rm -rf /var/lib/apt/lists/*

COPY contents/firstrun.sh /usr/local/bin/firstrun.sh
COPY contents/entrypoint.sh /sbin/entrypoint.sh

# reset the mod on scripts
RUN chmod 755 /usr/local/bin/firstrun.sh && \
    chmod 755 /sbin/entrypoint.sh

# assign volumes
VOLUME ["${SQUID_CONFIG_DIR}"]
VOLUME ["${SQUID_CACHE_DIR}"]
VOLUME ["${SQUID_LOG_DIR}"]

CMD ["/sbin/entrypoint.sh"]
