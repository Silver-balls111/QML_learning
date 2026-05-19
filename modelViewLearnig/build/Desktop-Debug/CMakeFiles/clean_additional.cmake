# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appmodelViewLearnig_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appmodelViewLearnig_autogen.dir/ParseCache.txt"
  "appmodelViewLearnig_autogen"
  )
endif()
