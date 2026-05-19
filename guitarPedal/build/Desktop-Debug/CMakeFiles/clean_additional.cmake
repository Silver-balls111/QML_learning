# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appguitarPedal_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appguitarPedal_autogen.dir/ParseCache.txt"
  "appguitarPedal_autogen"
  )
endif()
