# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appanchors_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appanchors_autogen.dir/ParseCache.txt"
  "appanchors_autogen"
  )
endif()
