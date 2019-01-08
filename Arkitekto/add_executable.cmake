if(NOT DEFINED akt_add_executable_included)
set(akt_add_executable_included)

macro(akt_add_executable tgt exe_tgt_list)
    add_executable(${tgt} ${ARGN})
    list(APPEND ${exe_tgt_list} ${tgt})
endmacro()

else()
endif()
