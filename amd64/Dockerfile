FROM ubuntu:18.04

LABEL maintainer="devops@domotz.com"

EXPOSE 3000

ADD https://portal.domotz.com/download/agent_packages/domotz-debian-x64-1.0.deb /root/

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates iputils-ping net-tools

RUN printf "#!/bin/sh\necho N 2" > /sbin/runlevel \
 && chmod +x /sbin/runlevel \
 && printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d \
 && chmod +x /usr/sbin/policy-rc.d \
 && dpkg -i /root/domotz-debian-*.deb \
 && rm /root/domotz-debian-*.deb \
 && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/raspberry/docker/g' /opt/domotz/etc/domotz.env

RUN mkdir /opt/utils
COPY runme.sh /opt/utils

CMD service domotz start \
 && /opt/utils/runme.sh
