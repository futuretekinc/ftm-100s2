include ../Makefile.in


APP=mosquitto
PROGRAM=mosquitto
VERSION=-1.4.4
PACKAGE=${PROGRAM}${VERSION}

CFLAGS=-I${CURDIR}/../openssl/_install/usr/include
LDFLAGS=-L${CURDIR}/../openssl/_install/usr/lib -lcrypto -lssl
BUILD_OPTIONS=	WITH_TLS=no \
		WITH_SRV=no \
		WITH_UUID=no \
		prefix=${PREFIX} \
		CFLAGS=${CFLAGS} \
		LDFLAGS=${LDFLAGS} 
INSTALL_OPTIONS=DESTDIR=${DESTDIR}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init

reconfig: ;

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: clean
	$(call distclean_package,${PACKAGE})
