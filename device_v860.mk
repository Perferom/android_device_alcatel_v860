# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit products
$(call inherit-product, device/alcatel/bcm21553-common/common.mk)
$(call inherit-product, vendor/alcatel/v860/vendor_blobs.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# This is where we'd set a backup provider if we had one
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS += device/alcatel/v860/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

## MDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

## Inherit overlays
$(call inherit-product, device/mdpi-common/mdpi.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := v860
PRODUCT_DEVICE := v860
PRODUCT_MODEL := SmartII

# Torch
PRODUCT_PACKAGES += \
    Torch

# Kernel modules
PRODUCT_COPY_FILES += \
    device/alcatel/v860/prebuilt/root/fsr.ko:root/fsr.ko \
    device/alcatel/v860/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
    device/alcatel/v860/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
    device/alcatel/v860/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
    device/alcatel/v860/prebuilt/root/j4fs.ko:root/j4fs.ko \
    device/alcatel/v860/prebuilt/root/sec_param.ko:root/sec_param.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/alcatel/v860/ramdisk/init.rc:root/init.rc \
    device/alcatel/v860/ramdisk/init.bcm21553.rc:root/init.bcm21553.rc

# Prebuilt Kernel - DELETE from the package
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/alcatel/v860/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
