#   This file is part of Icecream.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

cmake_minimum_required(VERSION 3.7)

project(icecc LANGUAGES CXX C)

SET(CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}/Modules
    ${CMAKE_MODULE_PATH})

set(VERSION "1.2-alpha")
if(NOT DEFINED RUNDIR)
    set(RUNDIR "/opt/icecream/var/run")
endif()
if(NOT DEFINED BINDIR)
    set(BINDIR "${CMAKE_INSTALL_PREFIX}/bin")
endif()

find_package(Libcap-ng)
find_package(LZO REQUIRED)
find_package(TAR REQUIRED)

configure_file(cmake-config.h.in ${PROJECT_BINARY_DIR}/config.h @ONLY)

include_directories(${PROJECT_BINARY_DIR})

add_subdirectory(client)
add_subdirectory(compilerwrapper)
add_subdirectory(daemon)
add_subdirectory(scheduler)
add_subdirectory(services)

if(NOT DEFINED BUILD_EXPIRIMENTAL)
    message(SEND_ERROR "Cmake build is experimental and should not be used")
else()
    message("The following things are known not to be finsihed/working in this build")
    message("Using this build implies you are working to fix something in this list")
    message("    install binaries and headers")
    message("    Create cmake install configuration")
    message("    icecc-create-env")
    message("    build on OSX")
    message("    tests")
    message("    building downstream projects (icemon)")
    message("")
    message("There are likely more")
endif()
