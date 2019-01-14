if(NOT DEFINED akt_message_included)
    
macro(akt_message str)
    message(STATUS "akt [MSG}: ${str}")
endmacro()
macro(akt_message_debug str)
    if(AKT_DEBUG)
        message(STATUS "akt [DBG]: ${str}")
    endif()
endmacro()

else()
set(akt_message_included)
endif()
