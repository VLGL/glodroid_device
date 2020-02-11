# Copyright (C) 2019 The Android Open Source Project
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
#

$(call inherit-product, device/glodroid/common/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# bootloaders in srec format
PRODUCT_PACKAGES += \
    boot.scr \
    boot_net.scr \
    u-boot-sunxi-with-spl.bin

# Init RC files
PRODUCT_COPY_FILES += \
    device/glodroid/plus2e/init.plus2e.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.plus2e.rc \
    device/glodroid/plus2e/ueventd.plus2e.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \

# fstab
PRODUCT_COPY_FILES += \
    device/glodroid/plus2e/fstab:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(TARGET_PRODUCT) \
    device/glodroid/plus2e/fstab:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(TARGET_PRODUCT) \

# tools
PRODUCT_COPY_FILES += \
    device/glodroid/tools/gensdimg.sh:$(TARGET_COPY_OUT)/gensdimg.sh

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/drm.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/drm.rc \
    device/glodroid/common/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.common.usb.rc \

# Audio
PRODUCT_PACKAGES += \
    tinyalsa tinymix tinycap tinypcminfo \
    audio.primary.plus2e \

PRODUCT_COPY_FILES += \
    device/glodroid/plus2e/audio.plus2e.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio.plus2e.xml \
