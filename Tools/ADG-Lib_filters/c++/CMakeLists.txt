cmake_minimum_required(VERSION 3.16)
project(ADGLibConverter LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Require Bison and Flex
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

# GCL parser and scanner
BISON_TARGET(ParserGCL parser_gcl.yy ${CMAKE_CURRENT_BINARY_DIR}/parser_gcl.cc
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser_gcl.hh)
FLEX_TARGET(ScannerGCL scanner_gcl.ll ${CMAKE_CURRENT_BINARY_DIR}/scanner_gcl.cc)
ADD_FLEX_BISON_DEPENDENCY(ScannerGCL ParserGCL)

# JGEX parser and scanner
BISON_TARGET(ParserJGEX parser_jgex.yy ${CMAKE_CURRENT_BINARY_DIR}/parser_jgex.cc
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser_jgex.hh)
FLEX_TARGET(ScannerJGEX scanner_jgex.ll ${CMAKE_CURRENT_BINARY_DIR}/scanner_jgex.cc)
ADD_FLEX_BISON_DEPENDENCY(ScannerJGEX ParserJGEX)

# Include directory for generated headers
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Sources
set(SOURCES
    main.cc
    driver.cc driver.hh

    driver_gcl.cc driver_gcl.hh
    ${BISON_ParserGCL_OUTPUTS}
    ${FLEX_ScannerGCL_OUTPUTS}

    driver_jgex.cc driver_jgex.hh
    ${BISON_ParserJGEX_OUTPUTS}
    ${FLEX_ScannerJGEX_OUTPUTS}

    eliminate_lines.cc eliminate_lines.hh
    eliminate_functions.cc eliminate_functions.hh
    eliminate_dg.cc eliminate_dg.hh
    expression.cc expression.hh
    printer.hh
    printer_gcl.cc printer_gcl.hh
    printer_ggb.cc printer_ggb.hh
    printer_tptp.cc printer_tptp.hh
    printer_argodg.cc printer_argodg.hh
)

# Final binary
add_executable(adg_lib_converter ${SOURCES})
