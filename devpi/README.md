## Devpi Dockerfile


pip install -i http://localhost:3141/root/pypi/ simplejson


[global]
index-url = http://ip:3141/root/pypi/+simple/

[search]
index = http://ip:3141/root/pypi/
[install]

trusted-host = ip
