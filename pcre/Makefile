include ../Makefile.in

APP=pcre
PROGRAM=${APP}
VERSION=-8.37
PACKAGE=${PROGRAM}${VERSION}
CONFIG_OPTIONS=--host=${HOST} --prefix=${PREFIX}

all: build

init:
	$(call init_package,${PACKAGE})

reinit:
	$(call reinit_package,${PACKAGE})

build:
	$(call build_package,${PACKAGE})

config: init
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured
	
reconfig: init
	rm -f .configured
	[ -f .configured ] || (cd ${PACKAGE}; ./configure ${CONFIG_OPTIONS})
	echo "yes" > .configured
	
install:
	$(call install_package,${PACKAGE})

clean:
	$(call clean_package,${PACKAGE})

distclean: 
	$(call distclean_package,${PACKAGE})
