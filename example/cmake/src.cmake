single_scheme_add_targets_in(
    "src" 
    ${CMAKE_CURRENT_LIST_DIR}/schemes/basic.cmake 
    exe_targets 
    lib_targets
)
akt_show_var(exe_targets)
akt_show_var(lib_targets)