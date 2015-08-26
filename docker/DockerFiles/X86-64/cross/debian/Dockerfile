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
	curl

COPY inside-script.sh .
RUN chmod a+rx /inside-script.sh
ENTRYPOINT /bin/bash
CMD ./inside-script.sh
