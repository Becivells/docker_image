FROM alpine:latest
MAINTAINER	becivells <becivells@gmail.com>

RUN apk --update add  redis && \
    rm -rf /var/cache/apk/*
#pass&remote
RUN    sed -i "s/# requirepass foobared/requirepass 123456/g" /etc/redis.conf \
    && sed -i "s/^bind 127\.0\.0\.1.*/bind 0\.0\.0\.0/g" /etc/redis.conf \
    && sed -i "s/^daemonize yes/daemonize no/g" /etc/redis.conf 
EXPOSE 6379
CMD ["/usr/bin/redis-server" , "/etc/redis.conf"]

