FROM ubuntu:24.04

COPY rootfs /toolchain/
COPY entrypoint.sh /entrypoint.sh

ENV LC=zh_CN.UTF-8 \
    LANG=zh_CN.UTF-8 \
    WINEARCH=win32 \
    WINEPREFIX=/tmp/.wine

RUN cd /toolchain && ls && \

    # fix commands missing
    apt-get update && \
    apt-get install -y wget locales xvfb && \

    # enable i386 architecture
    dpkg --add-architecture i386 && \

    # install winehq
    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources && \
    apt-get update && \
    apt-get install -y wine-devel winetricks && \

    # configure locale to zhcn
    locale-gen zh_CN.UTF-8 && \

    # wine init
    wineboot && \
    winetricks winxp && \

    # clean
    apt-get clean

ENTRYPOINT ["/entrypoint.sh"]
