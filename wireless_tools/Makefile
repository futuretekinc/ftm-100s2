include ../Makefile.in

APP=wireless_tools
PROGRAM=${APP}
VERSION=.29
PACKAGE=${PROGRAM}${VERSION}

PREFIX=${DESTDIR}/usr

all: build 

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	
build: config
	make -C ${PACKAGE} CC=${CC} 

install:
	make -C ${PACKAGE} install PREFIX=${PREFIX}

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
