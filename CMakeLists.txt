# CMake最低版本号要求
cmake_minimum_required(VERSION 2.8)

# 项目名称
project(earth)

# 添加子目录
add_subdirectory(src)

# 启用测试
enable_testing()

# 测试
add_test(NAME UtilsTest COMMAND UtilsTest)
