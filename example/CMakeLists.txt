cmake_minimum_required(VERSION 3.10.0)
project(AktExample 
    LANGUAGES C CXX 
    VERSION 0.1.0.0
)

include(${CMAKE_CURRENT_LIST_DIR}/../Arkitekto/all.cmake)
# akt_collect_srcs_and_targets(result_srcs result_targets "${CMAKE_SOURCE_DIR}/src")
# akt_show_var(result_srcs)
# akt_show_var(result_targets)

akt_add_targets_in(${CMAKE_SOURCE_DIR}/src)
# include(cmake/src.cmake)
#dd include(cmake/install.cmake)