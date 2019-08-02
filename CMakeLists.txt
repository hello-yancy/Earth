# CMake最低版本号要求
cmake_minimum_required(VERSION 2.8)

# 项目名称
project(earth)

# 添加子目录
add_subdirectory(src)

message("CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}")