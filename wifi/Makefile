include ${TOPDIR}/Makefile.in

APP=wifi
PROGRAM=
VERSION=
PACKAGE=

START := $(shell ${TOOLSDIR}/search_code config/etc/init.d/${APP} "START")
STOP  := $(shell ${TOOLSDIR}/search_code config/etc/init.d/${APP} "STOP")

all: build 

init: ;

reinit: ;

config: ;

reconfig: ;

build: ;

install: build
	[ -d ${DESTDIR}/lib/wifi ] || mkdir -p ${DESTDIR}/lib/wifi
	install -m 755 -t ${DESTDIR}/lib/wifi config/lib/wifi/ar9880.sh
	install -m 755 -t ${DESTDIR}/lib/wifi config/lib/wifi/hostapd.sh
	install -m 755 -t ${DESTDIR}/lib/wifi config/lib/wifi/mac80211.sh
	[ -d ${DESTDIR}/rboot/wfo_atheros_11AC ] || mkdir -p ${DESTDIR}/rboot/wfo_atheros_11AC
	install -m 644 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ar9580_pe1.bin  
	install -m 644 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ar988x_pe0.bin
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ath_11ac_ap.sh
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ath_11ac_sta.sh
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ath_11n_ap.sh
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ath_dbdc_ap.sh
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/ath_fix_rate.sh
	install -m 755 -t ${DESTDIR}/rboot/wfo_atheros_11AC config/rboot/wfo_atheros_11AC/get_pci_dev.sh
	[ -d ${DESTDIR}/etc/config ] || mkdir -p ${DESTDIR}/etc/config
	install -m 644 -t ${DESTDIR}/etc/config config/etc/config/${APP}
	[ -d ${DESTDIR}/etc/init.d ] || mkdir -p ${DESTDIR}/etc/init.d
	install -m 755 -t ${DESTDIR}/etc/init.d config/etc/init.d/${APP}
	[ -d ${DESTDIR}/etc/rc.d ] || mkdir -p ${DESTDIR}/etc/rc.d
	[ -n $(START) ] && (cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} S${START}${APP})
	[ -n $(STOP) ] && (cd ${DESTDIR}/etc/rc.d; ln -sf ../init.d/${APP} K${STOP}${APP})

clean: ;

distclean: ;
