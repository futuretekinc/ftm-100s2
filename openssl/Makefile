include ${TOPDIR}/Makefile.in

APP=openssl
PROGRAM=${APP}
VERSION=-1.0.2d
PACKAGE=${PROGRAM}${VERSION}

CONFIG_OPTIONS= --prefix=${PREFIX} shared linux-cortina
BUILD_OPTIONS=AR="${AR} r"
INSTALL_OPTIONS=INSTALL_PREFIX=${DESTDIR}


all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./Configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig:
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./Configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: clean
	$(call distclean_package,${PACKAGE})
