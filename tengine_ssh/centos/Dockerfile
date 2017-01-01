FROM centos:7
MAINTAINER  becivells <becivells@gmail.com>

RUN yum -y update && yum install -y  epel-release  
RUN yum install -y  supervisor screen net-tools iftop openssl openssh-server nc sudo

RUN  mkdir -p /var/log/supervisor/   &&\
     mkdir -p /etc/supervisord.d/    

RUN  mkdir -p /var/run/sshd/         &&\
     useradd  -s /bin/bash -m user   &&\
     echo "user:123456" | chpasswd   &&\
     echo "root:123456" | chpasswd   &&\
     sed -i "s/PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config &&\
     echo "user    ALL=(ALL:ALL) ALL" >> /etc/sudoers &&\
     mkdir -p /home/user/.ssh/ &&\
     ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa &&\
     ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa &&\
     ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

COPY id_rsa.pub /home/user/.ssh/authorized_keys
COPY supervisord.conf  /etc/supervisord.conf
COPY supervisor_sshd.conf  /etc/supervisord.d/supervisor_sshd.conf
COPY sshd_config /etc/ssh/sshd_config


RUN chown user:user -R /home/user/ &&\
    chmod 600 /home/user/.ssh/authorized_keys

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
 
COPY supervisor_tengine.conf  /etc/supervisord.d/supervisor_tengine.conf
COPY nginx.conf /opt/tengine/conf/nginx.conf
EXPOSE 22 80

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
