cmake_minimum_required(VERSION 3.10)
project(MyCppProject)

set(CMAKE_CXX_STANDARD 11)

# Uygulama
add_executable(MyApp src/main.cpp src/add.cpp)

# Testler için Google Test
enable_testing()
find_package(GTest REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})
include_directories(src)

add_executable(UnitTests test/test_add.cpp src/add.cpp)
target_link_libraries(UnitTests ${GTEST_LIBRARIES} pthread)

add_test(NAME AddTest COMMAND UnitTests)

target_include_directories(UnitTests PRIVATE src)