
set(CMAKE_SYSTEM_NAME QNX)
SET(CMAKE_SYSTEM_PROCESSOR "aarch64")

set(CMAKE_C_COMPILER ntoaarch64-gcc)
set(CMAKE_CXX_COMPILER ntoaarch64-g++)
set(CMAKE_C_FLAGS "$ENV{CFLAGS} -O3 -Wall -g -fPIC")
set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=gnu++11 -O3 -Wall -g -fPIC" )

#set(arch gcc_ntoaarch64le)
#set(CMAKE_C_COMPILER qcc)
#set(CMAKE_C_COMPILER_TARGET ${arch})
#set(CMAKE_CXX_COMPILER qcc)
#set(CMAKE_CXX_COMPILER_TARGET ${arch}) 
#set(CMAKE_C_FLAGS "$ENV{CFLAGS} -O3 -Wall -g -fPIC -V${arch}")
#set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=gnu++11 -O3 -Wall -g -fPIC -V${arch} -lang-c++" )
#MESSAGE("STATUS CMAKE_C_COMPILER=${CMAKE_C_COMPILER}")
#MESSAGE("STATUS CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}")

#find lib and include in rootfs
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

