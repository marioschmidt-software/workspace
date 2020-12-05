FROM ubuntu AS ubuntu-desktop
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install --yes ubuntu-desktop
CMD ["/usr/lib/systemd/systemd"]

FROM ubuntu-desktop AS ubuntu-workspace
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN apt-get update \
 && apt-get install --yes xvfb xbase-clients python3-psutils \
 && dpkg -i chrome-remote-desktop_current_amd64.deb

RUN adduser --disabled-password --gecos '' ubuntu \
 && (echo 'ubuntu:ubuntu' | chpasswd) \
 && adduser ubuntu sudo
