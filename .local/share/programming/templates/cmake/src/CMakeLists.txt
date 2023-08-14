set(SOURCE_DIR "${PROJECT_SOURCE_DIR}/src")

# Main executable depends on Model, Debug and Benchmarking modules
add_executable(project main.cpp)
target_link_libraries(
    project
    PRIVATE project_options
            project_warnings
)

# Set main executable location
set_target_properties(project PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
