# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appRestrauntMenu_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appRestrauntMenu_autogen.dir/ParseCache.txt"
  "appRestrauntMenu_autogen"
  )
endif()
