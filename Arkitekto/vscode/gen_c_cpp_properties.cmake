if(NOT DEFINED akt_gen_c_cpp_properties_included)
set(akt_gen_c_cpp_properties_included)

macro(akt_gen_c_cpp_properties json_in)
    set(PROP_JSON "${CMAKE_SOURCE_DIR}/.vscode/c_cpp_properties.json")
    if(NOT EXISTS ${PROP_JSON})
        configure_file(
            ${json_in}
            ${PROP_JSON}
            @ONLY
        )
    endif()
endmacro()

else()
endif()
