if(NOT DEFINED akt_config_version_included)
set(akt_config_version_included)

macro(akt_config_version)
    set(optional_args ${ARGN})
    akt_show_var_debug(optional_args)
    list(GET optional_args 0 version_header_path)
    akt_show_var_debug(version_header_path)
    if(version_header_path)
        configure_file(
            ${AKT_DIR}/config_version/version.h.in 
            ${version_header_path} 
            @ONLY
        )
    endif()
    unset(optional_args)
    unset(version_header_path)
endmacro(akt_add_version)


else()
endif()
