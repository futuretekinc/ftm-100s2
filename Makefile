include .config

ROOT=${CURDIR}/_root

include Makefile.in

all: install_apps
	
phase1: build_libs

config_libs: 
	for app in $(LIBS); do \
		make -C $$app config; \
	done

config_apps: install_libs
	for app in $(APPS); do \
		make -C $$app config DESTDIR=${ROOT}; \
	done
	
build_libs:  config_libs
	for app in $(LIBS); do \
		make -C $$app; \
	done

build_apps:  config_apps
	for app in $(APPS); do \
		make -C $$app; \
	done

install_libs:
	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT}\* ;\
	else \
		mkdir -p ${ROOT} ;\
	fi
	for app in $(LIBS); do \
		make -C $$app install DESTDIR=${ROOT}; \
	done

install_apps: build_apps
	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT}\* ;\
	else \
		mkdir -p ${ROOT} ;\
	fi
	for app in $(APPS); do \
		make -C $$app install DESTDIR=${ROOT}; \
	done
	tools/make_image ${ROOT} rootfs.img

	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT} ;\
	fi

clean:
	for app in $(LIBS) $(APPS); do \
		make -C $$app clean; \
	done

distclean:
	for app in $(LIBS) $(APPS); do \
		make -C $$app distclean; \
	done

