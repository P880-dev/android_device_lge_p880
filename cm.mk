# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/telephony.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := p880

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# This device has NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p880/p880.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := Optimus 4X HD
#PRODUCT_VERSION_DEVICE_SPECIFIC :=

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p880
PRODUCT_NAME := cm_p880
PRODUCT_BRAND := LG
PRODUCT_MODEL := LG-P880
PRODUCT_MANUFACTURER := LGE

# Enable Torch
PRODUCT_PACKAGES += Torch

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x3 BUILD_FINGERPRINT="lge/x3/p880:5.1/LMY47I/1148727:user/release-keys" PRIVATE_BUILD_DESC="x3-user 5.1 LMY47I 1148727 release-keys"
