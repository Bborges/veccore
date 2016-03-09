set(FLAGS_MIC    "-mmic")
set(FLAGS_SSE    "-xsse")
set(FLAGS_SSE2   "-xsse2")
set(FLAGS_SSE3   "-xsse3")
set(FLAGS_SSSE3  "-xssse3")
set(FLAGS_SSE41  "-xsse4.1")
set(FLAGS_SSE42  "-xsse4.2")
set(FLAGS_AVX    "-xAVX")
set(FLAGS_AVX2   "-xCORE-AVX2")
set(FLAGS_NATIVE "-march=native")

if(CMAKE_CXX_STANDARD STREQUAL 11)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(CMAKE_CXX_STANDARD STREQUAL 14)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
else()
  message(FATAL_ERROR "Unsupported C++ standard requested")
endif()

set(CMAKE_CXX_FLAGS_DEBUG          "-O2 -DDEBUG -g")
set(CMAKE_CXX_FLAGS_RELEASE        "-O3 -DNDEBUG -restrict")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O3 -DDEBUG -g -restrict")

if (MIC)
  set(VECCORE_ENABLE_MIC True)
  if (NOT OFFLOAD)
    set(FLAGS_AVX512 "-xMIC-AVX512")
    set(CMAKE_CXX_FLAGS                "${CMAKE_CXX_FLAGS} -fPIC")
    set(CMAKE_CXX_FLAGS_DEBUG          "${CMAKE_CXX_FLAGS_DEBUG} -fp-model precise -w1")
    set(CMAKE_CXX_FLAGS_RELEASE        "${CMAKE_CXX_FLAGS_RELEASE} -fp-model fast -fma")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} -fp-model fast -fma")
    set(CMAKE_SHARED_LINKER_FLAGS      "${CMAKE_SHARED_LINKER_FLAGS} -static-intel")
  else()
    set(VECCORE_ENABLE_MIC_OFFLOAD True)
    set(FLAGS_AVX512 "-xCORE-AVX512")
    set(CMAKE_CXX_FLAGS                "${CMAKE_CXX_FLAGS} -qoffload-option,mic")
  endif()
endif()