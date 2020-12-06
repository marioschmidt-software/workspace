FROM ubuntu AS server 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install --yes sudo systemd language-pack-de

CMD /usr/lib/systemd/systemd

RUN adduser --disabled-password --gecos 'Main user' ubuntu && adduser ubuntu sudo
RUN echo 'ubuntu:ubuntu' | chpasswd

USER ubuntu
WORKDIR /home/ubuntu
