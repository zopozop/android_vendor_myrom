# Inherit AOSP device configuration for angler.
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit common product files.
$(call inherit-product, vendor/coldfusion/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := coldfusion_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/angler/system/media/bootanimation.zip:system/media/bootanimation.zip
