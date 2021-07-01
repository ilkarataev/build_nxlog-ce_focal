ARG ubuntu_version='20.04'
FROM ubuntu:${ubuntu_version}
ENV DEBIAN_FRONTEND noninteractive
ARG ubuntu_codename='focal'

RUN apt-get update && \
    apt-get install -y \
        dpkg-dev \
        devscripts \
        build-essential \
        fakeroot \
        debhelper \
        libssl-dev \
        libpcre3-dev \
        zlib1g-dev \
        quilt \
        vim \
        curl \
        git \
        wget \
        libcap-dev \
        libapr1-dev libaprutil1-dev libssl-dev libcap2-bin libdbi-perl libdbi-dev libperl-dev libz-dev xmlto
RUN cd /root/ && \
    wget https://nxlog.co/system/files/products/files/348/nxlog-ce-2.10.2150.tar.gz && \
    tar -xzvf nxlog-ce-2.10.2150.tar.gz && \
    cd nxlog-ce-2.10.7
#install openssl
RUN git clone https://github.com/openssl/openssl && \
    ls -la && \
    cd openssl && \
    git branch my_openssl_102 OpenSSL_1_0_2 && \ 
    git checkout my_openssl_102 && \
    ./config --prefix=/usr/local --shared && \
    make && \
    make install 

RUN cd /root/nxlog-ce-2.10.7 && \
    ./configure && \
    make
    
RUN cd /root/nxlog-ce-2.10.7/packaging/debian && \
    cp changelog.skel changelog && \
    cp control.ubuntu-bionic control && \
    sed -i 's/libssl1.0-dev/libssl-dev/g' control && \
    ./make_debs.sh
