FROM ubuntu:16.04
MAINTAINER  becivells <becivells@gmail.com>

#becivells/ubuntu:base
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get -y update && apt-get install -y  supervisor                       && \
    mkdir -p /var/log/supervisor                                              && \
    mkdir -p /etc/supervisord.d/                                              && \
    mkdir -p /var/run/supervisor/ 
COPY config/supervisord.conf  /etc/supervisord.conf 

#program
#RUN command
#COPY config/programd.conf  /etc/supervisord.d/programd.conf
#EXPOSE 80 3306
#VOLUME ["/dir/"]


CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
