FROM centos:7
MAINTAINER  becivells <becivells@gmail.com> 
RUN yum -y update &&  yum  -y upgrade
RUN yum -y install gcc openssl-devel pcre-devel zlib-devel  make wget 
ENV TENGINE_VERSION tengine-2.1.0
RUN cd /tmp/ && wget  http://tengine.taobao.org/download/${TENGINE_VERSION}.tar.gz &&\
    tar -zxvf ${TENGINE_VERSION}.tar.gz -C /tmp/ && chmod -R 777 /tmp/${TENGINE_VERSION}
#mkdir
RUN mkdir -p /var/tmp/nginx/client/ &&\
    mkdir -p /var/tmp/nginx/proxy/ &&\
    mkdir -p /var/tmp/nginx/fcgi/ &&\
    mkdir -p /var/tmp/nginx/uwsgi/ &&\
    mkdir -p /var/tmp/nginx/scgi/ 
#./configure
RUN cd /tmp/${TENGINE_VERSION} && ./configure \
  --prefix=/opt/${TENGINE_VERSION}/ \
  --error-log-path=/var/log/nginx/error.log \
  --http-log-path=/var/log/nginx/access.log \
  --pid-path=/var/run/nginx/nginx.pid  \
  --lock-path=/var/lock/nginx.lock \
  --with-http_ssl_module \
  --with-http_flv_module \
  --with-http_stub_status_module \
  --with-http_gzip_static_module \
  --http-client-body-temp-path=/var/tmp/nginx/client/ \
  --http-proxy-temp-path=/var/tmp/nginx/proxy/ \
  --http-fastcgi-temp-path=/var/tmp/nginx/fcgi/ \
  --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
  --http-scgi-temp-path=/var/tmp/nginx/scgi \
  --with-pcre  &&\
  cd /tmp/${TENGINE_VERSION} && make && make install && \
  rm -rf /tmp/* && yum clean all && \
    ln -s /opt/${TENGINE_VERSION}/ /opt/tengine
EXPOSE 80
CMD ["/opt/tengine/sbin/nginx", "-g", "daemon off;"] 

