if(NOT DEFINED akt_add_targets_in_included)
set(akt_add_targets_in_included)

include(${CMAKE_CURRENT_LIST_DIR}/cmake_based_add_targets_in.cmake)
macro(akt_add_targets_in dir)
    set(CURR_AKT_SRC_ROOT_DIR "${AKT_SRC_ROOT_DIR}")
    set(AKT_SRC_ROOT_DIR ${dir})
    akt_cmake_based_add_targets_in(${dir})
    set(AKT_SRC_ROOT_DIR ${CURR_AKT_SRC_ROOT_DIR})
    unset(CURR_AKT_SRC_ROOT_DIR)
endmacro()


else()
endif()