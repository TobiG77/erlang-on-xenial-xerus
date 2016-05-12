FROM ubuntu:xenial

MAINTAINER Tobias Gerschner <tobias.gerschner@gmail.com>

RUN apt-get update && apt-get upgrade -y  && apt-get install wget -y

RUN cd /tmp; wget http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.3-1~ubuntu~xenial_amd64.deb

RUN ( dpkg -i /tmp/esl-erlang_18.3-1~ubuntu~xenial_amd64.deb || apt-get --fix-broken install -y )

RUN dpkg --list |grep -q esl-erlang

CMD ["erl"]
