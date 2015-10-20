include ../Makefile.in

APP=network
PROGRAM=
VERSION=
PACKAGE=

START := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "START")
STOP  := $(shell ${CURDIR}/../tools/search_code config/initd_${APP} "STOP")

all: ;

init: ;

reinit: ;

config: ;

reconfig: ;

build: ;
	
install:
	[ -d ${DESTDIR}/etc/config ] || mkdir -p ${DESTDIR}/etc/config; \
	if [ -f config/etc/config/${APP}-${MODEL} ]; then \
		install -m 644 config/etc/config/${APP}-${MODEL} ${DESTDIR}/etc/config/${APP};\
	elif [ -f config/etc/config/${APP} ]; then \
		install -m 644 config/etc/config/${APP} ${DESTDIR}/etc/config/${APP};\
	fi
	[ -d ${DESTDIR}/etc/defaults ] || mkdir -p ${DESTDIR}/etc/defaults
	if [ -f config/etc/defaults/${APP}-${MODEL} ]; then \
		install -m 644 config/etc/defaults/${APP}-${MODEL} ${DESTDIR}/etc/defaults/${APP};\
	elif [ -f config/etc/defaults/${APP} ]; then \
		install -m 644 config/etc/defaults/${APP} ${DESTDIR}/etc/defaults/${APP};\
	fi
	[ -d ${DESTDIR}/etc/init.d ] || mkdir -p ${DESTDIR}/etc/init.d
	install -m 755 -t ${DESTDIR}/etc/init.d config/etc/init.d/${APP} 
	[ -d ${DESTDIR}/etc/rc.d ] || mkdir -p ${DESTDIR}/etc/rc.d
	[ -n $(START) ] && (cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} S${START}${APP})
	[ -n $(STOP) ] && (cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} K${STOP}${APP})

clean: 
	$(call clean_package, ${PACKAGE})

distclean: 
	$(call distclean_package, ${PACKAGE})
