FROM debian
ENV HTTP_PROXY http://cache.univ-nantes.fr:3128
ENV HTTPS_PROXY http://cache.univ-nantes.fr:3128
ENV FTP_PROXY http://cache.univ-nantes.fr:3128
ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTPS_PROXY
ENV ftp_proxy=$FTP_PROXY 
RUN apt update && apt install -y git \
	subversion \
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
	kernel-package \
	libssl-dev

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc
RUN ln -s /usr/bin/ccache /usr/local/bin/g++
RUN ln -s /usr/bin/ccache /usr/local/bin/cc
RUN ln -s /usr/bin/ccache /usr/local/bin/cc++

COPY INSIDE/build-script.sh .
RUN chmod a+rx build-script.sh

ENTRYPOINT ["./build-script.sh"]
CMD ["4.1.y"]
