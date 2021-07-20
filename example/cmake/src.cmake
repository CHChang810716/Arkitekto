unset(exe_targets CACHE)
unset(lib_targets CACHE)
akt_src_based_add_targets_in(
    ${CMAKE_SOURCE_DIR}/src/example/srcBased
    ${CMAKE_CURRENT_LIST_DIR}/schemes/exe.cmake 
)
akt_show_var(exe_targets)
akt_show_var(lib_targets)