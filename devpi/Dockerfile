FROM python:3
MAINTAINER becivells <becivells@gmail.com> 
RUN pip install devpi devpi-web
VOLUME /devpi
EXPOSE 3141
RUN mkdir -p /devpi
ADD run.sh /
CMD ["/bin/bash","/run.sh"]
