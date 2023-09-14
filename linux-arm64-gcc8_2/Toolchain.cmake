set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(cross_triple "aarch64-unknown-linux-gnu")
set(cross_root /usr/xcc/${cross_triple})

set(CMAKE_C_COMPILER $ENV{CC})
set(CMAKE_CXX_COMPILER $ENV{CXX})
set(CMAKE_Fortran_COMPILER $ENV{FC})

set(CMAKE_FIND_ROOT_PATH ${cross_root} ${cross_root}/${cross_triple})
set(CMAKE_SYSROOT ${cross_root}/${cross_triple}/sysroot)

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_CXX_FLAGS "-I ${cross_root}/include/")
set(CMAKE_C_FLAGS "-I ${cross_root}/include/")

# This is needed to use the correct glibc
string(APPEND CMAKE_CXX_FLAGS " -Wl,--rpath=\"${CMAKE_SYSROOT}/lib\"")
string(APPEND CMAKE_C_FLAGS " -Wl,--rpath=\"${CMAKE_SYSROOT}/lib\"")


# We will always use qemu even when running on the same arch
set(CMAKE_CROSSCOMPILING_EMULATOR /usr/bin/qemu-aarch64)

if (NOT "$ENV{CMAKE_MODULE_PATH}" EQUAL "")
    list(APPEND CMAKE_MODULE_PATH $ENV{CMAKE_MODULE_PATH})
endif()
