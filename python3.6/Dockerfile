# Base Python Image with the Alpha Version of Python (python-dev).
FROM debian:latest

ADD packages /tmp/

# Install essential DEB packages for building extensions.
RUN apt-get update

# Compile and install Python (Development Version)
RUN apt-get install -y mercurial \
    make \
    gcc \
    g++ \
    build-essential \
    libssl-dev \
    libc6 \
    liblzma-dev \
    libmpdec-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libbz2-dev \
    libncurses5-dev \
    libmysqlclient-dev
RUN hg clone https://hg.python.org/cpython /opt/cpython
WORKDIR /opt/cpython
RUN ./configure && make -j2 && make install

RUN apt-get remove -y python

# Ensure the working directory for the rest of the setup.
WORKDIR /tmp

# Re-install PIP and install/upgrade dependencies.
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
RUN rm -rf /opt/cpython
