#!/bin/bash

ROOT_DIR="$(pwd)"

source scripts/env.sh

git submodule update --init --recursive

# switch QEMU to proper branch
cd ${QEMU_SRC_DIR}
git checkout riscv_pm-devel
git submodule update
cd ${ROOT_DIR}

# switch Linux to proper branch
cd ${LINUX_SRC_DIR}
git checkout riscv_pm
cd ${ROOT_DIR}

# switch Buildroot to proper branch
cd ${BUILDROOT_SRC_DIR}
git checkout 2020.05.x
cd ${ROOT_DIR}
