#!/usr/bin/env sh

exec clang-${LLVM_VERSION} --target=wasm32-wasi --sysroot=${WASI_SYSROOT} "$@"
