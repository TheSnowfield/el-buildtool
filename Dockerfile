FROM ubuntu:24.04

RUN mkdir /home/el-toolchain && \
    cd /home/el-toolchain && \

    # fix commands missing
    apt-get update && \
    apt-get install -y wget && \

    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources && \
    
    # apt-get install -y software-properties-common && \
    # add-apt-repository 'https://dl.winehq.org/wine-builds/ubuntu/' && \

    # enable i386 architecture
    dpkg --add-architecture i386 && \

    # install winehq
    apt-get update && \
    apt-get install -y winehq-devel && \

    # configure locale to zhcn
    locale-gen zh_CN.UTF-8

ENV LANG=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8
    
COPY rootfs/el /home/el-toolchain
  
VOLUME ["/home/el-toolchain"]
