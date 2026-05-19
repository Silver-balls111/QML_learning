# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appclimateControls_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appclimateControls_autogen.dir/ParseCache.txt"
  "appclimateControls_autogen"
  )
endif()
