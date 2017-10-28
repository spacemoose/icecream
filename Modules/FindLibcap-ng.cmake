#.rst:
# FindLibcap-ng
# -------
#
# Find Libcap-ng library
#
# Try to find Libcap library. The following values are defined
#
#
#   Libcap-ng_FOUND         - True if Libcap-ng is available
#   Libcap-ng_INCLUDE_DIRS  - Include directories for Libcap-ng
#   Libcap-ng_LIBRARIES     - List of libraries for Libcap-ng
#
# and the following imported targets:
#
# ``Libcap-ng::Libcap-ng``
#
# In general we recommend using the imported targets, as they are easier to use
# and provide more control.  Bear in mind, however, that if any target is in the
# link interface of an exported library, it must be made available by the
# package config file.

#=============================================================================
# Copyright 2017 Henry Miller <hank@millerfarm.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#=============================================================================

find_library(Libcap-ng_LIBRARY NAMES cap-ng)
find_path(Libcap-ng_INCLUDE_DIRS cap-ng.h)

include(FeatureSummary)
set_package_properties(Libcapng PROPERTIES
   URL "https://people.redhat.com/sgrubb/libcap-ng/"
   DESCRIPTION "Library for getting and setting POSIX capabilities")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libcapng REQUIRED_VARS Libcapng_LIBRARY Libcapng_INCLUDE_DIRS)

IF(Libcap-ng_FOUND)
  IF(NOT TARGET Libcap-ng::Libcap-ng)
    add_library(Libcap-ng::Libcap-ng UNKNOWN IMPORTED)
    set_target_properties(Libcap-ng::Libcap-ng PROPERTIES
        IMPORTED_LOCATION "${Libcap-ng_LIBRARY}"
        INTERFACE_COMPILE_OPTIONS "-DHAVE_LIBCAP_NG"
        INTERFACE_INCLUDE_DIRECTORIES "${Libcap-ng_INCLUDE_DIRS}"
    )
  ENDIF()
ENDIF()

mark_as_advanced(Libcap-ng_LIBRARY Libcap-ng_INCLUDE_DIRS)
