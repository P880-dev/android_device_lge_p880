LOCAL_PATH := $(call my-dir)

########################
include $(CLEAR_VARS)

LOCAL_MODULE := spn-conf.xml

LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_TAGS := optional

# This will install the file in /system/etc
#
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

########################
include $(CLEAR_VARS)

LOCAL_MODULE := audio_effects.conf

LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_TAGS := optional

# This will install the file in /system/etc
#
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
