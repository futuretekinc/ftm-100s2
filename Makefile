TARGET=${CURDIR}/_target
COMMON_APPS=base busybox openssl iptables zlib openssh libpcap tcpdump lua libubox uci gmp hotplug2 ntpclient dropbear pcre lighttpd net-snmp 
#COMMON_APPS=busybox openssl iptables zlib openssh libpcap tcpdump lua libubox uci gmp strongswan hotplug2 ntpclient dropbear pcre lighttpd webadmin net-snmp mosquitto node tpgw 

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
	if [ -d ${TARGET} ]; then \
		rm -rf ${TARGET}\* ;\
	else \
		mkdir -p ${TARGET} ;\
	fi

	for app in $(COMMON_APPS); do \
		cp -r $$app/_install/*  ${TARGET}/; \
	done
	tools/make_image ${TARGET} rootfs.img

#	if [ -d ${TARGET} ]; then \
#		rm -rf ${TARGET} ;\
#	fi

clean:
	for app in $(COMMON_APPS); do \
		make -C $$app clean; \
	done

distclean:
	for app in $(COMMON_APPS); do \
		make -C $$app distclean; \
	done

