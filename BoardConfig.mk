# inherit from the proprietary version
include vendor/TabletExpress/X10/BoardConfigVendor.mk
include device/softwinner/octopus-common/BoardConfigCommon.mk

LOCAL_PATH := device/TabletExpress/X10

BOARD_VENDOR := allwinner

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_NEON := true
TARGET_CPU_SMP := true
BOARD_USES_SECURE_SERVICES := true
TARGET_USE_NEON_OPTIMIZATION := true
TARGET_USES_ION := true

#CM12 changes
#ANDROID_COMMON_BUILD_MK := true
#WITH_DEXPREOPT := true
DISABLE_DEXPREOPT := true

# Assert
TARGET_OTA_ASSERT_DEVICE := X10

# Audio
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
# CEDARX_CHIP_VERSION := 

# Bootloader
BOARD_USES_UBOOT := true
TARGET_BOOTLOADER_BOARD_NAME := exdroid
TARGET_NO_BOOTLOADER := true

# Camera
USE_CAMERA_STUB := true

# Display & Video
USE_OPENGL_RENDERER := true
ENABLE_WEBGL := true
OVERRIDE_RS_DRIVER := libRSDriver.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true

# EGL
#BOARD_EGL_CFG := $(LOCAL_PATH)/egl/egl.cfg
BOARD_EGL_CFG := device/softwinner/octopus-common/egl/egl.cfg

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_IMAGE_NAME := uImage
BOARD_KERNEL_CMDLINE := boot_type=0 disp_para=100 fb_base=0x0 config_size=53088 androidboot.serialno=00000000000000000000 androidboot.hardware=sun8i androidboot.selinux=disabled console=ttyS0,115200 root=/dev/system init=/init vmalloc=384M ion_cma_list=120m,176m,512m loglevel=7 partitions=bootloader@nanda:env@nandb:boot@nandc:system@nandd:misc@nande:recovery@nandf:cache@nandg:metadata@nandh:private@nandi:alog@nandj:UDISK@nandk
BOARD_MKBOOTIMG_ARGS := --base 40000000 --pagesize 2048 --kernel_offset 00008000 --ramdisk_offset 01000000 --tags_offset 00000100

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12683575296
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := octopus
TARGET_BOARD_PLATFORM_GPU := POWERVR-SGX-544MP

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab    


# 1.1  realtek wifi configuration
BOARD_WIFI_VENDOR := realtek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl   
BOARD_USR_WIFI := rtl8723bs
BOARD_WLAN_DEVICE := rtl8723bs

# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_HAVE_BLUETOOTH_RTK := true
#BLUETOOTH_HCI_USE_RTK_H5 := true
#BOARD_HAVE_BLUETOOTH_NAME := rtl8723bs
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/TabletExpress/X10/bluetooth/
# Disable bluetooth until we can get it working
BOARD_HAVE_BLUETOOTH := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth
BLUETOOTH_HCI_USE_USB := false
BOARD_HAVE_BLUETOOTH_BCM := false

# sepolicy
#BOARD_SEPOLICY_DIRS := \
       $(LOCAL_PATH)/sepolicy
#BOARD_SEPOLICY_DIRS := \
    device/softwinner/octopus-common/sepolicy

# The list below is order dependent
#BOARD_SEPOLICY_UNION := \
    device.te \
    file_contexts \
    genfs_contexts \
    mediaserver.te \
    netd.te \
    surfaceflinger.te \
    vold.te


# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# Wifi
#BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
#WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
include vendor/TabletExpress/X10/X10-vendor-blobs.mk

# Hack for building without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)


