include ${TOPDIR}/Makefile.in

APP=openssh
PROGRAM=${APP}
VERSION=-7.1p1
PACKAGE=${PROGRAM}${VERSION}

SSLDIR=${BUILDDIR}/openssl/_install/usr
ZLIBDIR=${BUILDDIR}/zlib/_install/usr
CFLAGS="-I${BUILDDIR}/openssl/_install/usr/include"
LDFLAGS="-L${BUILDDIR}/openssl/_install/usr/lib"
LD=${CC}

CONFIG_OPTOINS=--host=${HOST} \
			--with-libs \
			--with-zlib=${ZLIBDIR} \
			--with-ssl-dir=${SSLDIR} \
			--disable-etc-default-login \
			--without-hardening \
			--without-stackprotect \
			CFLAGS=${CFLAGS} \
			LDFLAGS=${LDFLAGS} \
			LD=${CC}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig:
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured 

build:
	$(call build_package,${PACKAGE})

install:
	make -C ${PACKAGE} install-files DESTDIR=${DESTDIR} STRIP_OPT="--strip-program=${STRIP}"

clean:
	$(call clean_package,${PACKAGE})

distclean: c
	$(call distclean_package,${PACKAGE})
