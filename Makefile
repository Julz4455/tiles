INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = ::11.2
THEOS_DEVICE_IP = 192.168.1.248
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Tiles

Tiles_FILES = Tweak.xm
ARCHS = arm64
Tiles_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
