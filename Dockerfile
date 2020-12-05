FROM ubuntu AS ubuntu-desktop
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --yes --no-install-recommends systemd sudo vim ubuntu-desktop-minimal language-pack-de
CMD ["/usr/lib/systemd/systemd"]
RUN curl -sL https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb > chrome-remote-desktop_current_amd64.deb
RUN (dpkg -i chrome-remote-desktop_current_amd64.deb || apt-get install --yes -f)
RUN adduser --disabled-password --gecos '' ubuntu \
 && (echo 'ubuntu:ubuntu' | chpasswd) \
 && adduser ubuntu sudo
