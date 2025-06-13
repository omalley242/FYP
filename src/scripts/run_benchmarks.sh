#!/bin/bash

# setup compilation flags

export CMAKE_C_FLAGS="-g -O3 -target aarch64-linux-gnu -mcpu=neoverse-v2 -mllvm -enable-early-exit-vectorization"
export CMAKE_CXX_FLAGS="-g -O3 -target aarch64-linux-gnu -mcpu=neoverse-v2 -mllvm -enable-early-exit-vectorization"

# build the llvm test suite
(mkdir -p ../benchmarks/test-suite-build &&

# generate the build script with cmake
cd ../benchmarks/test-suite-build &&
cmake -DCMAKE_CXX_COMPILER=/home/omalley242/University/FYP/src/clang_build/bin/clang++ \
        -DCMAKE_C_COMPILER=/home/omalley242/University/FYP/src/clang_build/bin/clang \
        -DCMAKE_C_FLAGS='-g -O3 -target aarch64-linux-gnu -mcpu=neoverse-v2 -mllvm -enable-early-exit-vectorization' \
        -DCMAKE_CXX_FLAGS='-g -O3 -target aarch64-linux-gnu -mcpu=neoverse-v2 -mllvm -enable-early-exit-vectorization' \
        -GNinja \
        ../llvm-test-suite &&

# run the build
ninja -j 6
)

# run lvm test suite tests
# (cd ../benchmarks/test-suite-build && ../../llvm_build/bin/llvm-lit -v -j 6 -o results.json .)
