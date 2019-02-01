if(NOT DEFINED akt_get_debugger_included)
set(akt_get_debugger_included)

macro(akt_get_debugger result)
    if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        find_program(${result} gdb)
    elseif( "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
        find_program(${result} lldb)
    endif()
endmacro()


endif()