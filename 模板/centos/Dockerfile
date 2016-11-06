FROM centos:7
MAINTAINER  becivells <becivells@gmail.com>

#becivells/centos:base
RUN yum -y update && yum install -y epel-release supervisor  && \ 
    mkdir -p /var/log/supervisor                 && \
    mkdir -p /etc/supervisord.d/                 && \
    mkdir -p /var/run/supervisor/   
COPY config/supervisord.conf  /etc/supervisord.conf


#program
#RUN command
#COPY config/programd.conf  /etc/supervisord.d/programd.conf
#EXPOSE 80 3306
#VOLUME ["/dir/"]


CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
