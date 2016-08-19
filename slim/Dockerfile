# This image is for light-weight applications.
FROM python:alpine

ENV revision 20160808.1435

WORKDIR /tmp

# Install essential packages for building extensions.
RUN apk update
RUN apk add gcc musl-dev linux-headers make libffi-dev openssl-dev

# Re-install PIP and install/upgrade dependencies.
ADD requirements.txt /tmp/
RUN pip install --upgrade --force-reinstall pip
RUN pip install --upgrade --force-reinstall -r requirements.txt

# Remove all temp data.
RUN rm -fr /tmp/*
