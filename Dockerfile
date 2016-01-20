FROM python:3.3

ADD packages /tmp/

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    mysql-client-5.5 \
    pv

RUN pip3 install -r packages --allow-external mysql-connector-python-rf

RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

RUN rm -fr /tmp/*
