#!/bin/bash

ROOT_DIR="$(pwd)"

source scripts/env.sh

git submodule update --init --recursive

# switch QEMU to proper branch
cd ${QEMU_SRC_DIR}
git checkout riscv_pm_qemu_5.1
git submodule update
cd ${ROOT_DIR}

# switch Linux to proper branch
cd ${LINUX_SRC_DIR}
git checkout riscv_pm_5.8
cd ${ROOT_DIR}

# switch Buildroot to proper branch
cd ${BUILDROOT_SRC_DIR}
git checkout 2020.08.x
cd ${ROOT_DIR}
