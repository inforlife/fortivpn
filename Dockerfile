FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y && \
    apt-get install -y openfortivpn