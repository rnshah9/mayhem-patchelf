# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y automake
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y g++

ADD . /repo
WORKDIR /repo
RUN ./bootstrap.sh
RUN ./configure
RUN make -j8
