include ../Makefile.in

APP=tcpdump
PROGRAM=${APP}
VERSION=-4.7.4
PACKAGE=${PROGRAM}${VERSION}

CONFIG_OPTIONS=--host=${HOST} \
			--disable-ipv6 \
			--with-crypto=no\
			ac_cv_linux_vers=2 \
			--prefix=${PREFIX} \
			CFLAGS="-I${CURDIR}/../libpcap/_install/usr/include" \
			LDFLAGS="-L${CURDIR}/../libpcap/_install/usr/lib" \
			CC=${CC} \
			AR=${AR} 
all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig: init
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
