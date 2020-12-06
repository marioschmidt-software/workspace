FROM ubuntu AS desktop 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install --yes tasksel apt-utils language-pack-de
RUN tasksel install ubuntu-desktop ubuntu-desktop-default-languages

FROM desktop AS workspace
RUN curl -fsSLO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN curl -fsSLO https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN dpkg --install google-chrome-stable_*_*.deb chrome-remote-desktop_*_*.deb
RUN apt-get install --yes -f

CMD /usr/lib/systemd/systemd

RUN adduser --disabled-password --gecos '' ubuntu && adduser ubuntu sudo
RUN echo 'ubuntu:ubuntu' | chpasswd

USER ubuntu
WORKDIR /home/ubuntu
