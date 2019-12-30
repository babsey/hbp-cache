export LC_ALL=C.UTF-8
export LANG=C.UTF-8

export FLASK_APP=hello.py
uwsgi --http 0.0.0.0:5000 --module hello:app
