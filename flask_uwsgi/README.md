# python flask uwsgi nginx(tengine)
 python的flask web服务器
 可以从docker.io下 下载
 ```docker pull  becivells/flask_uwsgi_nginx```
 
 主程序以index.py作为入口
 运行
 ```docker run -d -p 80:80 -v /pythonweb目录/:/pyweb/  becivells/flask_uwsgi_nginx```