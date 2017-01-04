LOCAL_PATH := device/TabletExpress/X10

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/TabletExpress/X10/X10-vendor-blobs.mk)
$(call inherit-product, device/softwinner/octopus-common/octopus-common.mk)

DEVICE_FOLDER := device/TabletExpress/X10

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += gatord

#PRODUCT_PACKAGES += \
    Bluetooth
    
#PRODUCT_COPY_FILES += \
    device/softwinner/octopus-ibt/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf    
    
# Setup boot
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/TabletExpress/X10/recovery/root,root)

# Audio configuration
	#Try to pull from CM files - drew
#PRODUCT_COPY_FILES += \
    hardware/libhardware_legacy/audio/audio_policy.conf:system/etc/audio_policy.conf    
    
    
# Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1 
    
#PRODUCT_PROPERTY_OVERRIDES += \
    ro.inet.wlan.type=8723bs_vq0 \
    ro.product.8723b_bt.used=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    ro.sf.rotation=0 \
    ro.inet.wlan.type=8723bs_vq0    
    
    
# RIL
# Drew - this is the radio initialization daemon library, going to try to disable, but it may break wifi
# disabling should force it to fall back on hardware/ril
#PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/libsoftwinner-ril-5.0.so:system/lib64/libsoftwinner-ril-5.0.so
   # Radio Packages and Configuration Flie
$(call inherit-product, device/softwinner/common/rild/radio_common.mk)

#PRODUCT_PACKAGES += Bluetooth
#rtl8723bs bt fw and config
#$(call inherit-product, hardware/realtek/bluetooth/rtl8723bs/firmware/rtlbtfw_cfg.mk)

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

