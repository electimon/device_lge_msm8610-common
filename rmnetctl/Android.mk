
ifneq ($(filter w5 w3ds,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles)

endif