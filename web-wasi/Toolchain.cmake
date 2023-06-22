set(WASI_SDK_PREFIX $ENV{WASI_SDK_PATH})
include($ENV{WASI_SDK_PATH}/share/cmake/wasi-sdk.cmake)

set(CMAKE_FIND_ROOT_PATH $ENV{CROSS_ROOT})
set(CMAKE_SYSROOT $ENV{WASI_SYSROOT})

set(CMAKE_C_COMPILER /usr/local/bin/clang-wasi-sysroot.sh)
set(CMAKE_CXX_COMPILER /usr/local/bin/clang++-wasi-sysroot.sh)
set(CMAKE_AR llvm-ar-$ENV{LLVM_VERSION})
set(CMAKE_RANLIB llvm-ranlib-$ENV{LLVM_VERSION})
set(CMAKE_ASM_COMPILER clang-$ENV{LLVM_VERSION})

set(CMAKE_C_COMPILER_TARGET $ENV{CROSS_TRIPLE})
set(CMAKE_CXX_COMPILER_TARGET $ENV{CROSS_TRIPLE})
set(CMAKE_ASM_COMPILER_TARGET $ENV{CROSS_TRIPLE})

set(CMAKE_CROSSCOMPILING_EMULATOR /wasi-runtimes/wasmtime/bin/wasmtime-pwd.sh)
