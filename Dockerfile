FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update &&\
    apt install -y software-properties-common &&\
    apt-add-repository --yes --update ppa:ansible/ansible &&\
    apt install -y ansible &&\
    apt install -y python3-pip &&\
    ansible-galaxy install geerlingguy.docker &&\
    ansible-galaxy install andrewrothstein.python &&\
    ansible-galaxy install rossmcdonald.influxdb &&\
    ansible-galaxy install cloudalchemy.grafana &&\
    ansible-galaxy install rossmcdonald.telegraf &&\
    ansible-galaxy install mrlesmithjr.influxdb &&\
    ansible-galaxy install dj-wasabi.telegraf &&\
    ansible-galaxy install geerlingguy.repo-epel


ADD requirements.txt /
RUN pip3 install -r requirements.txt

RUN mkdir /keys
RUN mkdir /keys/public/
RUN mkdir /keys/private/

COPY /data/ /data/

#RUN chmod 600 /keys/miclave
#RUN chmod 644 /keys/miclave.pub

COPY /web/ /web/
RUN python3 /web/manage.py makemigrations &&\
    python3 /web/manage.py migrate

ENTRYPOINT ["python3", "/web/manage.py"]
#CMD ["python3", "/web/manage.py", "runserver" ]