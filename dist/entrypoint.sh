#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

cd /opt/server
export FLASK_APP=hello.py
uwsgi --module hello:app --http-socket 0.0.0.0:5000 --daemonize "/tmp/hello.log"

cd /opt/ng-cache
python3 -m http.server
