include ../Makefile.in

APP=network
PROGRAM=
VERSION=
PACKAGE=

CONFIG_START := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "START")
CONFIG_STOP  := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "STOP")

all: ;

init: ;

reinit: ;

config: ;

reconfig: ;

build: ;
	
install:
	[ -d ${DESTDIR}${CONFIGDIR} ] || mkdir -p ${DESTDIR}${CONFIGDIR}
	install -m 644 config/config_${APP} ${DESTDIR}${CONFIG_DIR}/${APP}
	[ -d ${DESTDIR}${INITDDIR} ] || mkdir -p ${DESTDIR}/etc/init.d
	install -m 755 config/initd_${APP} ${DESTDIR}${INITDDIR}/${APP}
	[ -d ${DESTDIR}${RCDDIR} ] || mkdir -p ${DESTDIR}${RCDDIR}
	[ -n $(CONFIG_START) ] && (cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} S${CONFIG_START}${APP})
	[ -n $(CONFIG_STOP) ] && (cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} K${CONFIG_STOP}${APP})

clean: 
	$(call clean_package, ${PACKAGE})

distclean: 
	$(call distclean_package, ${PACKAGE})
