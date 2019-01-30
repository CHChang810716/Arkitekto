if(NOT DEFINED akt_get_filename_component_included)
set(akt_get_filename_component_included)

macro(akt_get_filename_component var filename comp)
    if("NO_EXT" STREQUAL "${comp}" )
        get_filename_component(__dir "${filename}" DIRECTORY)
        get_filename_component(__name_we "${filename}" NAME_WE)
        set(${var} ${__dir}/${__name_we} ${ARGN})
    else()
        get_filename_component(${var} ${filename} ${comp})
    endif()
endmacro()

endif()