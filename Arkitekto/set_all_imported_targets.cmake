if(NOT DEFINED akt_set_all_imported_targets_included)
set(akt_set_all_imported_targets_included)

if(NOT DEFINED AKT_ALL_IMPORTED_TARGETS)
  get_directory_property(AKT_IMPORTED_TARGETS DIRECTORY "${CMAKE_SOURCE_DIR}" IMPORTED_TARGETS)
  akt_show_var_debug(AKT_IMPORTED_TARGETS)
endif()

else()
endif()