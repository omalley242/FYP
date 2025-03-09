#!/bin/bash

# setup compilation flags

export CMAKE_C_FLAGS="-g -fsave-optimization-record=yaml -O3"
export CMAKE_CXX_FLAGS="-g -fsave-optimization-record=yaml -O3"

# build the llvm test suite
(mkdir -p ../benchmarks/test-suite-build &&

# generate the build script with cmake
cd ../benchmarks/test-suite-build &&
cmake -DCMAKE_C_COMPILER=clang \
        -DCMAKE_C_FLAGS='-g -fsave-optimization-record=yaml -O3' \
        -DCMAKE_CXX_FLAGS='-g -fsave-optimization-record=yaml -O3' \
        -GNinja \
        ../llvm-test-suite &&

# run the build
ninja -j 6
)

# run lvm test suite tests
(cd ../benchmarks/test-suite-build && ../../llvm_build/bin/llvm-lit -v -j 6 -o results.json .)
