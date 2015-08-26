FROM gliderlabs/alpine:3.2
RUN apk --update add bash
RUN apk add git subversion
RUN apk add gcc make 
RUN apk add ncurses-dev
RUN apk add autoconf automake
#RUN git clone https://github.com/gcc-mirror/gcc.git
RUN git clone git://github.com/gcc-mirror/gcc.git
RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
RUN git clone git://git.denx.de/u-boot.git
RUN apk add musl-dev
RUN apk add gmp-dev mpfr-dev mpc1-dev
RUN git clone git://sourceware.org/git/binutils-gdb.git
RUN apk add flex
RUN apk add ccache
WORKDIR binutils-gdb
RUN ./configure --prefix=/opt/cross-armhf --target=arm-linux-gnueabihf
RUN apk add texinfo
RUN apk add bison
RUN make -j3
RUN make install
WORKDIR ../gcc
RUN apk add g++
RUN ./configure --prefix=/opt/cross-gcc --target=arm-linux-gnueabihf --enable-languages=c,c++ --with-arch=armv7-a --with-fpu=vfpv3-d16 --with-float=hard --with-mode=thumb
RUN make -j3 ; make install
ENTRYPOINT ["bash"]