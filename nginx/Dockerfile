FROM alpine:3.4
MAINTAINER becivells <becivells@gmail.com> 
RUN apk add --update openssh
RUN apk add nginx 
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa &&\  
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa &&\
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa &&\
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config &&\


RUN adduser  -D  www &&\
    mkdir -p /home/www/.ssh &&\
    mkdir -p /run/nginx/    &&\
    mkdir -p /home/www/html &&\
    ln -s /home/www/html/ /var/www/ && \
    echo "www:123456" | chpasswd
##禁止密码登陆
#RUN echo "PasswordAuthentication no" >>/etc/ssh/sshd_config
#COPY id_rsa.pub /home/www/.ssh/authorized_keys

COPY nginx.conf /etc/nginx/nginx.conf
RUN chown www:www  -R /home/www/ &&\
    chmod 755 -R /home/www/ &&\
    echo "nginx" >>/etc/start.sh &&\
    echo "/usr/sbin/sshd -D" >>/etc/start.sh


EXPOSE 80
EXPOSE 22

CMD ["/bin/sh","/etc/start.sh"]
