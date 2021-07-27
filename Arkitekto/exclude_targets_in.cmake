if(NOT DEFINED akt_exclude_targets_in_included)
set(akt_exclude_targets_in_included)

macro(akt_exclude_targets_in dir)
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS_tmp "${dir}/*.cmake")
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS_SRC_tmp 
        "${dir}/*.cpp"
        "${dir}/*.cxx"
        "${dir}/*.c"
        "${dir}/*.cc"
    )
    list(APPEND AKT_EXCLUDED_TARGETS ${AKT_EXCLUDED_TARGETS_tmp})
    list(APPEND AKT_EXCLUDED_TARGETS_SRC ${AKT_EXCLUDED_TARGETS_SRC_tmp})
    unset(AKT_EXCLUDED_TARGETS_tmp)
    unset(AKT_EXCLUDED_TARGETS_SRC_tmp)
endmacro()

else()
endif()
