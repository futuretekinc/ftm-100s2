include ../Makefile.in

APP=libubox
PROGRAM=${APP}
VERSION=
PACKAGE=${PROGRAM}${VERSION}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; cmake -D CMAKE_C_COMPILER=${CC} -D CMAKE_INSTALL_PREFIX:PATH=${PREFIX} .)
	echo "yes" > .configured

reconfig:
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; cmake -D CMAKE_C_COMPILER=${CC} -D CMAKE_INSTALL_PREFIX:PATH=${PREFIX} .)
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
