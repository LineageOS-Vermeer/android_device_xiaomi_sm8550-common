VERSION = 5
PATCHLEVEL = 15

headers_install:
	@mkdir -p $(O)/usr/include
	@rsync -mrq $(KERNEL_PREBUILT_DIR)/kernel-headers/* $(O)/usr/include

all:
	@true
