FROM ubuntu:latest
MAINTAINER  becivells <becivells@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN apt-get -y update && apt-get install -y apt-utils python-pip  wget supervisor   
RUN apt-get  install -y screen netcat curl inetutils-ping iftop openssh-server cron vim net-tools
RUN apt-get  install -y zlib1g-dev gcc make libpcre3 libpcre3-dev openssl  libssl-dev

RUN  mkdir -p /var/log/supervisor    &&\
     mkdir -p /var/run/sshd          &&\
     useradd  -s /bin/bash -m user   &&\
     echo "user:123456" | chpasswd   &&\
     echo "root:123456" | chpasswd   &&\
     sed -i "s/PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config &&\
     mkdir -p /home/user/.ssh/

#设置证书登录禁止密码登陆 如果想使用去掉下面两个#号   

#COPY id_rsa.pub /home/user/.ssh/authorized_keys
COPY supervisord.conf  /etc/supervisord.conf
COPY sshd.conf  /etc/supervisord.d/sshd.conf
COPY sshd_config /etc/ssh/sshd_config
#RUN echo "PasswordAuthentication no" >>/etc/ssh/sshd_config

RUN chown user:user -R /home/user/ &&\
    chmod 600 /home/user/.ssh/authorized_keys
 
EXPOSE 22

CMD ["/usr/bin/supervisord"]