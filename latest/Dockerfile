FROM python:latest

ADD packages /tmp/

WORKDIR /tmp

# Install essential DEB packages for building extensions.
RUN apt-get update
RUN apt-get install -y \
    libmysqlclient-dev

# Re-install PIP and install/upgrade dependencies.
RUN pip3 install --upgrade --force-reinstall pip
RUN pip3 install --upgrade --force-reinstall -r packages
RUN pip3 install pandas
RUN pip3 install --egg mysql-connector-python-rf==2.1.3

# Reduce the disk usage.
RUN apt-get remove -y manpages
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

# Remove all C/C++ libraries. (Serious testing required)
#RUN apt-get remove -y gcc gcc-4.9 g++ g++-4.9 python3-dev libmysqlclient-dev libmysqld-dev

# Remove all temp data.
RUN rm -fr /tmp/*
