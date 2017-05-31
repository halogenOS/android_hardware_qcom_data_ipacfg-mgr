BOARD_PLATFORM_LIST := test
#ifeq ($(call is-board-platform-in-list,$(BOARD_PLATFORM_LIST)),true)
ifneq (,$(filter $(QCOM_BOARD_PLATFORMS),$(TARGET_BOARD_PLATFORM)))
ifneq (, $(filter aarch64 arm arm64, $(TARGET_ARCH)))

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)
ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif

LOCAL_SRC_FILES := ipa_nat_drv.c \
                   ipa_nat_drvi.c


LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64
LOCAL_CFLAGS := -DDEBUG
LOCAL_MODULE := libipanat
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_CLANG := true
include $(BUILD_SHARED_LIBRARY)

endif # $(TARGET_ARCH)
endif
#endif
