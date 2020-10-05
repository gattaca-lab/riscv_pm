#!/bin/bash

ROOT_DIR="${2}"

source ${2}/scripts/env.sh

QEMU_BIN=${INSTALL_DIR}/bin/qemu-system-riscv64

${QEMU_BIN} \
    -nographic \
    -machine virt \
    -bios ${1} \
    -chardev testdev,id=ctl -serial chardev:ctl \
    -m 1024M

exit $(($?>>1))
