include ${TOPDIR}/Makefile.in

APP=libpcap
PROGRAM=${APP}
VERSION=-1.7.4
PACKAGE=${PROGRAM}${VERSION}
CONFIG_OPTIONS=	--host=${HOST} \
				--with-pcap=linux \
				ac_cv_linux_vers=2 \
				--prefix=${PREFIX} \
				CC=${CC} \
				AR=${AR}

all: build 

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

reconfig:
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install: build
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
