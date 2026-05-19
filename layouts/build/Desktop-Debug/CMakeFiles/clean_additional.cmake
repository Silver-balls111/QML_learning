# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/applayouts_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/applayouts_autogen.dir/ParseCache.txt"
  "applayouts_autogen"
  )
endif()
