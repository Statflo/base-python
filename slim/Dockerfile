# This image is for light-weight applications.
FROM python:alpine

ADD packages /tmp/

WORKDIR /tmp

ENV revision 20160405.1511

# Install essential packages for building extensions.
RUN apk update
RUN apk add gcc musl-dev linux-headers make

# Re-install PIP and install/upgrade dependencies.
RUN pip install --upgrade --force-reinstall pip
RUN pip install --upgrade --force-reinstall -r packages

# Remove all temp data.
RUN rm -fr /tmp/*
