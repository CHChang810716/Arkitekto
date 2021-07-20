if(NOT DEFINED akt_add_library_included)
set(akt_add_library_included)

macro(akt_add_library tgt lib_tgt_list)
    add_library(${tgt} ${ARGN})
    if(NOT DEFINED ${lib_tgt_list})
        set(${lib_tgt_list} "${tgt}" CACHE INTERNAL "global lib target list")
    else()
        set(${lib_tgt_list} "${${lib_tgt_list}};${tgt}" CACHE INTERNAL "global lib target list")
    endif()
endmacro()

else()
endif()
