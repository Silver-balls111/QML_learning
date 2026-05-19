# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/apppositioners_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/apppositioners_autogen.dir/ParseCache.txt"
  "apppositioners_autogen"
  )
endif()
