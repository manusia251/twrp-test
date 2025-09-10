#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/X6512

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta_system \
    vbmeta_vendor \
    boot \
    system \
    product \
    system_ext \
    vendor
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X6512
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_KERNEL_TAGS_OFFSET := 0x07880000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := Infinix-X6512_defconfig
TARGET_KERNEL_SOURCE := kernel/infinix/Infinix-X6512

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := infinix_dynamic_partitions
BOARD_INFINIX_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_INFINIX_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
#TW_THEME := portrait_hdpi
#TW_EXTRA_LANGUAGES := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_INPUT_BLACKLIST := "hbtp_vm"
#TW_USE_TOOLBOX := true
#TW_INCLUDE_REPACKTOOLS := true

#
# --- OrangeFox Recovery Flags ---
#

# -- Variabel Wajib --
# Untuk penamaan file ZIP/IMG dan info di recovery
OF_MAINTAINER := "manusia251"
FOX_VERSION := "R11.1_1" # Kamu bisa ganti versinya, misal R12.1_2, dst.

# Menentukan lokasi file fstab recovery. Ini sangat penting!
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# -- Konfigurasi Khusus Device (A/B, AVB) --
# Karena devicemu A/B dan recovery-as-boot, flag ini PENTING
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := true

# Karena devicemu pakai AVB 2.0, flag ini direkomendasikan
OF_PATCH_AVB20 := true

# -- Fitur Tambahan --
# Fitur navigasi tombol (sudah kamu tambahkan, bagus!)
OF_USE_KEY_HANDLER := true

# Mengaktifkan fitur senter di recovery
OF_FLASHLIGHT_ENABLE := true

# Menghilangkan Navbar (jika perlu)
OF_ALLOW_DISABLE_NAVBAR := 0

# -- Tampilan (Opsional, tapi sangat membantu) --
# Sesuaikan dengan resolusi layar HP-mu. Infinix Smart 6 (X6512) resolusinya 720x1600.
OF_SCREEN_H := 1612
OF_SCREEN_W := 720
OF_STATUS_H := 80 # Tinggi status bar (bisa dicoba-coba)
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48

