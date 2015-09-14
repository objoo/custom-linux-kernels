FROM debian
RUN apt update && apt install -y git \
	subversion \
	gcc \
	make  \
	ncurses-dev \
	autoconf \
	automake \
	gcc-arm-none-eabi \
	flex \
	bison \
	texinfo \
	ccache \
	device-tree-compiler
RUN apt update && apt install -y bc \
	curl \
	u-boot-tools

COPY INSIDE/inside-script-latest-lts.sh .
COPY INSIDE/inside-script-latest-mainline.sh .
RUN chmod a+rx inside-script-latest-lts.sh
RUN chmod a+rx inside-script-latest-mainline.sh

ENTRYPOINT ./inside-script-latest-lts.sh
