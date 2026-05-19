# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/apprectangles_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/apprectangles_autogen.dir/ParseCache.txt"
  "apprectangles_autogen"
  )
endif()
