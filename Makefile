export TOPDIR=${CURDIR}
export BUILDDIR=${TOPDIR}
export PACKAGEDIR=${TOPDIR}/packages
export TOOLSDIR=${TOPDIR}/tools
export DESTDIR=${TOPDIR}/_root

include Makefile.in

all: install_apps
	
config_libs: 
	for app in $(LIBS); do \
		make -C ${BUILDDIR}/$$app config DESTDIR=${DESTDIR}; \
	done

config_apps: install_libs
	for app in $(APPS); do \
		make -C ${BUILDDIR}/$$app config DESTDIR=${DESTDIR}; \
	done
	
build_libs:  config_libs
	for app in $(LIBS); do \
		make -C ${BUILDDIR}/$$app; \
	done

build_apps:  config_apps
	for app in $(APPS); do \
		make -C ${BUILDDIR}/$$app; \
	done

install_libs: build_libs
	if [ -d ${DESTDIR} ]; then \
		rm -rf ${DESTDIR}\* ;\
	else \
		mkdir -p ${DESTDIR} ;\
	fi
	for app in $(LIBS); do \
		make -C ${BUILDDIR}/$$app install DESTDIR=${DESTDIR}; \
	done

install_apps: build_apps
	if [ -d ${DESTDIR} ]; then \
		rm -rf ${DESTDIR}\* ;\
	else \
		mkdir -p ${DESTDIR} ;\
	fi
	for app in $(APPS); do \
		make -C ${BUILDDIR}/$$app install DESTDIR=${DESTDIR}; \
	done
	tools/make_image ${ROOT} rootfs.img

#	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT} ;\
	fi

clean:
	for app in $(LIBS) $(APPS); do \
		make -C ${BUILDDIR}/$$app clean; \
	done

distclean:
	for app in $(LIBS) $(APPS); do \
		make -C ${BUILDDIR}/$$app distclean; \
	done

