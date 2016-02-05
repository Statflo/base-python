FROM python:alpine

ADD packages /tmp/

WORKDIR /tmp

# Install essential packages for building extensions.
RUN apk update
RUN apk add gcc musl-dev linux-headers

# Re-install PIP and install/upgrade dependencies.
RUN pip install --upgrade --force-reinstall pip
RUN pip install --upgrade --force-reinstall -r packages
RUN pip install pandas
# RUN pip3 install --egg mysql-connector-python-rf==2.1.3

# Reduce the disk usage.
# RUN apt-get remove -y manpages
# RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

# Remove all C/C++ libraries. (Serious testing required)
#RUN apt-get remove -y gcc gcc-4.9 g++ g++-4.9 python3-dev libmysqlclient-dev libmysqld-dev

# Remove all temp data.
RUN rm -fr /tmp/*
