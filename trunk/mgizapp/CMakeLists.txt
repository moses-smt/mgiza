PROJECT (mgiza)

SET(MGIZA_VERSION_MAJOR "0")
SET(MGIZA_VERSION_MINOR "6")
SET(MGIZA_VERSION_PATCH "7")

MATH(EXPR MGIZA_INT_VERSION "(${MGIZA_VERSION_MAJOR} * 10000) + (${MGIZA_VERSION_MINOR} * 100) + (${MGIZA_VERSION_PATCH} * 1)" )

SET(MGIZA_VERSION "${MGIZA_VERSION_MAJOR}.${MGIZA_VERSION_MINOR}.${MGIZA_VERSION_PATCH}")

#CMake 2.6+ is recommended to an improved Boost module
CMAKE_MINIMUM_REQUIRED(VERSION 2.6.0 FATAL_ERROR)

IF(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
ENDIF(COMMAND cmake_policy)

IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    SET(CMAKE_INSTALL_PREFIX
        "inst" CACHE PATH "MGIZA install prefix" FORCE
        )
    MESSAGE(STATUS "You have not set the install dir, default to './inst', if
    you want to set it, use cmake -DCMAKE_INSTALL_PREFIX to do so")
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

#set various platform specific global options
IF(WIN32)
 SET(CMAKE_DEBUG_POSTFIX "d")
ENDIF(WIN32)

INCLUDE(cmake/FindTR1.cmake)

# include specific modules
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")


# Find Boost library, specify
# BOOST_ROOT=/e/programs/boost_1_35_0
# BOOST_LIBRARYDIR=$BOOST_ROOT/stage/lib

set(Boost_USE_STATIC_LIBS        ON)
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME    OFF)


FIND_PACKAGE( Boost 1.46 COMPONENTS thread)

 IF(Boost_FOUND)
    IF (NOT _boost_IN_CACHE)
     MESSAGE( "Boost found" )
     message(STATUS "Boost_INCLUDE_DIR    : ${Boost_INCLUDE_DIR}")
    ENDIF (NOT _boost_IN_CACHE)
	LINK_DIRECTORIES ( ${Boost_LIBRARY_DIRS} )
	INCLUDE_DIRECTORIES ( ${Boost_INCLUDE_DIRS} )
ELSE()
    MESSAGE(FATAL_ERROR "Boost not found, please set the BOOST_ROOT and BOOST_LIBRARYDIR environment variables " )
ENDIF()

ADD_SUBDIRECTORY (src)
ADD_SUBDIRECTORY (src/mkcls)
ADD_SUBDIRECTORY (scripts)






