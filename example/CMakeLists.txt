cmake_minimum_required(VERSION 3.10.0)
project(AktExample 
    LANGUAGES C CXX 
    VERSION 0.1.0.0
)

include(${CMAKE_CURRENT_LIST_DIR}/../Arkitekto/all.cmake)
# akt_collect_srcs_and_targets(result_srcs result_targets "${CMAKE_SOURCE_DIR}/src")
# akt_show_var(result_srcs)
# akt_show_var(result_targets)

# akt_add_targets_in(${CMAKE_SOURCE_DIR}/src)
akt_get_debugger(debugger)
akt_show_var(debugger)
akt_vscode_gen_c_cpp_properties()
include(cmake/src.cmake)
#dd include(cmake/install.cmake)
akt_vscode_add_to_launch(my-example)
akt_vscode_add_to_launch(my-example2)
akt_vscode_gen_launch()