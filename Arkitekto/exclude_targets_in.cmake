if(NOT DEFINED akt_exclude_targets_in_included)
set(akt_exclude_targets_in_included)

macro(akt_exclude_targets_in dir)
    file(GLOB_RECURSE AKT_EXCLUDED_TARGETS "${dir}/*.cmake")
endmacro()

else()
endif()
