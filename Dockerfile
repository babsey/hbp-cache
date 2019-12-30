FROM ubuntu:18.04
LABEL maintainer="Sebastian Spreizer <spreizer@web.de>"

RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install flask flask_cors uwsgi --upgrade

COPY ./dist ./opt
EXPOSE 5000 8000 8080

RUN chmod 755 /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
