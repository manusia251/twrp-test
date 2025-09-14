#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from Infinix-X6512 device
$(call inherit-product, device/infinix/Infinix_X6512/device.mk)

PRODUCT_DEVICE := Infinix_X6512
PRODUCT_NAME := omni_Infinix_X6512
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6512
PRODUCT_MANUFACTURER := infinix

PRODUCT_GMS_CLIENTID_BASE := android-infinix

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_x6512_h6126-user 11 RP1A.200720.011 545435 release-keys"

BUILD_FINGERPRINT := Infinix/X6512-OP/Infinix-X6512:11/RP1A.200720.011/240220V535:user/release-keys
