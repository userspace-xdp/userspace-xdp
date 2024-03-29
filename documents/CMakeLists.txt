cmake_minimum_required(VERSION 3.15)

if(CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
    cmake_policy(SET CMP0135 NEW)
endif()

project(
    "dpdk-with-embedded-bpftime"
    VERSION 0.1.0
    LANGUAGES C CXX
)

option(ENABLE_LTO "Whether to enable LTO" NO)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 20)

add_subdirectory(bpftime)

add_library(xdp-bpftime xdp-runtime.cpp xdp-runtime.h)
target_link_libraries(xdp-bpftime PUBLIC spdlog::spdlog runtime)
add_dependencies(xdp-bpftime runtime copy_headers)
target_include_directories(xdp-bpftime PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/runtime/include
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/runtime/src
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/vm/include
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/third_party/
    ${CMAKE_CURRENT_SOURCE_DIR}/bpftime/third_party/spdlog/include
)
