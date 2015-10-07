include(IncludeUrl)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/foo.cmake" "set(FOO 1)\n")
unset(FOO)
include_url("file://${CMAKE_CURRENT_BINARY_DIR}/foo.cmake" QUIET)
if(NOT FOO)
  message(FATAL_ERROR "include_url: ERROR (not included or unexpected content)")
endif()

# Not existing file, OPTIONAL and QUIET enabled (should print no output)
include_url("file://${CMAKE_CURRENT_BINARY_DIR}/bar.cmake" OPTIONAL QUIET)
