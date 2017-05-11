FROM ubuntu:16.04
MAINTAINER  becivells <becivells@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && apt-get -y update && apt-get install -y  vim && mkdir /opt/sysbench
COPY tests /opt/sysbench/tests
COPY libmysqlclient.so.20  /usr/lib/x86_64-linux-gnu/libmysqlclient.so.20
COPY sysbench /bin/sysbench
RUN chmod 755  /bin/sysbench
ENTRYPOINT ["/bin/bash"]
