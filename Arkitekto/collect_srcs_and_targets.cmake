if(NOT DEFINED akt_collect_srcs_and_targets_included)
set(akt_collect_srcs_and_targets_included)

function(akt_collect_srcs_and_targets res_srcs res_targets abs_dir)
    set(__srcs)
    set(__targets)
    file(GLOB __children RELATIVE ${abs_dir} ${abs_dir}/*)
    foreach(rel_child ${__children})
        set(child ${abs_dir}/${rel_child})
        akt_get_filename_component(child_no_ext ${child} NO_EXT)
        if(EXISTS "${child_no_ext}.cmake")
            file(RELATIVE_PATH __child_no_ext_rel_to_src 
                ${CMAKE_SOURCE_DIR}/src
                ${child} 
            )
            akt_target_name(__target_name "${__child_no_ext_rel_to_src}")
            list(APPEND __targets ${__target_name})
            list(REMOVE_DUPLICATES __targets)
            continue()
        endif()
        if(IS_DIRECTORY "${child}")
            set(childs_srcs)
            set(childs_targets)
            akt_collect_srcs_and_targets(childs_srcs childs_targets "${child}")
            list(APPEND __srcs ${childs_srcs})
            list(APPEND __targets ${childs_targets})

        endif()
        if(child MATCHES "^.*(\.cpp|\.cc|\.cxx|\.c)$") # is src
            list(APPEND __srcs ${child})
        endif()
    endforeach()
    
    set(${res_srcs} ${__srcs} PARENT_SCOPE)
    set(${res_targets} ${__targets} PARENT_SCOPE)
endfunction()
else()
endif()
