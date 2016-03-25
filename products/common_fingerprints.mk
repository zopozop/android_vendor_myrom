ifeq ($(TARGET_PRODUCT),coldfusion_angler)
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MHC19I/2590160:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MHC19I 2590160 release-keys"
endif
