## Devpi Dockerfile

使用
pip install -i http://localhost:3141/root/pypi/ simplejson

或者写到pip.conf文件中   

```
[global] 
index-url = http://ip:3141/root/pypi/+simple/

[search]
index = http://ip:3141/root/pypi/  

[install]
trusted-host = ip
```
