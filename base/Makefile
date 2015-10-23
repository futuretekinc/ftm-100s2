include ${TOPDIR}/Makefile.in

APP=base
PROGRAM=base
VERSION=-0.1.0
PACKAGE=${PROGRAM}${VERSION}-${BASE}

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})
	
config: ;

reconfig: ;

build: ;

install:
	[ -d ${DESTDIR} ] || mkdir -p ${DESTDIR}
	cp -r ${PACKAGE}/* ${DESTDIR}/

clean: ;

distclean: ;
