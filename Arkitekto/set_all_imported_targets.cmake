if(NOT DEFINED akt_set_all_imported_targets_included)
set(akt_set_all_imported_targets_included)

macro(akt_set_all_imported_targets)
  if(NOT DEFINED AKT_IMPORTED_TARGETS)
    get_directory_property(__akt_imported_targets DIRECTORY "${CMAKE_SOURCE_DIR}" IMPORTED_TARGETS)
    set(AKT_IMPORTED_TARGETS ${__akt_imported_targets})
    foreach(ait ${__akt_imported_targets})
      get_target_property(__type ${ait} TYPE)
      if("${__type}" STREQUAL "EXECUTABLE")
        list(REMOVE_ITEM AKT_IMPORTED_TARGETS ${ait})
      endif()
    endforeach()
    foreach(ait ${AKT_IMPORTED_TARGETS_EXCLUDE})
      list(REMOVE_ITEM AKT_IMPORTED_TARGETS ${ait})
    endforeach()
    akt_show_var_debug(AKT_IMPORTED_TARGETS)
  endif()
endmacro()

macro(akt_imported_targets_exclude)
  if(NOT DEFINED AKT_IMPORTED_TARGETS_EXCLUDE)
    set(AKT_IMPORTED_TARGETS_EXCLUDE ${ARGN})
  else()
    set(AKT_IMPORTED_TARGETS_EXCLUDE "${AKT_IMPORTED_TARGETS_EXCLUDE};${ARGN}")
  endif()
endmacro()