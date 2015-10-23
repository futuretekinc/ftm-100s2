include ${TOPDIR}/Makefile.in

APP=lighttpd
VERSION=-1.4.37
PCREDIR=../pcre
PCREDESTDIR=${PCREDIR}/_install
CONFIG_OPTIONS=--host=${HOST} \
			--prefix=${PREFIX} \
			--enable-shared \
			--without-mysql \
			--without-zlib \
			--without-bzip2 \
			--disable-ipv6 \
			PCRECONFIG=${CURDIR}/${PCREDESTDIR}/usr/bin/pcre-config \
			PCRE_LIB=${CURDIR}/${PCREDESTDIR}/usr/lib/libpcre.a \
			LIBS=-L${CURDIR}/${PCREDESTDIR}/usr/lib \
			CFLAGS="-DHAVE_PCRE_H=1 -DHAVE_LIBPCRE=1 -I${CURDIR}/${PCREDESTDIR}/usr/include"

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init 
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTOINS})
	echo "yes" > .configured; \

reconfig: 
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTOINS})
	echo "yes" > .configured; \

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})
	cp -r ${CURDIR}/config/* ${DESTDIR}/

clean:
	$(call clean_package,${PACKAGE})

distclean: clean
	$(call distclean_package,${PACKAGE})
