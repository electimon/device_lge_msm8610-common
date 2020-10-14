
ifneq ($(filter w5 w3ds w55ds w5c,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles)

endif
