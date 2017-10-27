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


#todo latter
#     icecc-create-env
#    icecc-create-env.in

add_executable(icecc
    arg.cpp
    client.h
    cpp.cpp
    local.cpp
    main.cpp
    md5.c
    md5.h
    remote.cpp
    safeguard.cpp
    util.cpp
    util.h
)

target_link_libraries(icecc
  services
)
