FROM ubuntu:24.04

COPY rootfs /toolchain/
COPY entrypoint.sh /entrypoint.sh
ENV TOOLCHAIN /toolchain

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
    apt-get install -y --install-recommends wine-devel winetricks && \

    # configure locale to zhcn
    locale-gen zh_CN.UTF-8 && \

    # wine init
    export LC=zh_CN.UTF-8 && \
    export LANG=zh_CN.UTF-8 && \
    export WINEARCH=win32 && \
    wineboot && \
    winetricks winxp

# test compile
RUN /toolchain/xvfb-ctl start && \
    /toolchain/compile /toolchain/el /toolchain/test/main.e && \
    /toolchain/xvfb-ctl stop

ENTRYPOINT ["/entrypoint.sh"]
