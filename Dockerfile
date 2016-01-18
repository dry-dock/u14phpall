FROM drydock/u14all:prod

ADD . /u14phpall

RUN /u14phpall/install.sh
