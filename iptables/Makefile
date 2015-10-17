include ../Makefile.in

APP=firewall
PROGRAM=iptables
VERSION=-1.4.21
PACKAGE=${PROGRAM}${VERSION}
CONFIG_OPTIONS=--host=${HOST} --prefix=${PREFIX} -disable-ipv6 CC=${CC}

START := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "START")
STOP  := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "STOP")

all: build 

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})
	
config: init
	[ -f .configured ] || (cd ${PACKAGE};./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig:
	rm -f .configured
	(cd ${PACKAGE};./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install: build
	$(call install_package,${PACKAGE})
	[ -d ${DESTDIR}${CONFIGDIR} ] || mkdir -p ${DESTDIR}${CONFIGDIR}
	install -m 644 config/config_${APP} ${DESTDIR}${CONFIGDIR}/${APP}
	[ -d ${DESTDIR}${INITDDIR} ] || mkdir -p ${DESTDIR}${INITDDIR}
	install -m 755 config/initd_${APP} ${DESTDIR}${INITDDIR}/${APP}
	[ -d ${DESTDIR}${RCDDIR} ] || mkdir -p ${DESTDIR}${RCDDIR}
ifneq ($(START),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} S${START}${APP})
endif
ifneq ($(STOP),)
	(cd ${DESTDIR}${RCDDIR}; ln -sf ${INITDDIR}/${APP} K${STOP}${APP})
endif

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
