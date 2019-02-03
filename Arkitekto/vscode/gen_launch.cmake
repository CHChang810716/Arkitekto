if(NOT DEFINED akt_vscode_gen_launch_included)
set(akt_vscode_gen_launch_included)

macro(akt_vscode_gen_launch)
    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/.vscode/launch.json")
        akt_show_var_debug(AKT_LAUNCH_TASKS)
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
        akt_show_var(__workdir)
        if(NOT EXISTS "${__workdir}")
            file(MAKE_DIRECTORY ${CMAKE_SOURCE_DIR}/workdir)
        endif()
        unset(__workdir)
    endif()
endmacro()

else()
endif()