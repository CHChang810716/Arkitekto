if(NOT DEFINED akt_target_name_included)
set(akt_target_name_included)

macro(akt_target_name out path_str)
    string( REPLACE "/" "-" ${out} ${path_str})
    string( REPLACE ".cpp" "" ${out} ${${out}})
    string( REPLACE ".cxx" "" ${out} ${${out}})
    string( REPLACE ".cc" "" ${out} ${${out}})
    string( REPLACE ".cmake" "" ${out} ${${out}})
    string( REPLACE ".c" "" ${out} ${${out}})
endmacro()

endif()
