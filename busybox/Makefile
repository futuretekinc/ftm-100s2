include ../Makefile.in

APP=busybox
PROGRAM=${APP}
VERSION=-1.23.2
PACKAGE=${PROGRAM}${VERSION}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	if [ ! -f .configured ] ; then \
		awk -v destdir=${DESTDIR} '{ if ($$1 ~ /CONFIG_PREFIX/) {split($$1,vals,"="); printf "%s=\"%s\"\n", vals[1], destdir} else {print $$0} }' ${CURDIR}/config/config.ftm-100s2 > ${PACKAGE}/.config; \
		make -C ${PACKAGE} oldconfig;\
	fi
	echo "yes" > .configured

reconfig: 
	rm -f .configured
	[ -f .configured ] || (cp config/config.ftm-100s2 ${PACKAGE}/.config; make -C ${PACKAGE} oldconfig)
	echo "yes" > .configured


build: config
	$(call build_package,${APP}${VERSION})

install:
	$(call install_package,${APP}${VERSION})
	chmod +s ${DESTDIR}/bin/busybox
	[ -d ${DESTDIR}/etc ] || mkdir -p ${DESTDIR}/etc
	install -m 644 config/busybox.conf ${DESTDIR}/etc

clean:
	$(call clean_package,${APP}${VERSION})

distclean: 
	$(call distclean_package,${APP}${VERSION})
