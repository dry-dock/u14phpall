FROM drydock/u14all:master

ADD . /u14phpall

RUN /u14phpall/install.sh
