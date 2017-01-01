FROM ubuntu:16.04
MAINTAINER  python <becivells@gmail.com> 
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list   && \
    apt-get -y update && apt-get install -y  python-pip  wget supervisor && pip install bandersnatch 
RUN apt-get install -y zlib1g-dev gcc make libpcre3 libpcre3-dev openssl  libssl-dev

RUN mkdir -p /opt/pypi/             &&\
    mkdir -p /etc/supervisord.d/    &&\
    mkdir -p /var/run/supervisor/   &&\
    mkdir -p /var/log/supervisor/    &&\
    mkdir -p /var/tmp/nginx/client/ &&\
    mkdir -p /var/tmp/nginx/proxy/  &&\
    mkdir -p /var/tmp/nginx/fcgi/   &&\
    mkdir -p /var/tmp/nginx/uwsgi/  &&\
    mkdir -p /var/tmp/nginx/scgi/  

ENV TENGINE_VERSION tengine-2.1.0

RUN cd /tmp/ && wget  http://tengine.taobao.org/download/${TENGINE_VERSION}.tar.gz &&\
    tar -zxvf ${TENGINE_VERSION}.tar.gz -C /tmp/ && chmod -R 777 /tmp/${TENGINE_VERSION}

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
      rm -rf /tmp/* && apt-get autoclean && \
      ln -s /opt/${TENGINE_VERSION}/ /opt/tengine

COPY supervisord.conf /etc/supervisord.conf
COPY pypimirrord.conf /etc/supervisord.d/pypimirrord.conf
COPY bandersnatch.conf /etc/bandersnatch.conf
COPY run.sh /etc/run.sh
COPY nginx.conf /opt/tengine/conf/nginx.conf

EXPOSE 80
VOLUME ["/opt/pypi/"]


CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]


