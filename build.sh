#!/bin/bash -e

KERNEL_SRC="/home/erik/dev/linux"
DEFAULT_TOOLCHAIN_DIR="/home/erik/dev/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin"
TMP_DIR="/tmp/qcacld"

# Configuration env vars will be set to default values if not defined.
[[ -z ${TOOLCHAIN_DIR+x} ]] && TOOLCHAIN_DIR=$DEFAULT_TOOLCHAIN_DIR

export PATH="$PATH:$TOOLCHAIN_DIR"
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm


# Build qcacld
KERNEL_SRC=$KERNEL_SRC CONFIG_CLD_HL_SDIO_CORE=y BUILD_DEBUG_VERSION=1 make
KERNEL_SRC=$KERNEL_SRC INSTALL_MOD_PATH=$TMP_DIR make modules_install

