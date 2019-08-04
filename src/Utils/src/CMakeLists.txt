
# CMake最低版本号要求
cmake_minimum_required(VERSION 2.8)

# 项目名称
project(Utils)

# C++11 编译
set(CMAKE_CXX_STANDARD 11)

# 添加头文件路径
include_directories(${CMAKE_SOURCE_DIR}/include)

# 添加库文件路径
#lib_directories(${CMAKE_SOURCE_DIR}/lib)

# 设置库文件输出路径
set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

# 查找当前目录下的所有源文件，并赋值到DIR_SRC变量中
aux_source_directory(./ DIR_LIB_SRC)

# 生成链接库
add_library(Utils SHARED ${DIR_LIB_SRC}) 
