if(NOT DEFINED akt_exclude_targets_in_included)
set(akt_exclude_targets_in_included)

macro(akt_exclude_targets_in dir)
    cmake_path(SET __akt_dir NORMALIZE "${dir}")
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS_tmp "${__akt_dir}/*.cmake")
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS_SRC_tmp 
        "${__akt_dir}/*.cpp"
        "${__akt_dir}/*.cxx"
        "${__akt_dir}/*.c"
        "${__akt_dir}/*.cc"
    )
    list(APPEND AKT_EXCLUDED_TARGETS ${AKT_EXCLUDED_TARGETS_tmp})
    list(APPEND AKT_EXCLUDED_TARGETS_SRC ${AKT_EXCLUDED_TARGETS_SRC_tmp})
    unset(AKT_EXCLUDED_TARGETS_tmp)
    unset(AKT_EXCLUDED_TARGETS_SRC_tmp)
    unset(__akt_dir)
endmacro()

else()
endif()
