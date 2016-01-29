FROM debian:latest

ADD packages /tmp/

WORKDIR /tmp

# Install essential DEB packages for building extensions.
RUN apt-get update
RUN apt-get install -y \
    python3-minimal \
    python3-dev \
    python3-pip \
    libmysqlclient-dev \
    libmysqld-dev

# Generate symlinks
RUN ln -s `which python3` /usr/bin/python
RUN ln -s `which pip3` /usr/bin/pip

# Re-install PIP and install/upgrade dependencies.
RUN pip install --upgrade --force-reinstall pip
RUN pip install --upgrade --force-reinstall -r packages

# Reduce the disk usage.
RUN apt-get remove -y manpages
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y

# Remove all C/C++ libraries. (Serious testing required)
#RUN apt-get remove -y gcc gcc-4.9 g++ g++-4.9 python3-dev libmysqlclient-dev libmysqld-dev

# Remove all temp data.
RUN rm -fr /tmp/*
