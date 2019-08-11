# 项目名称
project(UtilsTest)

# C++11 编译
set(CMAKE_CXX_STANDARD 11)

# 添加头文件路径
include_directories(${CMAKE_SOURCE_DIR}/include)

# 添加库文件路径
link_directories(${CMAKE_SOURCE_DIR}/lib)

# 设置库文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/test)

# 查找当前目录下的所有源文件，并赋值到DIR_SRC变量中
aux_source_directory(./ DIR_SRC)

# 生成可执行文件
add_executable(UtilsTest ${DIR_SRC})

# 连接库文件
target_link_libraries(UtilsTest gtest gtest_main pthread)
