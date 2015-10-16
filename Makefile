TARGET=ftm-100s
ROOT=${CURDIR}/_root
COMMON_APPS=base busybox openssl iptables zlib openssh libpcap tcpdump lua libubox uci gmp strongswan hotplug2 ntpclient dropbear pcre lighttpd qdecoder webadmin net-snmp mosquitto node tpgw 

include Makefile.in

all: build
	

configure: 
	for app in $(COMMON_APPS); do \
		make -C $$app configure; \
	done
	
build:  configure
	for app in $(COMMON_APPS); do \
		make -C $$app; \
	done

target: 
	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT}\* ;\
	else \
		mkdir -p ${ROOT} ;\
	fi

	for app in $(COMMON_APPS); do \
		cp -r $$app/_install/*  ${ROOT}/; \
	done
	tools/make_image ${ROOT} rootfs.img

	if [ -d ${ROOT} ]; then \
		rm -rf ${ROOT} ;\
	fi

clean:
	for app in $(COMMON_APPS); do \
		make -C $$app clean; \
	done

distclean:
	for app in $(COMMON_APPS); do \
		make -C $$app distclean; \
	done

