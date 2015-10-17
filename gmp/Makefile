include ../Makefile.in

APP=gmp
PROGRAM=gmp
VERSION=-6.0.0
PACKAGE=${PROGRAM}${VERSION}
CONFIG_OPTIONS=--host=${HOST} --prefix=${PREFIX} CC=${CC} AR=${AR}

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
	(cd ${PACKAGE};./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured

build: config
	$(call build_package,${PACKAGE})

install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
