# cmake needs this line
cmake_minimum_required(VERSION 2.8)
 
# Define project name
project(sample)

set(CMAKE_BUILD_TYPE Release) # Release Debug
set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=c++11 -O3 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -std=c++11 -O3 -Wall")

#获取CPU类型
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-march=armv8-a" COMPILER_SUPPORTS_ARMV8a)
message(STATUS "COMPILER_SUPPORTS_ARMV8a=" ${COMPILER_SUPPORTS_ARMV8a})

string(REGEX MATCH "aarch64" CXX_COMPILER_NAME_aarch64 ${CMAKE_CXX_COMPILER})
string(REGEX MATCH "ntoaarch64" CXX_COMPILER_NAME_ntoaarch64 ${CMAKE_CXX_COMPILER})
message(STATUS "CMAKE_CXX_COMPILER=" ${CMAKE_CXX_COMPILER})
message(STATUS "CXX_COMPILER_NAME_aarch64=" ${CXX_COMPILER_NAME_aarch64})
message(STATUS "CXX_COMPILER_NAME_ntoaarch64=" ${CXX_COMPILER_NAME_ntoaarch64})

set(CROSS_COMPILE Linux-x86_64)
if(COMPILER_SUPPORTS_ARMV8a)
    set(CROSS_COMPILE Linux-aarch64)
endif()
if(${CXX_COMPILER_NAME_aarch64} MATCHES "aarch64")
    set(CROSS_COMPILE Linux-aarch64)
endif()
if(${CXX_COMPILER_NAME_ntoaarch64} MATCHES "ntoaarch64")
    set(CROSS_COMPILE QNX-aarch64le)
endif()

if (CROSS_COMPILE MATCHES "Linux-aarch64")
    set(EGO_SYSTEM_ARCH "Linux-aarch64")
    SET(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -std=c++11 -O3 -Wall")
    set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=c++11 -O3 -Wall")
    SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    message(STATUS "------ cross compile for aarch64 --------")
elseif (CROSS_COMPILE MATCHES "QNX-aarch64le")
    # QNX cross-compile detected
    set(EGO_SYSTEM_ARCH "QNX-aarch64le")
    set(CMAKE_SYSTEM_NAME QNX)
    set(arch gcc_ntoaarch64le)
    set(CMAKE_C_COMPILER_TARGET ${arch})
    set(CMAKE_CXX_COMPILER_TARGET ${arch})
    set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -std=gnu++11 -O3 -Wall")
    set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -std=gnu++11 -O3 -Wall")
    SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    message(STATUS "------ QNX cross compile detected " "--------")
endif ()
 

set(3rdparty_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty)
#find_package(3rdparty REQUIRED)


include_directories(${3RDPARTY_INCLUDE_DIRS})
link_directories(${3RDPARTY_LIB_DIRS})

set(CMAKE_INSTALL_RPATH ".:./lib:../lib")

if (${CROSS_COMPILE} MATCHES "QNX-aarch64le")
    #set(EXTRA_LIBS c)
else ()
    set(EXTRA_LIBS stdc++fs)
endif()

add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_link_libraries(${PROJECT_NAME}
    ${3RDPARTY_LIBS}
    ${EXTRA_LIBS}
    )

