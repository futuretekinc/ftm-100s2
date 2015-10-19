include ../Makefile.in

APP=wifi
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
	install -m 755 config/initd_${APP} ${DESTDIR}${INITDDIR}/${APP}
	[ -d ${DESTDIR}${RCDDIR} ] || mkdir -p ${DESTDIR}${RCDDIR}
ifneq ($(START),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} S${START}${APP})
endif
ifneq ($(STOP),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} K${STOP}${APP})
endif

clean: ;

distclean: ;
