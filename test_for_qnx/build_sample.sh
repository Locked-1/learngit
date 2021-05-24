#!/bin/bash
set -e

WORKSPACE=${PWD}/.
export WORKSPACE=$(readlink -f "`dirname $WORKSPACE`")

BUILD_PLATFORM=Linux-x86_64
if type ntoaarch64-gcc > /dev/null 2>&1 ; then
    BUILD_PLATFORM=QNX-aarch64le
elif [ "$CC" = "aarch64-linux-gnu-gcc" ]; then
    BUILD_PLATFORM=Linux-aarch64
fi

CPU_CNT=$(nproc --all)
CPU_CNT=`expr ${CPU_CNT} - 1`
echo -e "\033[34m build sample, platform is ${BUILD_PLATFORM}, cpu count is ${CPU_CNT}\033[0m"

BUILD_DIR=${WORKSPACE}/building/${BUILD_PLATFORM}
mkdir -p ${BUILD_DIR}/sample
cd ${BUILD_DIR}/sample

if [ "QNX-aarch64le" = "${BUILD_PLATFORM}" ]; then
    TOOLCHAIN_FILE="${WORKSPACE}/platform/qnx_toolchain.cmake"
fi

#RELEASE_DIR=${WORKSPACE}/install_dir/${BUILD_PLATFORM}
#    -DCMAKE_INSTALL_PREFIX="${RELEASE_DIR}" \
cmake \
    -DCMAKE_TOOLCHAIN_FILE="${TOOLCHAIN_FILE}" \
    ${WORKSPACE}
make -j${CPU_CNT}
#make install


