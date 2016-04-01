# cross-compile variables
# little more hard-coded to armv7 than I'd like, but oh well.

STAGING_DIR = $(shell readlink -m $(LEVEL)/staging/armv7)
TCDIR = $(shell readlink -m $(LEVEL)/toolchain/arm-2009q1)
TCTOOLPREFIX = $(TCDIR)/bin/arm-none-linux-gnueabi-

# Used for building WebKit. This could be determined at runtime, but WebKit is a HOG!
PROCCOUNT := 2

# TODO: Move ISIS_ENV into here.

CCENV := PATH=$(TCDIR)/bin:$(PATH)
CCENV += PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig/
#CCENV += LIBRARY_PATH=/home/vagrant/woce-build/toolchain/arm-2009q1/arm-none-linux-gnueabi/libc/usr/lib:$LIBRARY_PATH
#CCENV += LIBRARY_PATH=/usr/lib/i386-linux-gnu/:$LIBRARY_PATH
CCENV += STAGING_LIBDIR=$(STAGING_DIR)/usr/lib
CCENV += STAGING_INCDIR=$(STAGING_DIR)/usr/include
CCENV += CC_TMP=$(TCTOOLPREFIX)gcc
CCENV += CXX_TMP=$(TCTOOLPREFIX)g++
CCENV += AR_TMP=$(TCTOOLPREFIX)ar
CCENV += OBJCOPY_TMP=$(TCTOOLPREFIX)objcopy
CCENV += STRIP_TMP=$(TCTOOLPREFIX)strip
CCENV += CFLAGS_TMP="-O2 -marm -march=armv7-a -ftree-vectorize -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a8 --sysroot=$(STAGING_DIR)/../../toolchain/arm-2009q1/arm-none-linux-gnueabi/libc/"
CCENV += CXXFLAGS_TMP="-O2 -marm -march=armv7-a -ftree-vectorize -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a8 --sysroot=$(STAGING_DIR)/../../toolchain/arm-2009q1/arm-none-linux-gnueabi/libc/"
CCENV += LDFLAGS_TMP="--sysroot=$(STAGING_DIR)/../../toolchain/arm-2009q1/arm-none-linux-gnueabi/libc/"

ifdef MACHINE
	CCENV += MACHINE=$(MACHINE)
else
	CCENV += MACHINE=topaz
endif
