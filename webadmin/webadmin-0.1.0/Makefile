all: build

build: 
	make -C cgi

install:
	[ -d ${DESTDIR}/www ] || mkdir -p ${DESTDIR}/www
	cp -r www/* ${DESTDIR}/www
	make -C cgi DESTDIR=${DESTDIR}

