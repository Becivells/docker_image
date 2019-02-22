# pypiserver
pypiserver docker镜像
一个python项目开发的过程中肯定要需要特定的python包这样的一个工具可以把特定的python模块源搭建起来供内部使用而且特别快

具体可以看我的博客http://blog.csdn.net/becivells/article/details/53028214

把镜像拉下来
docker pull becivells/pypiserver
运行
docker run -d -p 80:80 -v /docker/pypi/:/opt/pypi/ pypiserver

如何添加模块请看我的博客

使用方法因为http不被建议使用，我们也没有证书可以在home目录下创建.pip文件夹

cat ~/.pip/pip.conf

[global]   
index-url = http://ip/simple   
extra-index-url=https://pypi.mirrors.ustc.edu.cn/simple   
[install]   
trusted-host = ip   


或者
pip install django -i http://ip/simple --trusted-host ip
