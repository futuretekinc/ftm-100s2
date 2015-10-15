include ../Makefile.in

build:
	[ -d ${DESTDIR} ] || mkdir -p ${DESTDIR}
	cp -r common/* ${DESTDIR}/

install:
	if [ -z ${DESTDIR} ]; then \
		echo "Destination directory is not defined"; \
		exit 1;\
	fi

	[ -d ${DESTDIR} ] || mkdir -p ${DESTDIR}
	cp -r common/* ${DESTDIR}/
