if(NOT DEFINED akt_src_based_add_targets_in_included)
set(akt_src_based_add_targets_in_included)

function(akt_src_based_add_targets_in_impl 
    first_level_dir 
    rel_cur_dir 
    default_scheme 
)
    akt_show_var_debug(first_level_dir)
    akt_show_var_debug(rel_cur_dir)
    file( GLOB __akt_src_files 
        ${first_level_dir}/${rel_cur_dir}/*.cpp 
        ${first_level_dir}/${rel_cur_dir}/*.cxx 
        ${first_level_dir}/${rel_cur_dir}/*.c 
        ${first_level_dir}/${rel_cur_dir}/*.cc 
    )
    foreach(__akt_src_file ${__akt_src_files})
        akt_message_debug("current configure src: ${__akt_src_file}")
        get_filename_component(file_name ${__akt_src_file} NAME_WE)
        set( __akt_cmake_file "${first_level_dir}/${rel_cur_dir}/${file_name}.cmake")
        set(AKT_CHILD_SRCS ${__akt_src_file})
        file(RELATIVE_PATH __rel_cmake ${AKT_SRC_ROOT_DIR} ${__akt_cmake_file})
        akt_target_name(AKT_TARGET "${__rel_cmake}")
        set(AKT_CHILD_TARGETS) # keep this empty in src mode
        if( EXISTS ${__akt_cmake_file} )
            include(${__akt_cmake_file})
        else()
            akt_show_var_debug(default_scheme)
            if( default_scheme)
                include(${default_scheme})
            else()
                message(WARNING "source file ${__akt_src_file} doesn't have related cmake script")
            endif()
        endif()
        unset(AKT_CHILD_SRCS)
        unset(AKT_CHILD_TARGETS)
        unset(AKT_TARGET)
    endforeach()
    akt_get_rel_subdirs(subdirs ${CMAKE_SOURCE_DIR}/${rel_cur_dir})
    foreach(subdir ${subdirs})
        akt_src_based_add_targets_in_impl(
            ${first_level_dir} 
            ${rel_cur_dir}/${subdir} 
            ${default_scheme} 
        )
    endforeach()
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