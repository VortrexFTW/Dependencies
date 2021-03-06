
if(WIN32)
	set(DEPENDENCIES_PATH "$ENV{dependencies}" CACHE PATH "Dependencies location")

	if(DEPENDENCIES_PATH STREQUAL "")
		message(FATAL_ERROR "Invalid dependencies path")
	endif()

	include_directories("${DEPENDENCIES_PATH}/include")

	set(DEPENDENCIES_LIBS "${DEPENDENCIES_PATH}/${LIB_DIRECTORY}")
endif()

if(MSVC)
	set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} /LIBPATH:\"${DEPENDENCIES_LIBS}/Debug\"")
	set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} /LIBPATH:\"${DEPENDENCIES_LIBS}/Release\"")
	set(CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO "${CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO} /LIBPATH:\"${DEPENDENCIES_LIBS}/Release\"")

	set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} /LIBPATH:\"${DEPENDENCIES_LIBS}/Debug\"")
	set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} /LIBPATH:\"${DEPENDENCIES_LIBS}/Release\"")
	set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "${CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO} /LIBPATH:\"${DEPENDENCIES_LIBS}/Release\"")
endif()
