if(NOT DEFINED akt_vscode_gen_c_cpp_properties_included)
set(akt_vscode_gen_c_cpp_properties_included)

macro(akt_vscode_gen_c_cpp_properties)
    list(GET ARGN 0 json_in)
    if(NOT json_in)
        set(json_in ${AKT_DIR}/vscode/c_cpp_properties.json.in)
    endif()
    set(PROP_JSON "${CMAKE_SOURCE_DIR}/.vscode/c_cpp_properties.json")
    if(NOT EXISTS ${PROP_JSON})
        list(APPEND AKT_VSCODE_C_CPP_INCLUDES "\"${CMAKE_SOURCE_DIR}/include\"")
        list(APPEND AKT_VSCODE_C_CPP_INCLUDES "\"${CMAKE_SOURCE_DIR}/src\"")
        list(APPEND AKT_VSCODE_C_CPP_INCLUDES "\"${CMAKE_SOURCE_DIR}/test\"")
        if(HUNTER_ENABLED)
            akt_hunter_get_install_root(hunter_install_root)
            list(APPEND AKT_VSCODE_C_CPP_INCLUDES "\"${hunter_install_root}/include\"")
        endif()
        string(REPLACE ";" ",\n                " 
            AKT_VSCODE_C_CPP_INCLUDES "${AKT_VSCODE_C_CPP_INCLUDES}"
        )
        akt_show_var_debug(CMAKE_C_COMPILER_ID)
        if("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
            set(AKT_VSCODE_COMPILER_ID "clang")
        elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
            set(AKT_VSCODE_COMPILER_ID "msvc")
        else()
            set(AKT_VSCODE_COMPILER_ID "gcc")
        endif()
        if(NOT CMAKE_C_STANDARD)
            set(CMAKE_C_STANDARD 11)
        endif()
        if(NOT CMAKE_CXX_STANDARD)
            set(CMAKE_CXX_STANDARD 17)
        endif()
        configure_file(
            ${json_in}
            ${PROP_JSON}
            @ONLY
        )
    endif()
endmacro()

else()
endif()
