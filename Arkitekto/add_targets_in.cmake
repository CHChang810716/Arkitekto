if(NOT DEFINED akt_add_targets_in_included)
set(akt_add_targets_in_included)

macro(akt_add_targets_in dir)
    file(GLOB_RECURSE __cmake_files "${dir}/*.cmake")
    foreach(__cf ${__cmake_files})
        akt_get_filename_component(__cf_no_ext ${__cf} NO_EXT)
        if(IS_DIRECTORY ${__cf_no_ext})
            akt_collect_srcs_and_targets(
                AKT_CHILD_SRCS AKT_CHILD_TARGETS ${__cf_no_ext}
            )
        else()
            set(AKT_CHILD_SRCS)
            set(AKT_CHILD_TARGETS)
        endif()
        foreach(src_ext "c" "cpp" "cc" "cxx")
            set(src_name ${__cf_no_ext}.${src_ext})
            if(EXISTS "${src_name}")
                list(APPEND AKT_CHILD_SRCS ${src_name})
            endif()
        endforeach()
        file(RELATIVE_PATH __rel_cmake ${dir} ${__cf})
        akt_target_name(AKT_TARGET "${__rel_cmake}")
        include(${__cf})
        unset(AKT_CHILD_SRCS)
        unset(AKT_CHILD_TARGETS)
    endforeach()
    
endmacro()


else()
endif()