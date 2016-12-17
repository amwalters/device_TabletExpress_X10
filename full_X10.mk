# Inherit from X10 device
$(call inherit-product, device/TabletExpress/X10/device.mk)

PRODUCT_CHARACTERISTICS := tablet

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X10
PRODUCT_NAME := full_X10
PRODUCT_BRAND := Allwinner
PRODUCT_MODEL := DragonTouch X10
PRODUCT_MANUFACTURER := TabletExpress
