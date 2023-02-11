#
# Copyright (C) 2019 Potato Open Sauce Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/dandelion

# Release name
PRODUCT_RELEASE_NAME := dandelion
PRODUCT_USE_DYNAMIC_PARTITIONS := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root) \
    $(DEVICE_PATH)/prebuilt/dtb:dtb.img

PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dandelion
PRODUCT_NAME := omni_dandelion
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 9A
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="dandelion-user 11 RP1A.200720.011 V12.5.9.0.RCDINXM release-keys"

BUILD_FINGERPRINT := Redmi/dandelion_in/dandelion:11/RP1A.200720.011/V12.5.9.0.RCDINXM:user/release-keys

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# Resolution
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
