# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appquickControls_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appquickControls_autogen.dir/ParseCache.txt"
  "appquickControls_autogen"
  )
endif()
