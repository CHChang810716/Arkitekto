include(${CMAKE_CURRENT_LIST_DIR}/basic.cmake)
akt_add_executable(${AKT_TARGET} exe_targets ${AKT_CHILD_SRCS})
set(AKT_VSCODE_MSVC_TASK_TMPL "${CMAKE_SOURCE_DIR}/cmake/schemes/vscode_msvc_task.in")
akt_vscode_add_to_launch(${AKT_TARGET})