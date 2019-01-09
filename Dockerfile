# Ref: https://medium.com/bitcraft/dockerizing-a-python-3-flask-app-line-by-line-400aef1ded3a

From ubuntu:18.10
LABEL maintainer = "xuning Shao <shaoxuning@corp.netease.com>"

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip nginx
RUN pip3 install uwsgi

COPY . ./app
WORKDIR ./app
RUN pip3 install -r requirements.txt
COPY ./nginx.conf /etc/nginx/sites-enabled/default

CMD service nginx start && uwsgi -s /tmp/uwsgi.sock --chmod-socket=666 --manage-script-name --mount /=app:app
