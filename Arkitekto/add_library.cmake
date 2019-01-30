if(NOT DEFINED akt_add_library_included)
set(akt_add_library_included)

macro(akt_add_library tgt lib_tgt_list)
    add_library(${tgt} ${ARGN})
    list(APPEND ${lib_tgt_list} ${tgt})
endmacro()

else()
endif()
