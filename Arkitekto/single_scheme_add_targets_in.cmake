if(NOT DEFINED akt_single_scheme_add_targets_in_included)
set(akt_single_scheme_add_targets_in_included)

function(akt_single_scheme_add_targets_in_impl 
    first_level_rel_dir 
    rel_cur_dir 
    default_scheme 
    exe_targets_ 
    lib_targets_ 
)
    akt_show_var_debug(first_level_rel_dir)
    akt_show_var_debug(rel_cur_dir)
    unset(__akt_exe_targets)
    unset(__akt_lib_targets)
    file( GLOB __akt_src_files 
        ${CMAKE_SOURCE_DIR}/${rel_cur_dir}/*.cpp 
        ${CMAKE_SOURCE_DIR}/${rel_cur_dir}/*.cxx 
        ${CMAKE_SOURCE_DIR}/${rel_cur_dir}/*.c 
        ${CMAKE_SOURCE_DIR}/${rel_cur_dir}/*.cc 
    )
    foreach(__akt_src_file ${__akt_src_files})
        akt_message_debug("current configure src: ${__akt_src_file}")
        get_filename_component(file_name ${__akt_src_file} NAME_WE)
        set( __akt_cmake_file "${CMAKE_SOURCE_DIR}/${first_level_rel_dir}/${rel_cur_dir}/${file_name}.cmake")
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
    endforeach()
    akt_get_rel_subdirs(subdirs ${CMAKE_SOURCE_DIR}/${rel_cur_dir})
    foreach(subdir ${subdirs})
        akt_single_scheme_add_targets_in_impl(
            ${first_level_rel_dir} 
            ${rel_cur_dir}/${subdir} 
            ${default_scheme} 
            subdir_exe_targets 
            subdir_lib_targets 
        )
        list(APPEND __akt_exe_targets ${subdir_exe_targets})
        list(APPEND __akt_lib_targets ${subdir_lib_targets})
    endforeach()
    set(${exe_targets_} ${__akt_exe_targets} PARENT_SCOPE)
    set(${lib_targets_} ${__akt_lib_targets} PARENT_SCOPE)
endfunction()

macro(akt_single_scheme_add_targets_in 
    rel_cur_dir 
    default_scheme
    exe_targets_ 
    lib_targets_ 
)
    akt_single_scheme_add_targets_in_impl(
        ${rel_cur_dir} 
        ${default_scheme} 
        ${exe_targets_} 
        ${lib_targets_}
    )
endmacro()

else()
endif()
