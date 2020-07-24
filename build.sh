#!/bin/bash
set -x

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source scripts/env.sh
source scripts/build_qemu.sh
source scripts/build_gcc.sh

mkdir -p "${BUILD_DIR}"
mkdir -p "${INSTALL_DIR}"

set -e
  
build_qemu
build_gcc
