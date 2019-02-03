if(NOT DEFINED akt_hunter_get_install_root_included)
set(akt_hunter_get_install_root_included)

macro(akt_hunter_get_install_root result)
    file(READ "${CMAKE_BINARY_DIR}/_3rdParty/Hunter/install-root-dir" ${result})
endmacro()


endif()