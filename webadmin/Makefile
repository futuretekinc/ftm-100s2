include ${TOPDIR}/Makefile.in

APP=webadmin
PROGRAM=${APP}
VERSION=-0.1.0
PACKAGE=${PROGRAM}${VERSION}-${MODEL}

BUILD_OPTIONS=CC=${CC} QDECODER=${CURDIR}/../qdecoder/_install/usr

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
reconfig: init

build: config
	$(call build_package,${PACKAGE})

install:
	make -C ${PACKAGE} install DESTDIR=${DESTDIR}
	[ -d ${DESTDIR}/etc ] || mkdir -p ${DESTDIR}/etc
	install -m 644 config/webadmin.conf ${DESTDIR}/etc/webadmin.conf
	[ -d ${DESTDIR}/etc/config ] || mkdir -p ${DESTDIR}/etc/config
	install -m 664 config/config_webadmin ${DESTDIR}/etc/config/webadmin
	[ -d ${DESTDIR}/etc/init.d ] || mkdir -p ${DESTDIR}/etc/init.d
	install -m 755 config/initd_webadmin ${DESTDIR}/etc/init.d/webadmin
	[ -d ${DESTDIR}/etc/rc.d ] || mkdir -p ${DESTDIR}/etc/rc.d
	cd ${DESTDIR}/etc/rc.d; ln -s ../init.d/webadmin S50webadmin	

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
