FROM ueniueni/docker-code-server:latest

LABEL maintainer="ueniueni, ueni"

ENV VERSION=1.0.0.0

RUN \
    source /etc/lsb-release && \
    echo "**** install fcgi, nginx, gdb, gcc, valgrind in ubuntu $DISTRIB_CODENAME ****"; \
    apt-get update && \
    apt-get install -y \
        libfcgi-dev \
        make \
        gdb \
        gcc-7 g++-7 \
        valgrind \
        nginx && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 30 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 30 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 30 && \
    update-alternatives --install /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7 30 && \
    update-alternatives --install /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7 30 && \
    update-alternatives --install /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7 30

VOLUME /var/run/docker.sock

# how to start: https://github.com/linuxserver/docker-code-server