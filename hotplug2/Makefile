include ${TOPDIR}/Makefile.in

APP=hotplug2
PROGRAM=hotplug2
VERSION=-1.0
PACKAGE=${PROGRAM}${VERSION}

INSTALL_OPTIONS=DESTDIR=${DESTDIR}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})
	cp -r config/* ${DESTDIR}/

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
