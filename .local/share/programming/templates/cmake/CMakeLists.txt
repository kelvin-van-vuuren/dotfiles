# Minimum ascertained using https://github.com/nlohmann/cmake_min_version
cmake_minimum_required(VERSION 3.13.5 FATAL_ERROR)

project(
    project
    VERSION 1.0
    LANGUAGES CXX
)

# Project wide setup
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS NO)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_custom_target(
    copy-compile-commands ALL
    ${CMAKE_COMMAND}
    -E
    copy_if_different
    ${CMAKE_BINARY_DIR}/compile_commands.json
    ${CMAKE_CURRENT_LIST_DIR}
)

# Add project_options v0.13.1
# https://github.com/cpp-best-practices/project_options
include(FetchContent)
FetchContent_Declare(
    _project_options URL https://github.com/cpp-best-practices/project_options/archive/refs/tags/v0.13.1.zip
)
FetchContent_MakeAvailable(_project_options)
include(${_project_options_SOURCE_DIR}/Index.cmake)
project_options(
    ENABLE_CACHE
    # WARNINGS_AS_ERRORS
    # ENABLE_CPPCHECK
    # ENABLE_CLANG_TIDY
    # ENABLE_CONAN
    # ENABLE_COVERAGE
    # ENABLE_IPO
    # ENABLE_INCLUDE_WHAT_YOU_USE
    # ENABLE_PCH
    # PCH_HEADERS
    # ENABLE_DOXYGEN
    # ENABLE_USER_LINKER
    # ENABLE_BUILD_WITH_TIME_TRACE
    # ENABLE_UNITY
    # ENABLE_SANITIZER_ADDRESS
    # ENABLE_SANITIZER_LEAK
    # ENABLE_SANITIZER_UNDEFINED_BEHAVIOR
    # ENABLE_SANITIZER_THREAD
    # ENABLE_SANITIZER_MEMORY
    # CONAN_OPTIONS
)

# Set up default build type for when none defined
set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY VALUE ${default_build_type})
endif()

add_compile_options(
    $<$<CONFIG:DEBUG>:-g>
    $<$<CONFIG:DEBUG>:-O0>
    $<$<CONFIG:RELEASE>:-O3>
    $<$<CONFIG:PROFILING>:-O3>
    $<$<CONFIG:PROFILING>:-g>
    $<$<CONFIG:PROFILING>:-shared-libgcc>
)

add_compile_definitions($<$<CONFIG:DEBUG>:DEBUG> $<$<CONFIG:RELEASE>:NDEBUG> $<$<CONFIG:PROFILING>:NDEBUG>)

# Main targets built by this project
add_subdirectory(src)
