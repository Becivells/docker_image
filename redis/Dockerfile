FROM alpine:latest
MAINTAINER	becivells <becivells@gmail.com>

RUN apk --update add  redis && \
    rm -rf /var/cache/apk/*
EXPOSE 6379
CMD ["redis-server"]

