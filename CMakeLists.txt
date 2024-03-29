cmake_minimum_required(VERSION 3.15)

if(CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()

project(
    "dpdk-with-embedded-bpftime"
    VERSION 0.1.0
    LANGUAGES C CXX
)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "RelWithDebInfo")
endif()

option(NET_MODULE_ENABLE_LTO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)." ON)
if (NET_MODULE_ENABLE_LTO)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)
    if(result)
        set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(SEND_ERROR "IPO is not supported: ${output}.")
    endif()
    set(BPFTIME_ENABLE_LTO TRUE)
endif()
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 20)

add_subdirectory(bpftime)

add_library(xdp-bpftime 
module/xdp-runtime.cpp 
module/helpers.c
module/xdp-runtime.h
module/maps.cpp
)
target_link_libraries(xdp-bpftime PUBLIC spdlog::spdlog runtime)
add_dependencies(xdp-bpftime runtime copy_headers)
target_include_directories(xdp-bpftime PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/runtime/include
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/runtime/src
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/vm/include
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/third_party/
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/third_party/spdlog/include
)
add_definitions(-DSPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_TRACE)

add_executable(xdp-bpftime-runner module/runner.cpp)
target_link_libraries(xdp-bpftime-runner PRIVATE xdp-bpftime)