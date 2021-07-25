if(NOT DEFINED akt_vscode_gen_launch_included)
set(akt_vscode_gen_launch_included)

macro(akt_vscode_gen_launch)
    if(NOT AKT_VSCODE_LAUNCH_TMP)
        set(AKT_VSCODE_LAUNCH_TMP ${CMAKE_BINARY_DIR}/akt_vscode_launch_tmp)
    endif()
    file(READ "${AKT_VSCODE_LAUNCH_TMP}" AKT_LAUNCH_TASKS)
    akt_show_var_debug(AKT_LAUNCH_TASKS)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/.vscode/launch.json")
        set(
            __template 
            ${AKT_DIR}/vscode/launch.json.in 
        )
        akt_show_var_debug(__template)
        if(NOT DEFINED AKT_WORKDIR)
            set(AKT_WORKDIR ${CMAKE_CURRENT_BINARY_DIR}/akt_workdir)
        endif()
        if(NOT EXISTS "${AKT_WORKDIR}")
            file(MAKE_DIRECTORY ${AKT_WORKDIR})
        endif()
        akt_show_var_debug(AKT_WORKDIR)
        configure_file(
            ${__template}
            ${CMAKE_SOURCE_DIR}/.vscode/launch.json
            @ONLY
        )
        unset(AKT_WORKDIR)
        unset(__template)
    endif()
    file(REMOVE "${AKT_VSCODE_LAUNCH_TMP}")
endmacro()

else()
endif()