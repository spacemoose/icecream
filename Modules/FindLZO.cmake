# - Find LZO library
# Find the native LZO includes and library
# This module defines
#  LZO_INCLUDE_DIRS, where to find lzo1x.h, Set when
#                        LZO_INCLUDE_DIR is found.
#  LZO_LIBRARIES, libraries to link against to use LZO.
#  LZO_ROOT_DIR, The base directory to search for LZO.
#                    This can also be an environment variable.
#  LZO_FOUND, If false, do not try to use LZO.
#
# also defined, but not for general use are
#  LZO_LIBRARY, where to find the LZO library.

#=============================================================================
# Copyright 2015 Blender Foundation.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#
# icecc note - this file was copied from Blender 
# https://git.blender.org/gitweb/gitweb.cgi/blender.git/blob_plain/HEAD:/build_files/cmake/Modules/FindLZO.cmake
# which only includes a GNU Copyright notice. It isn't clear which
# license is in actual use.  However we believe that even in abscence of
# a formal statement of copyright, OSI-approved BSD License is sufficient 
# permission for us to copy this file.
#=============================================================================

# If LZO_ROOT_DIR was defined in the environment, use it.
IF(NOT LZO_ROOT_DIR AND NOT $ENV{LZO_ROOT_DIR} STREQUAL "")
  SET(LZO_ROOT_DIR $ENV{LZO_ROOT_DIR})
ENDIF()

SET(_lzo_SEARCH_DIRS
  ${LZO_ROOT_DIR}
  /usr/local
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
)

FIND_PATH(LZO_INCLUDE_DIR lzo/lzo1x.h
  HINTS
    ${_lzo_SEARCH_DIRS}
  PATH_SUFFIXES
    include
)

FIND_LIBRARY(LZO_LIBRARY
  NAMES
    lzo2
  HINTS
    ${_lzo_SEARCH_DIRS}
  PATH_SUFFIXES
    lib64 lib
  )

# handle the QUIETLY and REQUIRED arguments and set LZO_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LZO DEFAULT_MSG
  LZO_LIBRARY LZO_INCLUDE_DIR)

IF(LZO_FOUND)
  SET(LZO_LIBRARIES ${LZO_LIBRARY})
  SET(LZO_INCLUDE_DIRS ${LZO_INCLUDE_DIR})

  IF(NOT TARGET LZO::lzo)
    add_library(LZO::lzo UNKNOWN IMPORTED)
    set_target_properties(LZO::lzo PROPERTIES
        IMPORTED_LOCATION "${LZO_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${LZO_INCLUDE_DIR}"
    )
  ENDIF()
ENDIF(LZO_FOUND)

MARK_AS_ADVANCED(
  LZO_INCLUDE_DIR
  LZO_LIBRARY
)
