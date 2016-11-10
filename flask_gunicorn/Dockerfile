FROM ubuntu:16.04
MAINTAINER  becivells <becivells@gmail.com>

#becivells/ubuntu:base
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get -y update && apt-get install -y  supervisor                       && \
    mkdir -p /var/log/supervisor                                              && \
    mkdir -p /etc/supervisord.d/                                              && \
    mkdir -p /var/run/supervisor/ 
COPY config/supervisord.conf  /etc/supervisord.conf 


#tengine
RUN apt-get install -y zlib1g-dev gcc make libpcre3 libpcre3-dev openssl  libssl-dev wget
#create dir
RUN mkdir -p /etc/supervisord.d/    &&\
    mkdir -p /var/run/supervisor/   &&\
    mkdir -p /var/log/supervisor/   &&\
    mkdir -p /var/tmp/nginx/client/ &&\
    mkdir -p /var/tmp/nginx/proxy/  &&\
    mkdir -p /var/tmp/nginx/fcgi/   &&\
    mkdir -p /var/tmp/nginx/uwsgi/  &&\
    mkdir -p /var/tmp/nginx/scgi/  
#env
ENV TENGINE_VERSION tengine-2.1.0
#download
RUN cd /tmp/ && wget  http://tengine.taobao.org/download/${TENGINE_VERSION}.tar.gz        &&\
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
#config
COPY config/nginx.conf /opt/tengine/conf/nginx.conf
COPY config/supervisor_nginx.conf  /etc/supervisord.d/supervisor_nginx.conf


#flask uwsgi
RUN apt-get install -y python-pip && \
    mkdir ~/.pip
COPY config/pip.conf ~/.pip/pip.conf
#run
RUN pip install flask  && \
    pip install gunicorn
#config
COPY config/supervisor_gunicorn.conf  /etc/supervisord.d/supervisor_gunicorn.conf


#web
RUN  mkdir -p /pyweb/   &&\
     pip install requests
COPY index.py /pyweb/index.py

EXPOSE 80 
VOLUME ["/pyweb/"]

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]