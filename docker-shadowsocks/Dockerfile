FROM alpine:3.4
MAINTAINER  python <becivells@gmail.com> 
RUN  apk -U add python   py-pip \
    && pip install shadowsocks && mkdir /etc/shadowsocks && rm -rf /var/cache/apk/*
COPY shadowsocks.json /etc/shadowsocks/shadowsocks.json
EXPOSE 9001 9002
CMD [ "ssserver","-c","/etc/shadowsocks/shadowsocks.json" ]
