#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from TWRP common config
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device
$(call inherit-product, device/infinix/X6512/device.mk)

# Device identifier
PRODUCT_DEVICE := X6512
PRODUCT_NAME := twrp_X6512
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6512
