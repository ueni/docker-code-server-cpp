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
        cmake \
        gdb \
        gcc-7 g++-7 \
        valgrind \
        clang \
        cppcheck \
        nginx \
        vim \
        zip \
        wget \
        htop \
        graphviz \
        nmon \
        iputils-ping && \
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

USER ${PUID}:${PGID}
RUN INSTALL="code-server --extensions-dir /config/extensions --install-extension "; \
    ${INSTALL} ms-vscode.cpptools && \
    ${INSTALL} jbenden.c-cpp-flylint && \
    ${INSTALL} mhutchie.git-graph

VOLUME /var/run/docker.sock

# how to start: https://github.com/linuxserver/docker-code-server