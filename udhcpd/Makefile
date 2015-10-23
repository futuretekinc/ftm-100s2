include ${TOPDIR}/Makefile.in

APP=udhcpd
PROGRAM=
VERSION=
PACKAGE=

START := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "START")
STOP  := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "STOP")

all: build 

init: ;

reinit: ;

config: ;

reconfig: ;

build: ;

install: build
	[ -d ${DESTDIR}/etc/config ] || mkdir -p ${DESTDIR}/etc/config
	install -m 755 -t ${DESTDIR}/etc/config config/etc/config/${APP}
	[ -d ${DESTDIR}/etc/init.d ] || mkdir -p ${DESTDIR}/etc/init.d
	install -m 755 -t ${DESTDIR}/etc/init.d config/etc/init.d/${APP}
	[ -d ${DESTDIR}/etc/rc.d ] || mkdir -p ${DESTDIR}/etc/rc.d
ifneq ($(START),)
	(cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} S${START}${APP})
endif
ifneq ($(STOP),)
	(cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} K${STOP}${APP})
endif

clean: ;

distclean: ;
