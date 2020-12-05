FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --yes systemd sudo wget
RUN adduser --disabled-password --gecos '' ubuntu
RUN echo 'ubuntu:ubuntu' | chpasswd
RUN adduser ubuntu sudo
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN dpkg -i chrome-remote-desktop_current_amd64.deb || apt-get install -f
RUN DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AY0e-g6yEKy6DQVb2B980WUoMWEl94t-i4qpekD_RqnKhXAog0z2UqaCmUw_ppN1IXYqPA" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=311276
CMD ["/usr/lib/systemd/systemd"]
