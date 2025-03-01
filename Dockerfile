FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/Pigeoncoin/pigeoncoin/releases/download/v1.19.2.0/pigeon-ubuntu20-1.19.2.0.tar.gz
RUN tar zxvf pigeon-ubuntu20-1.19.2.0.tar.gz
RUN mv pigeon-build-1.19.2.0/* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/pigeond -printtoconsole
