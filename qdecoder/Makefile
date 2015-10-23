include ${TOPDIR}/Makefile.in


APP=qdecoder
PROGRAM=${APP}
VERSION=-12.0.4
PACKAGE=${PROGRAM}${VERSION}

CONFIG_OPTIONS=CC=${CC} --host=${HOST} prefix=${DESTDIR}${PREFIX}
BUILD_OPTIONS=prefix=${DESTDIR}${PREFIX}

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

install: build
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
