include ${TOPDIR}/Makefile.in

APP=zlib
PROGRAM=${APP}
VERSION=-1.2.8
PACKAGE=${PROGRAM}${VERSION}

CONFIG_OPTIONS=--prefix=${PREFIX}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTOINS})
	echo "yes" > .configured

reconfig: init
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTOINS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install: build
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
