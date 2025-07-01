cmake_minimum_required(VERSION 3.16)
project(ADGLibConverter LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Require Bison and Flex
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBZIP libzip)

include_directories(${LIBZIP_INCLUDE_DIRS})
link_directories(${LIBZIP_LIBRARY_DIRS})

# GCL parser and scanner
BISON_TARGET(ParserGCL parsers/parser_gcl.yy ${CMAKE_CURRENT_BINARY_DIR}/parser_gcl.cc
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser_gcl.hh)
FLEX_TARGET(ScannerGCL parsers/scanner_gcl.ll ${CMAKE_CURRENT_BINARY_DIR}/scanner_gcl.cc)
ADD_FLEX_BISON_DEPENDENCY(ScannerGCL ParserGCL)

# JGEX parser and scanner
BISON_TARGET(ParserJGEX parsers/parser_jgex.yy ${CMAKE_CURRENT_BINARY_DIR}/parser_jgex.cc
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser_jgex.hh)
FLEX_TARGET(ScannerJGEX parsers/scanner_jgex.ll ${CMAKE_CURRENT_BINARY_DIR}/scanner_jgex.cc)
ADD_FLEX_BISON_DEPENDENCY(ScannerJGEX ParserJGEX)

# TPTP parser and scanner
BISON_TARGET(ParserTPTP parsers/parser_tptp.yy ${CMAKE_CURRENT_BINARY_DIR}/parser_tptp.cc
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser_tptp.hh)
FLEX_TARGET(ScannerTPTP parsers/scanner_tptp.ll ${CMAKE_CURRENT_BINARY_DIR}/scanner_tptp.cc)
ADD_FLEX_BISON_DEPENDENCY(ScannerTPTP ParserTPTP)

# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/parsers)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/printers)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/transformers)
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Sources
set(SOURCES
    main.cc
    expression.cc expression.hh

    # Transformsrs
    transformers/eliminate_lines.cc transformers/eliminate_lines.hh
    transformers/eliminate_functions.cc transformers/eliminate_functions.hh
    transformers/eliminate_dg.cc transformers/eliminate_dg.hh
    
    # Parsers
    parsers/driver.cc parsers/driver.hh
    
    parsers/driver_gcl.cc parsers/driver_gcl.hh
    ${BISON_ParserGCL_OUTPUTS}
    ${FLEX_ScannerGCL_OUTPUTS}

    parsers/driver_jgex.cc parsers/driver_jgex.hh
    ${BISON_ParserJGEX_OUTPUTS}
    ${FLEX_ScannerJGEX_OUTPUTS}

    parsers/driver_tptp.cc parsers/driver_tptp.hh
    ${BISON_ParserTPTP_OUTPUTS}
    ${FLEX_ScannerTPTP_OUTPUTS}

    # Printers
    printers/printer.hh
    printers/printer_gcl.cc printers/printer_gcl.hh
    printers/printer_ggb.cc printers/printer_ggb.hh
    printers/printer_tptp.cc printers/printer_tptp.hh
    printers/printer_argodg.cc printers/printer_argodg.hh
    printers/printer_geocoq.cc printers/printer_geocoq.hh
)

add_executable(adg_lib_converter ${SOURCES})

# Link LibZip if found
if (LIBZIP_FOUND)
  add_compile_definitions(LIBZIP)
  target_link_libraries(adg_lib_converter PRIVATE ${LIBZIP_LIBRARIES})
  include_directories(${ZIP_INCLUDE_DIR})
else()
  target_link_libraries(adg_lib_converter)
  message(WARNING "LibZip not found. GGB export will be disabled.")
endif()
