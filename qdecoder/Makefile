include ../Makefile.in

export BUILD_OPTIONS=prefix=${DESTDIR}${PREFIX}

APP=qdecoder
VERSION=-12.0.4

all: configure build install

check:
	$(call check_package,${APP}${VERSION})

configure: check
	(cd ${APP}${VERSION}; ./configure CC=${CC} --host=${HOST} prefix=${DESTDIR}${PREFIX})

build: configure 
	$(call build_package,${APP}${VERSION})

install:
	$(call install_package,${APP}${VERSION})

clean:
	$(call clean_package,${APP}${VERSION})

distclean: clean
	$(call distclean_package,${APP}${VERSION})
