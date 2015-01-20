# inherit from the proprietary version
-include vendor/lge/p880/BoardConfigVendor.mk

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := x3

# Target arch settings
TARGET_NO_BOOTLOADER := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := $(TARGET_CPU_VARIANT)
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_GCC_VERSION_EXP := 4.8
TARGET_GCC_VERSION_KERNEL := 4.7
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin

# Optimization build flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 1.5GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13375635456 # 12.3GB
BOARD_CACHEIMAGE_PARTITION_SIZE := 422576128 # 403M
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_RECOVERY_PRE_COMMAND := "/system/bin/setup-recovery"

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/lge/x3
TARGET_KERNEL_CONFIG := cyanogenmod_x3_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB = device/lge/p880/rootdir/fstab.x3
RECOVERY_FSTAB_VERSION = 2
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_SPECIFIC_HEADER_PATH := device/lge/p880/include

BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_EGL_CFG := device/lge/p880/configs/egl.cfg
USE_OPENGL_RENDERER := true

MALLOC_IMPL := dlmalloc
BOARD_USES_LEGACY_MMAP := true
NEED_WORKAROUND_CORTEX_A9_745320 := true
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Lollipop
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS += -DREFBASE_JB_MR1_COMPAT_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_SET_POSITION_SYMBOL
TARGET_NEEDS_NON_PIE_SUPPORT := true
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Use file-based OTA zips
BLOCK_BASED_OTA := false

# Audio
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
TARGET_NO_ADAPTIVE_PLAYBACK := true

# Old blobs support
#COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_SET_POSITION_SYMBOL
#BOARD_EGL_NEEDS_LEGACY_FB := true # either this or SKIP_FIRST_DEQUEUE is needed (preferably the latter)
#BOARD_USE_MHEAP_SCREENSHOT := true
#BOARD_EGL_SKIP_FIRST_DEQUEUE := true
#BOARD_NEEDS_OLD_HWC_API := true
#BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Camera
BOARD_CAMERA_HAVE_ISO := true

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p880/bluetooth/vnd_bt.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p880/bluetooth

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.x3

COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS

# Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p880/ril/

BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p880/recovery/recovery-gfx.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lge/p880/recovery/recovery-keys.c

BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_BATTERY_DEVICE_NAME := battery

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true
DISABLE_DROIDDOC := true

# Bootanimaion
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# SELinux
ifeq ($(HAVE_SELINUX),true)

BOARD_SEPOLICY_DIRS += \
    device/lge/p880/sepolicies

BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts \
    property_contexts \
    service_contexts \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    init.te \
    init_shell.te \
    file.te \
    gpsd.te \
    keystore.te \
    lmkd.te \
    mediaserver.te \
    platform_app.te \
    recovery.te \
    rild.te \
    sensors_config.te \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    vold.te

endif

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

BOARD_HARDWARE_CLASS := device/lge/p880/cmhw/

# TWRP
DEVICE_RESOLUTION := 720x1280

RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_JB_CRYPTO := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_NO_SCREEN_BLANK := true
TW_MAX_BRIGHTESS := 255

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/tegra-udc.0/gadget/lun0/file"
TW_INCLUDE_FB2PNG := true
