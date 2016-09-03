## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit AOSP device configuration for blade.
$(call inherit-product, device/alcatel/v860/device_v860.mk)

# Inherit some common CM stuff.
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
$(call inherit-product, vendor/cm/config/mini.mk)

#Build Dalvik runtime only, ART does not work with armv6 yet
PRODUCT_RUNTIMES := runtime_libdvm_default

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME="Alcatel v860" \
	TARGET_DEVICE="Alcatel v860"

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_v860
PRODUCT_BRAND := Alcatel
PRODUCT_DEVICE := v860
PRODUCT_MODEL := v860
PRODUCT_MANUFACTURER := Alcatel
PRODUCT_CHARACTERISTICS := phone

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=v860 BUILD_ID=GRI40 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=Alcatel/v860/v860:2.3.6/GINGERBREAD/XWKTN:user/release-keys PRIVATE_BUILD_DESC="v860-user 2.3.6 GINGERBREAD XWKTN release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := SmartII
PRODUCT_VERSION_DEVICE_SPECIFIC :=
