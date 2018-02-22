FROM drydock/u14all:master

ADD . /u14phpall

RUN /u14phpall/install.sh

ENV BASH_ENV "/etc/drydock/.env"
