# docker image for iperf

## 使用iperf命令行工具进行局域网测速
https://iperf.fr/   
λ iperf3.exe -h   
Usage: iperf [-s|-c host] [options]   
       iperf [-h|--help] [-v|--version]   

Server or Client:   
  -p, --port      #         server port to listen on/connect to 服务器监听端口   
  -f, --format    [kmgKMG]  format to report: Kbits, Mbits, KBytes, MBytes   
  -i, --interval  #         seconds between periodic bandwidth reports   
  -F, --file name           xmit/recv the specified file   
  -B, --bind      <host>    bind to a specific interface   
  -V, --verbose             more detailed output  
  -J, --json                output in JSON format  
  --logfile f               send output to a log file  
  -d, --debug               emit debugging output  
  -v, --version             show version information and quit   
  -h, --help                show this message and quit   
Server specific:   
  -s, --server              run in server mode   
  -D, --daemon              run the server as a daemon   
  -I, --pidfile file        write PID file   
  -1, --one-off             handle one client connection then exit  
Client specific:   
  -c, --client    <host>    run in client mode, connecting to <host>   
  -u, --udp                 use UDP rather than TCP   
  -b, --bandwidth #[KMG][/#] target bandwidth in bits/sec (0 for unlimited)   
                            (default 1 Mbit/sec for UDP, unlimited for TCP)   
                            (optional slash and packet count for burst mode)   
  -t, --time      #         time in seconds to transmit for (default 10 secs)   
  -n, --bytes     #[KMG]    number of bytes to transmit (instead of -t)  
  -k, --blockcount #[KMG]   number of blocks (packets) to transmit (instead of -t or -n)   
  -l, --len       #[KMG]    length of buffer to read or write   
                            (default 128 KB for TCP, 8 KB for UDP)  
  --cport         <port>    bind to a specific client port (TCP and UDP, default: ephemeral port)   
  -P, --parallel  #         number of parallel client streams to run   
  -R, --reverse             run in reverse mode (server sends, client receives)   
  -w, --window    #[KMG]    set window size / socket buffer size   
  -M, --set-mss   #         set TCP/SCTP maximum segment size (MTU - 40 bytes)   
  -N, --no-delay            set TCP/SCTP no delay, disabling Nagle's Algorithm   
  -4, --version4            only use IPv4   
  -6, --version6            only use IPv6     
  -S, --tos N               set the IP 'type of service'   
  -Z, --zerocopy            use a 'zero copy' method of sending data   
  -O, --omit N              omit the first n seconds   
  -T, --title str           prefix every output line with this string   
  --get-server-output       get results from server   
  --udp-counters-64bit      use 64-bit counters in UDP test packets   
   
[KMG] indicates options that support a K/M/G suffix for kilo-, mega-, or giga-   

iperf3 homepage at: http://software.es.net/iperf/   
Report bugs to:     https://github.com/esnet/iperf   

服务器端   
iperf3 -s -p 端口默认是5201   
   
iperf3 -s -D -I file 后台运行   

客户端   
   
iperf3 -c ip -b 1000M （默认的udp 1Mbit/s TCP 没有限制因此网络状况不太好的情况下会测试不出来真实的值） -t 默认10S   
