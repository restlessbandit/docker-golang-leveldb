FROM golang:wheezy

MAINTAINER restlessbandit "devops@restlessbandit.com"

RUN apt-get update

RUN apt-get install -y git-core libsnappy-dev g++

RUN mkdir -p /home/dev

RUN git clone https://github.com/google/leveldb.git /home/dev/leveldb

WORKDIR /home/dev/leveldb

RUN make

RUN cp --preserve=links libleveldb.* /usr/local/lib

RUN cp -r include/leveldb /usr/local/include/

RUN ldconfig
