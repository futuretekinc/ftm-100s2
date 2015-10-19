include ../Makefile.in

APP=node
PROGRAM=${APP}
VERSION=-0.10.28
PACKAGE=${PROGRAM}${VERSION}

all: build 

init: ;

reinit: ;

config: ;

reconfig: ;

build: ;

install:
	[ -d ${DESTDIR}/usr ] || mkdir -p ${DESTDIR}/usr
	cp -r ${PACKAGE}/* ${DESTDIR}/usr/

clean:
	$(call clean_package, ${PACKAGE})

distclean: 
	$(call distclean_package, ${PACKAGE})
