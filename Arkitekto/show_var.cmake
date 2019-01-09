if(NOT DEFINED akt_show_var_included)
set(akt_show_var_included)
    
macro(akt_show_var var)
    message(STATUS "${var} = ${${var}}")
endmacro()
macro(akt_show_var_debug var)
    if(AKT_DEBUG)
        message(STATUS "${var} = ${${var}}")
    endif()
endmacro()

else()
endif()
