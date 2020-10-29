FROM alpine:latest
LABEL "name"="git-crypt unlock"
LABEL "maintainer"="Sean OMeara <sean@sean.io>"

RUN apt-get -qq update
RUN apt-get -qq install git-crypt
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

