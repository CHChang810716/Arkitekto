if(NOT DEFINED akt_src_based_add_targets_in_included)
set(akt_src_based_add_targets_in_included)

include(${CMAKE_CURRENT_LIST_DIR}/set_all_imported_targets.cmake)

function(akt_src_based_add_targets_in_impl 
    first_level_dir 
    rel_cur_dir 
    default_scheme 
)
    akt_set_all_imported_targets()
    akt_show_var_debug(first_level_dir)
    akt_show_var_debug(rel_cur_dir)
    file(GLOB __akt_src_files 
        ${first_level_dir}/${rel_cur_dir}/*.cpp 
        ${first_level_dir}/${rel_cur_dir}/*.cxx 
        ${first_level_dir}/${rel_cur_dir}/*.c 
        ${first_level_dir}/${rel_cur_dir}/*.cc 
    )
    if(AKT_EXCLUDED_TARGETS_SRC)
        foreach(__src ${AKT_EXCLUDED_TARGETS_SRC})
            list(REMOVE_ITEM __akt_src_files ${__src})
        endforeach()
    endif()
    set(__akt_has_cmake)
    foreach(__akt_src_file ${__akt_src_files})
        akt_message_debug("current configure src: ${__akt_src_file}")
        get_filename_component(file_name ${__akt_src_file} NAME_WE)
        set(__akt_stem_file "${first_level_dir}/${rel_cur_dir}/${file_name}")
        set(__akt_cmake_file "${__akt_stem_file}.cmake")
        file(RELATIVE_PATH __rel_cmake ${AKT_SRC_ROOT_DIR} ${__akt_cmake_file})
        akt_target_name(AKT_TARGET "${__rel_cmake}")
        set(AKT_CHILD_SRCS)
        set(AKT_CHILD_TARGETS)
        set(AKT_SRC ${__akt_src_file})
        if(EXISTS ${__akt_cmake_file})
            akt_collect_srcs_and_targets(
                AKT_CHILD_SRCS AKT_CHILD_TARGETS ${__akt_stem_file}
            )
            include(${__akt_cmake_file})
            list(APPEND __akt_has_cmake ${file_name})
        else()
            akt_show_var_debug(default_scheme)
            if(default_scheme)
                include(${default_scheme})
            else()
                message(WARNING "Source file ${__akt_src_file} doesn't have related cmake script.")
                message(WARNING "Please check parameter: default_scheme of akt_src_based_add_targets_in is specified corretly.")
            endif()
        endif()
        unset(AKT_CHILD_SRCS)
        unset(AKT_CHILD_TARGETS)
        unset(AKT_TARGET)
    endforeach()
    akt_get_rel_subdirs(subdirs ${first_level_dir}/${rel_cur_dir})
    foreach(subdir ${subdirs})
        list(FIND __akt_has_cmake ${subdir} __found)
        akt_show_var_debug(subdir)
        akt_show_var_debug(__akt_has_cmake)
        akt_show_var_debug(__found)
        if(${__found} EQUAL -1)
            akt_src_based_add_targets_in_impl(
                ${first_level_dir} 
                ${rel_cur_dir}/${subdir} 
                ${default_scheme} 
            )
        endif()
        unset(__found)
    endforeach()
    unset(__akt_has_cmake)
endfunction()
macro(akt_src_based_add_targets_in 
    dir 
    default_scheme
)
    if(NOT DEFINED AKT_SRC_ROOT_DIR)
        set(AKT_SRC_ROOT_DIR "${CMAKE_SOURCE_DIR}/src")
    endif()
    akt_get_debugger(AKT_DEBUGGER)
    akt_src_based_add_targets_in_impl(
        ${dir} 
        "." 
        ${default_scheme} 
    )
    unset(AKT_DEBUGGER)
endmacro()

else()
endif()