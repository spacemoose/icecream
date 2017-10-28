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

project(icecc LANGUAGES CXX)

SET(CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/Modules
  ${CMAKE_MODULE_PATH})

set(VERSION "1.2-alpba")
set(RUNDIR "/opt/icecream/var/run")

find_package(Libcap-ng)
find_package(LZO REQUIRED)
find_package(TAR REQUIRED)

set(BINDIR "${CMAKE_INSTALL_PREFIX}/bin")


configure_file(cmake-config.h.in ${PROJECT_BINARY_DIR}/config.h @ONLY)

include_directories(${PROJECT_BINARY_DIR})

add_subdirectory(client)
add_subdirectory(daemon)
add_subdirectory(scheduler)
add_subdirectory(services)

if(NOT DEFINED BUILD_EXPIRIMENTAL)
    message(SEND_ERROR "Cmake build is experimental and should not be used")
endif()
