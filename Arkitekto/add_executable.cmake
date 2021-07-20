if(NOT DEFINED akt_add_executable_included)
set(akt_add_executable_included)

macro(akt_add_executable tgt exe_tgt_list)
    add_executable(${tgt} ${ARGN})
    if(NOT DEFINED ${exe_tgt_list})
        set(${exe_tgt_list} "${tgt}" CACHE INTERNAL "global exe target list")
    else()
        set(${exe_tgt_list} "${${exe_tgt_list}};${tgt}" CACHE INTERNAL "global exe target list")
    endif()
endmacro()

else()
endif()
