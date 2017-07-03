FROM debian:stretch
MAINTAINER Yann Dupont <Yann.Dupont@univ-nantes.fr>

RUN apt update && apt dist-upgrade -y && apt install -y git \
	gcc \
	make  \
	ncurses-dev \
	autoconf \
	automake \
	flex \
	bison \
	texinfo \
	ccache \
	device-tree-compiler \
	bc \
	dpkg-dev \
	lsb-release \
	libssl-dev

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc
RUN ln -s /usr/bin/ccache /usr/local/bin/g++
RUN ln -s /usr/bin/ccache /usr/local/bin/cc
RUN ln -s /usr/bin/ccache /usr/local/bin/cc++

## Env when behind a proxy

ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV ftp_proxy $ftp_proxy
ENV socks_proxy $socks_proxy
ENV no_proxy $no_proxy

ENV HTTP_PROXY $HTTP_PROXY
ENV HTTPS_PROXY $HTTPS_PROXY
ENV FTP_PROXY $FTP_PROXY 
ENV SOCKS_PROXY $SOCKS_PROXY
ENV NO_PROXY $NO_PROXY

## for cross compilation

RUN apt install -y gcc-arm-none-eabi u-boot-tools


COPY INSIDE/*.sh ./
RUN chmod a+rx *.sh

ENTRYPOINT ["./build-script.sh"]
CMD ["linux-4.4.y"]
