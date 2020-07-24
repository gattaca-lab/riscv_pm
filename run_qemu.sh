#!/bin/bash

ROOT_DIR="$(pwd)"
MAC=$(whoami | md5sum | sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02:\1:\2:\3:\4:\5/')

source scripts/env.sh

QEMU_BIN=${INSTALL_DIR}/bin/qemu-system-riscv64

sudo ${QEMU_BIN} \
    -nographic \
    -machine virt \
    -kernel ${PK_BUILD_DIR}/bbl \
    -m 1024M
