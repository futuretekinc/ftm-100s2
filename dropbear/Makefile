include ${TOPDIR}/Makefile.in

APP=dropbear
PROGRAM=dropbear
VERSION=-2015.68
PACKAGE=${PROGRAM}${VERSION}
CONFIG_OPTIONS= --host=${HOST} \
			--disable-zlib \
			--disable-largefile \
			--disable-loginfunc \
			--disable-shadow \
			--disable-utmp \
			--disable-utmpx \
			--disable-wtmp \
			--disable-wtmpx \
			--disable-pututline \
			--disable-pututxline \
			--disable-lastlog \
			--prefix=${PREFIX} \
			CC=${CC}
BUILD_OPTIONS=STATIC=1 SCPPROGRESS=0 PROGRAMS="dropbear dropbearkey scp dbclient"

START := $(shell ${TOOLSDIR}/search_code config/initd_${APP} "START")
STOP  := $(shell ${TOOLSDIR}/search_code config/initd_${APP} "STOP")

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

install:
	make -C ${PACKAGE} install DESTDIR=${DESTDIR}
	[ -d ${DESTDIR}${CONFIGDIR} ] || mkdir -p ${DESTDIR}${CONFIGDIR}
	install -m 644 config/etc/config/${APP} ${DESTDIR}${CONFIGDIR}/${APP}
	[ -d ${DESTDIR}${INITDDIR} ] || mkdir -p ${DESTDIR}${INITDDIR}
	install -m 755 config/etc/init.d/${APP} ${DESTDIR}${INITDDIR}/${APP}
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
