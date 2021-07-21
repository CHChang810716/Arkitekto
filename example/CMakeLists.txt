cmake_minimum_required(VERSION 3.10.0)
project(AktExample 
    LANGUAGES C CXX 
    VERSION 0.1.0.0
)

include(${CMAKE_CURRENT_LIST_DIR}/../Arkitekto/all.cmake)
include(cmake/src.cmake)
include(cmake/install.cmake)
akt_vscode_gen_launch()
akt_vscode_gen_c_cpp_properties()