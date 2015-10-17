include ../Makefile.in

APP=net-snmp
PROGRAM=${APP}
VERSION=-5.7.3
PACKAGE=${PROGRAM}${VERSION}

CONFIG_OPTIONS= --host=${HOST} \
			--target=${HOST} \
			--with-defaults \
			--with-endianness=little \
			--disable-embedded-perl \
			--disable-manuals \
			--without-perl-modules \
			--with-default-snmp-version="2" \
			--with-sys-contact="@@no.where" \
			--with-sys-location="Unknown" \
			--with-logfile="/var/log/snmpd.log" \
			--with-persistent-directory="/var/net-snmp" \
			--prefix=${PREFIX} \
			--libdir=${PREFIX}/lib
INSTALL_OPTIONS=DESTDIR=${DESTDIR}

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

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: clean
	$(call distclean_package,${PACKAGE})
