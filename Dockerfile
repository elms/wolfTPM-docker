FROM debian:bullseye-slim

RUN apt-get update -qq
RUN apt-get install -y -qq gcc make git autoconf libtool libssl-dev

RUN git clone --depth 1 https://github.com/wolfSSL/wolfSSL && \
        cd wolfSSL && \
        ./autogen.sh && \
        ./configure --enable-swtpm && \
        make install

RUN git clone --depth 1 https://github.com/wolfSSL/wolfTPM && \
        cd wolfTPM && \
        ./autogen.sh && \
        ./configure --enable-swtpm && \
        make install

RUN git clone --depth 1 https://github.com/kgoldman/ibmswtpm2.git && \
        cd ibmswtpm2/src/ && \
        make install
