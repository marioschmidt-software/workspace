FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --yes systemd sudo
RUN adduser --disabled-password --gecos '' ubuntu
RUN echo 'ubuntu:ubuntu' | chpasswd
RUN adduser ubuntu sudo
CMD ["/usr/lib/systemd/systemd"]
