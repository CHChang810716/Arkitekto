if(NOT DEFINED akt_vscode_add_to_launch_included)
set(akt_vscode_add_to_launch_included)

macro(akt_vscode_add_to_launch target)
    if(NOT AKT_VSCODE_LAUNCH_TASK_TMP)
        set(AKT_VSCODE_LAUNCH_TASK_TMP ${CMAKE_BINARY_DIR}/akt_vscode_launch_task_tmp)
    endif()
    if(NOT AKT_VSCODE_LAUNCH_TMP)
        set(AKT_VSCODE_LAUNCH_TMP ${CMAKE_BINARY_DIR}/akt_vscode_launch_tmp)
    endif()
    set(AKT_TARGET ${target})
    akt_get_debugger(AKT_DEBUGGER)
    if(MSVC)
        if(DEFINED AKT_VSCODE_MSVC_TASK_TMPL AND EXISTS "${AKT_VSCODE_MSVC_TASK_TMPL}")
            set(__template "${AKT_VSCODE_MSVC_TASK_TMPL}")
        else()
            set(__template ${AKT_DIR}/vscode/launch_msvc.in)
        endif()
    else()
        if(DEFINED AKT_VSCODE_GCC_TASK_TMPL AND EXISTS "${AKT_VSCODE_GCC_TASK_TMPL}")
            set(__template "${AKT_VSCODE_GCC_TASK_TMPL}")
        else()
            set(__template ${AKT_DIR}/vscode/launch_gdb.in)
        endif()
    endif()
    akt_show_var_debug(__template)
    akt_show_var_debug(AKT_VSCODE_LAUNCH_TASK_TMP)
    configure_file(
        ${__template}
        ${AKT_VSCODE_LAUNCH_TASK_TMP}
    )
    unset(AKT_TARGET)
    unset(AKT_DEBUGGER)
    unset(__template)
    file(READ 
        ${AKT_VSCODE_LAUNCH_TASK_TMP} 
        __launch_task
    )
    # list(APPEND AKT_LAUNCH_TASKS ${__launch_task})
    file(REMOVE 
        ${AKT_VSCODE_LAUNCH_TASK_TMP} 
    )
    if(EXISTS "${AKT_VSCODE_LAUNCH_TMP}")
        file(APPEND "${AKT_VSCODE_LAUNCH_TMP}" ", ${__launch_task}")
    else()
        file(APPEND "${AKT_VSCODE_LAUNCH_TMP}" "${__launch_task}")
    endif()
endmacro(akt_vscode_add_to_launch )

else()
endif()