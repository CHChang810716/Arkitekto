cmake_minimum_required(VERSION 3.10)
project(Arkitekto)
include(CMakePackageConfigHelpers)
set(proj_conf ${CMAKE_CURRENT_BINARY_DIR}/generated/${PROJECT_NAME}Config.cmake)
set(conf_inst_dir lib/cmake/${PROJECT_NAME})
configure_package_config_file(
    Config.cmake.in
    ${proj_conf}
    INSTALL_DESTINATION ${conf_inst_dir}
)
install(DIRECTORY Arkitekto 
    DESTINATION ${conf_inst_dir}/../)
install(FILES ${proj_conf}
    DESTINATION ${conf_inst_dir})