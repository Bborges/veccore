
find_package(Vc REQUIRED)

add_executable(backend backend.cc)
target_link_libraries(backend Vc)

include_directories(${PROJECT_SOURCE_DIR})
add_executable(new-backend new_backend_test.cc)
if (SIMD)
	target_link_libraries(new-backend Vc)
endif()