if(NOT DEFINED akt_vscode_add_to_launch_included)
set(akt_vscode_add_to_launch_included)

macro(akt_vscode_add_to_launch target)
    if(NOT AKT_VSCODE_LAUNCH_TASK_TMP)
        set(AKT_VSCODE_LAUNCH_TASK_TMP ${CMAKE_BINARY_DIR}/akt_vscode_launch_tmp)
    endif()
    set(__launch_task_name ${target})
    akt_get_debugger(__debugger)
    if(MSVC)
        set(__template ${AKT_DIR}/vscode/launch_msvc.in)
    else()
        set(__template ${AKT_DIR}/vscode/launch_gdb.in)
    endif()
    configure_file(
        ${__template}
        ${AKT_VSCODE_LAUNCH_TASK_TMP}
    )
    unset(__launch_task_name)
    unset(__debugger)
    unset(__template)
    file(READ 
        ${AKT_VSCODE_LAUNCH_TASK_TMP} 
        __launch_task
    )
    list(APPEND AKT_LAUNCH_TASKS ${__launch_task})
    file(REMOVE 
        ${AKT_VSCODE_LAUNCH_TASK_TMP} 
    )
endmacro(akt_vscode_add_to_launch )

else()
endif()