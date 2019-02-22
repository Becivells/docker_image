FROM alpine:latest
MAINTAINER  python <becivells@gmail.com> 
RUN apk update && apk add python && apk add py-pip
RUN pip install pip2pi pypiserver supervisor

RUN mkdir -p /opt/pypi
COPY supervisord.conf  /etc/supervisord.conf

EXPOSE 80
VOLUME ["/opt/pypi/"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

