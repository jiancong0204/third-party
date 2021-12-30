set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "${PROJECT_SOURCE_DIR}/third-party/")

# glog
add_library(third_party_glog SHARED IMPORTED)
set(GLOG_ROOT_DIR "${PROJECT_SOURCE_DIR}/third-party/glog")
set_target_properties(third_party_glog PROPERTIES
  IMPORTED_LOCATION "${GLOG_ROOT_DIR}/lib/libglog.so"
  INTERFACE_INCLUDE_DIRECTORIES "${GLOG_ROOT_DIR}/include"
)

# gflags
add_library(third_party_gflags STATIC IMPORTED)
set(GFLAGS_ROOT_DIR "${PROJECT_SOURCE_DIR}/third-party/gflags")
set_target_properties(third_party_gflags PROPERTIES
  IMPORTED_LOCATION "${GFLAGS_ROOT_DIR}/lib/libgflags.a"
  INTERFACE_INCLUDE_DIRECTORIES "${GFLAGS_ROOT_DIR}/include"
)

# jsoncpp
add_library(third_party_jsoncpp SHARED IMPORTED)
set(JSONCPP_ROOT_DIR "${PROJECT_SOURCE_DIR}/third-party/jsoncpp")
set_target_properties(third_party_jsoncpp PROPERTIES
  IMPORTED_LOCATION "${JSONCPP_ROOT_DIR}/lib/libjsoncpp.so"
  INTERFACE_INCLUDE_DIRECTORIES "${JSONCPP_ROOT_DIR}/include"
)

# eigen3
find_package(Eigen3 REQUIRED)
message("Found Eigen version: ${Eigen3_VERSION}")

# boost
set(Boost_LIBRARY_DIR "${PROJECT_SOURCE_DIR}/third-party/boost/lib")
set(Boost_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/third-party/boost/include")
find_package(Boost 1.63.0 EXACT REQUIRED)
message("Found Boost version: ${Boost_VERSION}")

set(THIRD_PARTY_LIBS
  third_party_jsoncpp
  third_party_glog
  third_party_gflags
  Eigen3::Eigen
  ${Boost_LIBRARIES}
)

SET(THIRD_PARTY_INCLUDE
  ${Boost_INCLUDE_DIRS}
  ${Eigen3_INCLUDE_DIR}
)
 