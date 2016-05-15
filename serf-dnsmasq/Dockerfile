# Creates a base ubuntu image with serf and dnsmasq
FROM ubuntu:14.04

MAINTAINER KDF5000 <kdf5000@163.com>
RUN mv /etc/apt/sources.list /etc/apt/sources.list.old \
    && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && \
apt-get install -y unzip curl dnsmasq

# dnsmasq configuration
ADD dnsmasq/* /etc/

# install serf
COPY source/serf_0.7.0_linux_amd64.zip /root/serf.zip
RUN unzip /root/serf.zip -d /bin
#rm serf.zip

# configure serf
ENV SERF_CONFIG_DIR /etc/serf
ADD serf/* $SERF_CONFIG_DIR/
ADD handlers $SERF_CONFIG_DIR/handlers
RUN chmod +x  $SERF_CONFIG_DIR/event-router.sh $SERF_CONFIG_DIR/start-serf-agent.sh

