include(GNUInstallDirs)
akt_cmake_package()
install(
    TARGETS ${exe_targets} ${lib_targets} ${test_targets}
    EXPORT ${AKT_TARGETS_EXPORT}
    BUNDLE DESTINATION . COMPONENT Runtime
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Runtime
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT Library
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT Develop
)
file(GLOB_RECURSE headers 
    ${CMAKE_SOURCE_DIR}/src/*.h 
    ${CMAKE_SOURCE_DIR}/src/*.hpp 
)
foreach(header ${headers})
    string(REPLACE 
        "${CMAKE_SOURCE_DIR}/src" "include" 
        dest_header 
        ${header}
    )
    get_filename_component(inst_des ${dest_header} DIRECTORY)
    install(FILES ${header}
        DESTINATION ${inst_des})
endforeach()
unset(exe_targets CACHE)
unset(test_targets CACHE)
unset(lib_targets CACHE)