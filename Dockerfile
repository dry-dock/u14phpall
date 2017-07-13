FROM drydock/u14all:{{%TAG%}}

ADD . /u14phpall

RUN /u14phpall/install.sh
