#!/bin/bash

../clang_build/bin/clang -emit-llvm -target aarch64-none-linux-gnu -march=armv8.2-a+sve -O1 -S ../tests/early-loop-termination/FlexVecExample/FlexVecExample.c -o ../tests/early-loop-termination/FlexVecExample/FlexVecExample.o 

../llvm_build/bin/opt -passes="dot-callgraph" --dot-cfg-mssa=FlexVecExample.dot -disable-output FlexVecExample.ll

dot -Tpng -ofunction.png .function.dot