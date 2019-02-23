if(NOT DEFINED akt_vscode_gen_launch_included)
set(akt_vscode_gen_launch_included)

macro(akt_vscode_gen_launch)
    string(REPLACE "\n;" ",\n" tmp "${AKT_LAUNCH_TASKS}")
    set(AKT_LAUNCH_TASKS ${tmp})
    akt_show_var_debug(AKT_LAUNCH_TASKS)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/.vscode/launch.json")
        set(
            __template 
            ${AKT_DIR}/vscode/launch.json.in 
        )
        akt_show_var_debug(__template)
        configure_file(
            ${__template}
            ${CMAKE_SOURCE_DIR}/.vscode/launch.json
            @ONLY
        )
        unset(__template)
        set(__workdir ${CMAKE_SOURCE_DIR}/workdir)
        akt_show_var_debug(__workdir)
        if(NOT EXISTS "${__workdir}")
            file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/workdir)
        endif()
        unset(__workdir)
    endif()
endmacro()

else()
endif()