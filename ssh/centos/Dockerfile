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
COPY sshd.conf  /etc/supervisord.d/sshd.conf
COPY sshd_config /etc/ssh/sshd_config


RUN chown user:user -R /home/user/ &&\
    chmod 600 /home/user/.ssh/authorized_keys
 
EXPOSE 22

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
