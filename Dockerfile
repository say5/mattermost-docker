FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget netcat
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /mattermost/data

RUN wget https://github.com/mattermost/platform/releases/download/v1.2.1/mattermost.tar.gz \
    && tar -xvzf mattermost.tar.gz && rm mattermost.tar.gz

COPY config.docker.json /

EXPOSE 80

WORKDIR /mattermost/bin
ENTRYPOINT ./platform -config /config.docker.json
