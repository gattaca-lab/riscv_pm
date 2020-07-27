# RISCV PM

This reporistory is the root of riscv-tbi project. It contains guidelines,
documentation and includes all relevant repositories as submodules.

The main purpose is to provide instructions regarding the general development
process and to provide releases.


## How to obtain sources

```
git clone https://github.com/gattaca-lab/riscv_pm
cd riscv_pm
./setup_git.sh
```

## Prerequisites

```
$ sudo apt-get install autoconf automake autotools-dev \
    curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk \
    build-essential bison flex texinfo gperf libtool \
    patchutils bc zlib1g-dev libexpat-dev
```

Please report any issues with the required environment.

## How to build everything

To build project:

```
CPU_NUM=32 ./build.sh
```

By default only 8 cpu cores are going to be used. To override this, set CPU_NUM variable.

This will build riscv toolchain, qemu and tests from src/tests directory.
The resulting artifacts shall be installed in `SRC_DIR/install`.

## How to run tests with QEMU vm

To run tests on QEMU after everything is built:

```
mkdir build/run_tests
cd build/run_tests
cmake ../..
ctest 
```

## Further work

There's [draft of test plan](https://github.com/gattaca-lab/riscv_pm/blob/master/testplan.md)
