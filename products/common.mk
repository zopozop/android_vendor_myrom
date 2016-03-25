# Generic product
PRODUCT_NAME := coldfusion
PRODUCT_BRAND := coldfusion
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=1

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/coldfusion/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Block based ota flag default to off to get old style ota zip back (To get back block based zip, just enable to true.)
#TARGET_USES_BLOCK_BASED_OTA := false

# Latin IME lib - gesture typing
ifneq ($(filter coldfusion_hammerhead coldfusion_mako coldfusion_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# Extra packages
PRODUCT_PACKAGES += \
    AudioFX \
    Busybox \
    Exchange2 \
    Launcher3 \
    LockClock \
    Stk 

# APN list
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/coldfusion/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/bin/sysinit:system/bin/sysinit

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/coldfusion/prebuilt/common/addon.d/50-coldfusion.sh:system/addon.d/50-coldfusion.sh \
    vendor/coldfusion/prebuilt/common/addon.d/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/coldfusion/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/coldfusion/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/coldfusion/prebuilt/common/etc/backup.conf:system/etc/backup.conf

ifneq ($(filter coldfusion_mako coldfusion_hammerhead coldfusion_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/coldfusion/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/coldfusion/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd \
    vendor/coldfusion/prebuilt/common/addon.d/71-layers.sh:system/addon.d/71-layers.sh
endif

-include vendor/coldfusion/products/common_fingerprints.mk
