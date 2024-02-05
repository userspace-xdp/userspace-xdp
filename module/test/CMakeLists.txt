cmake_minimum_required(VERSION 3.10)

# Set the project name
project(LpmTrieTest)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add executable
add_executable(LpmTrieTest main.cpp)
target_include_directories(LpmTrieTest PUBLIC ../)