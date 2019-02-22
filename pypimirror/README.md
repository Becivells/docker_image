# pypimirror
搭建python的本地镜像源使用bandersnatch

搭建本地pypi源详情请见博客http://blog.csdn.net/becivells/article/details/53024201

从dockerhub上下载镜像   
docker pull becivells/pypimirror   
运行   
docker run -d -p 80:80 -v /主机要存放的目录:/opt/pypi/ pymirror   
使用方法因为http不被建议使用，我们也没有证书可以在home目录下创建.pip文件夹   

cat ~/.pip/pip.conf

[global]   
index-url = http://ip/simple   
extra-index-url=https://pypi.mirrors.ustc.edu.cn/simple   
[install]   
trusted-host = ip   

或者 pip install django -i http://ip/simple --trusted-host ip
