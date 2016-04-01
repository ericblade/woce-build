# Build qt5

LEVEL=../../..

include $(LEVEL)/Makefile.common

# Intentionally not making this rebuild for different
# CONFIG, until that's something we need.
# (qt4 takes a long time to configure+build!)
.PHONY: build unpack patch
build:: build/armv7/.built
unpack:: build/.unpacked

$(call DL,QT5)

build/.unpacked: $(QT5_DL) 
	-rm -rf build
	mkdir -p build/src
	$(call EXTRACT,QT5,build/src,--strip=1)
#	zcat $(QT4_PATCH_DL)| patch -Np1 -d build/src
#	patch -Np2 -d build/src < qt4.patch
#	cp qconfig-palm.h build/src/src/corelib/global/
	touch $@

build/armv7/.built: build/.unpacked
	-rm -rf build/armv7
	mkdir -p build/armv7
	@echo "Copying in webos mkspec ... "
	cp -r webos-armv7 build/src/qtbase/mkspecs
	+cd build/armv7 && \
		$(CCENV) \
		`readlink -f ../src`/configure \
		--prefix=$(STAGING_DIR)/usr \
		-opensource \
		-no-cups -no-nis -no-openssl \
		-no-accessibility \
		-no-xinput2 \
		-no-xcb \
		-no-gtkstyle \
		-no-dbus \
		-opengl es2 \
		-xplatform webos-armv7 \
		-confirm-license 
	$(CCENV) $(MAKE) -C build/armv7 
	$(CCENV) $(MAKE) -C build/armv7 install
	touch $@

