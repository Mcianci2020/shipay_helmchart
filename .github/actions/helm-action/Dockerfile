FROM alpine:3.10

ARG HELM_VERSION=

RUN apk update && apk upgrade
RUN apk add curl tar bash


RUN curl https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz --output helm-linux.tar.gz
RUN tar xvf helm-linux.tar.gz && \
	mv linux-amd64/helm /usr/local/bin/helm && \
	chmod +x /usr/local/bin/helm && \
	rm helm-linux.tar.gz && \
	rm -rf linux-amd64

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

