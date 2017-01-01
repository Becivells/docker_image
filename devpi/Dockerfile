FROM python:3
RUN pip install devpi devpi-web
VOLUME /mnt
EXPOSE 3141
RUN mkdir /devpi
ADD run.sh /
CMD ["/bin/bash","/run.sh"]
