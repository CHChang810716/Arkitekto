include(${CMAKE_CURRENT_LIST_DIR}/basic.cmake)
akt_add_executable(${AKT_TARGET} exe_targets ${AKT_CHILD_SRCS})
akt_vscode_add_to_launch(${AKT_TARGET})