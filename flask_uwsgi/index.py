#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2016-10-24 17:56:11
# @Author  : Wenzhi Lee (becivells@gmail.com)
# @Link    : http://blog.csdn.net/becivells
# @Version : V0.0.1

import datetime
import requests
from random import choice
from flask import request
from flask import Flask


app = Flask(__name__)
@app.route('/')
def index():
    return "This is a flask app for docker"

if __name__ == '__main__':
        app.run()