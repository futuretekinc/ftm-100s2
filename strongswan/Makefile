include ${TOPDIR}/Makefile.in

APP=strongswan
PROGRAM=${APP}
VERSION=-5.3.3
PACKAGE=${PROGRAM}${VERSION}

GMPDIR=${CURDIR}/../gmp/_install/usr
CONFIG_OPTIONS=--host=${HOST} \
			--prefix=${PREFIX} \
			--sysconfdir=/etc \
			--with-lib-prefix=${GMPDIR} \
			CC=${CC} AR=${AR} RANLIB=${RANLIB}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ ! -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig: init
	rm -f .configured
	[ ! -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
