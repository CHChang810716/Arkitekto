if(NOT DEFINED akt_path_to_target_name_included)
set(akt_path_to_target_name_included)

macro(akt_path_to_target_name path_str out)
    string( REPLACE "/" "-" ${out} ${${path_str}})
    string( REPLACE ".cpp" "" ${out} ${${out}})
    # akt_show_var(${out})
endmacro()

endif()
