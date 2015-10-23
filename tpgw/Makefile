include ${TOPDIR}/Makefile.in

APP=tpgw
PROGRAM=${APP}
VERSION=-2015.06.22
PACKAGE=${PROGRAM}${VERSION}

START := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "START")
STOP  := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "STOP")

all: build 

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init

reconfig: init

build: config

install: build
	[ -d ${DESTDIR}/opt ] || mkdir -p ${DESTDIR}/opt
	cp -r ${PACKAGE}/* ${DESTDIR}/opt/
	[ -d ${DESTDIR}${INITDDIR} ] || mkdir -p ${DESTDIR}${INITDDIR}
	install -m 755 config/initd_${APP} ${DESTDIR}${INITDDIR}/${APP}
	[ -d ${DESTDIR}${RCDDIR} ] || mkdir -p ${DESTDIR}${RCDDIR}
ifneq ($(START),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} S${START}${APP})
endif
ifneq ($(STOP),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} K${STOP}${APP})
endif

clean: ;

distclean: 
	$(call distclean_package,${PACKAGE})
