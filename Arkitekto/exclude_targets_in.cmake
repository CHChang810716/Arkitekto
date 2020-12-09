if(NOT DEFINED akt_exclude_targets_in_included)
set(akt_exclude_targets_in_included)

macro(akt_exclude_targets_in dir)
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS_tmp "${dir}/*.cmake")
    list(APPEND AKT_EXCLUDED_TARGETS ${AKT_EXCLUDED_TARGETS_tmp})
    unset(AKT_EXCLUDED_TARGETS_tmp)
endmacro()

else()
endif()
