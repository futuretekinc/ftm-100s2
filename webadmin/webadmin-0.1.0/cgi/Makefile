
SUBDIR=modem req upload

all:build

build: 
	for SUB in ${SUBDIR}; do \
		make -C $$SUB build;\
	done

install:
	for SUB in ${SUBDIR}; do \
		make -C $$SUB install DESTDIR=${DESTDIR};\
	done

