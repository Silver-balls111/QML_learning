# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appchatApp_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appchatApp_autogen.dir/ParseCache.txt"
  "appchatApp_autogen"
  )
endif()
