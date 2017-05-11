# sysbench docker images

运行docker run -i -t -v /tmp/log/:/log/ sysbench


### 1. cpu性能测试
sysbench --test=cpu --cpu-max-prime=20000 run
cpu测试主要是进行素数的加法运算，在上面的例子中，指定了最大的素数为 20000，自己可以根据机器cpu的性能来适当调整数值。

### 2. 线程测试

sysbench --test=threads --num-threads=64 --thread-yields=100 --thread-locks=2 run
### 3. 磁盘IO性能测试
查看帮助
sysbench --test=fileio help
sysbench --test=fileio --num-threads=16 --file-total-size=3G --file-test-mode=rndrw prepare
sysbench --test=fileio --num-threads=16 --file-total-size=3G --file-test-mode=rndrw run
sysbench --test=fileio --num-threads=16 --file-total-size=3G --file-test-mode=rndrw cleanup
上述参数指定了最大创建16个线程，创建的文件总大小为3G，文件读写模式为随机读。

### 4. 内存测试

sysbench --test=memory --memory-block-size=8k --memory-total-size=4G run
上述参数指定了本次测试整个过程是在内存中传输 4G 的数据量，每个 block 大小为 8K。

### 5. MySQL数据库测试
sysbench --db-driver=mysql  --mysql-host=192.168.10.206 --mysql-db=dbtest --mysql-port=3306 --mysql-user=root --mysql-password=password   --test=oltp.lua --oltp_tables_count=20 --oltp-table-size=1000000 --rand-init=on prepare


sysbench --db-driver=mysql  --mysql-host=192.168.10.207 --mysql-db=dbtest --mysql-port=3306 --mysql-user=root --mysql-password=password   --test=oltp.lua --oltp_tables_count=20 --oltp-table-size=1000000 --oltp-read-only=off   --num-threads=20 --report-interval=10 --rand-type=uniform --max-time=3600  --percentile=99 run >> /log/sysbench_oltpX_8_`date +'%Y%m%d_%H:%M:%S'`.log



### 附录:磁盘测试
sysbench --test=fileio help

--file-num 生成测试文件的数量，默认是128

--file-block-size 测试期间文件块的大小，如果你想磁盘针对InnoDB存储引擎进行测试， 可以将其设置为16384，即InnoDB存储引擎的大小，默认是16384

--file-total-size 每个文件的大小，默认是2GB

--file-test-mode   文件测试模式，包含seqwr（顺序写）、seqrewr（顺序读写）、seqrd（顺序读）、rndrd（随即读）、rndwr（随机写）、rndrw（随机读写）

--file-io-mode   文件操作模式，同步还是异步，默认是同步

--file-fsync-all 每执行完一次写操作，就执行一次fsync，默认是off

sysbench的fileio测试需要经过prepare、run、clean三个阶段，prepare是准备阶段，生成我们需要的测试文件，run是实际测试阶段，cleanup是清理测试产生的文件，

--prepare
sysbench --test=fileio --file-num=16 --file-total-size=2G prepare 生成16个测试文件，总大小为2G

sysbench --test=fileio --file-total-size=20G --file-test-mode=rndrd --max-time=300 --max-requests=1000000000 --num-threads=16 --init-rng=on --file-num=16 --file-extra-flags=direct --file-fsync-freq=0 --file-block-size=16384 run

上述测试的最大随机读取请求时1000 000 000次，如果在300秒内不能完成，测试即结束
