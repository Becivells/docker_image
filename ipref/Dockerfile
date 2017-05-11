FROM ubuntu:16.04
MAINTAINER  becivells <becivells@gmail.com>

COPY libiperf.so.0 /usr/lib/libiperf.so.0
COPY iperf3 /usr/bin/iperf3
RUN chmod 755 /usr/bin/iperf3
ENTRYPOINT ["/usr/bin/iperf3"]
EXPOSE 5201
CMD [ "-s" ]

