#!/bin/bash

SCRIPT_NAME=`basename ${BASH_SOURCE}`

PROJECT_ROOT_PATH=$(dirname $(dirname $(dirname $(pwd))))
INCLUDE_PATH=${PROJECT_ROOT_PATH}/include
LIB_PATH=${PROJECT_ROOT_PATH}/lib

SOURCE_CODE_PATH=${PROJECT_ROOT_PATH}/src/3rdTools/glog
PACKED_SOURCE_CODE=glog-0.4.0.zip
UNPACKED_SOURCE_CODE=glog-0.4.0
PACKED_SOURCE_CODE_PATH=${SOURCE_CODE_PATH}/${PACKED_SOURCE_CODE}
UNPACKED_SOURCE_CODE_PATH=${SOURCE_CODE_PATH}/${UNPACKED_SOURCE_CODE}

LIB_OUT_PATHS=(
    build_i/libglog.a
)

HEADER_FILE_PATHS=(
    build_i/glog
)

log_info() {
    echo "[${SCRIPT_NAME}]@`date "+%Y-%m-%d %H:%M:%S"`[INFO]: $* "
}

log_error() {
    echo "[${SCRIPT_NAME}]@`date "+%Y-%m-%d %H:%M:%S"`[ERROR]: $* "
}

print_parameters() {
    log_info "SCRIPT_NAME = $SCRIPT_NAME"
    log_info "PROJECT_ROOT_PATH = $PROJECT_ROOT_PATH"
    log_info "INCLUDE_PATH = $INCLUDE_PATH"
    log_info "LIB_PATH = $LIB_PATH"
    log_info "SOURCE_CODE_PATH = $SOURCE_CODE_PATH"
    log_info "PACKED_SOURCE_CODE = $PACKED_SOURCE_CODE"
    log_info "UNPACKED_SOURCE_CODE = $UNPACKED_SOURCE_CODE"
    log_info "PACKED_SOURCE_CODE_PATH = $PACKED_SOURCE_CODE_PATH"
    log_info "UNPACKED_SOURCE_CODE_PATH = $UNPACKED_SOURCE_CODE_PATH"
}

pre_build() {
    log_info "pre_build enter"

    if [ -d ${UNPACKED_SOURCE_CODE_PATH} ]; then
        log_info "${UNPACKED_SOURCE_CODE_PATH} already exist, will exit."
        exit 0
    fi

    if [ ! -f ${PACKED_SOURCE_CODE_PATH} ]; then
        log_error "${UNPACKED_SOURCE_CODE_PATH} does not exist, will exit."
        exit 0
    fi

    log_info "starting unzip file"
    unzip ${PACKED_SOURCE_CODE_PATH} > /dev/null

    log_info "pre_build exit"
}

build() {
    log_info "build enter"

    if [ ! -d ${UNPACKED_SOURCE_CODE_PATH} ]; then
        log_error "${UNPACKED_SOURCE_CODE_PATH} does not exist, will exit."
        exit 0
    fi

    cd ${UNPACKED_SOURCE_CODE_PATH}
    mkdir ./build_i
    cd ./build_i
    cmake ../
    make

    log_info "build exit"
}

post_build() {
    log_info "post_build enter"

    move_files_to_include
    move_libs_to_lib

    log_info "post_build exit"
}

move_files_to_include() {
    log_info "starting move_files_to_include"

    mkdir -p ${INCLUDE_PATH}
    for file_path in ${HEADER_FILE_PATHS[@]}; do
        cp -R ${UNPACKED_SOURCE_CODE_PATH}/${file_path} ${INCLUDE_PATH}
    done
}

move_libs_to_lib() {
    log_info "starting move_libs_to_lib"

    mkdir -p ${LIB_PATH}
    for lib_path in ${LIB_OUT_PATHS[@]}; do
        cp ${UNPACKED_SOURCE_CODE_PATH}/${lib_path} ${LIB_PATH}
    done
}

main() {
    print_parameters
    pre_build
    build
    post_build
}

main
