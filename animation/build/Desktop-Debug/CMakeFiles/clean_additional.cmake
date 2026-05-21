# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appanimation_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appanimation_autogen.dir/ParseCache.txt"
  "appanimation_autogen"
  )
endif()
