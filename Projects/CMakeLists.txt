
if(MSVC)
	# no deprecated warnings for winsock
	add_definitions(-D_WINSOCK_DEPRECATED_NO_WARNINGS)

	# macro redefinition
	disable_warning(4005)

	# signed/unsigned mismatch
	disable_warning(4018)

	# different 'modifier' qualifiers
	disable_warning(4090)

	# ignored on left of 'type' when no variable is declared
	disable_warning(4091)

	# unary minus operator applied to unsigned type, result still unsigned
	disable_warning(4146)

	# conversion from 'type1' to 'type2', possible loss of data
	disable_warning(4242)

	# conversion from 'type1' to 'type2', possible loss of data
	disable_warning(4244)

	# conversion from 'type1' to 'type2', signed/unsigned mismatch
	disable_warning(4245)

	# conversion from 'size_t' to 'type', possible loss of data
	disable_warning(4267)

	# operator' : result of 32-bit shift implicitly converted to 64 bits (was 64-bit shift intended?)
	disable_warning(4334)

	# signed/unsigned mismatch
	disable_warning(4389)

	# conversion from 'type_1' to 'type_2' requires a narrowing conversion
	disable_warning(4838)

	# 64-bit specific warnings
	if(CMAKE_SIZEOF_VOID_P EQUAL 8)
		# operation' : conversion from 'type1' to 'type2' of greater size
		disable_warning(4312)
	endif()

	if(MSVC_VERSION LESS 1900)
		# Visual studio 2015 adds support for stdbool.h, add it for older versions
		include_directories("${CMAKE_CURRENT_SOURCE_DIR}/stdbool")
	endif()
endif()

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/zlib-1.2.11/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/png-1.6.24/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/ogg-1.3.3/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/lua-5.3.4/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/freetype-2.8.1/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/squirrel-3.1/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/sqstdlib-3.1/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/tinyxml-2.6.2/include")
if(COMPILER_SUPPORTS_CXX11 AND MSVC)
	include_directories("${CMAKE_CURRENT_SOURCE_DIR}/libressl-2.6.4/src/include")
endif()
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/libzip-1.5.1/src/include")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/rapidjson-1.1.0/include")

add_subdirectory(zlib-1.2.11)
add_subdirectory(png-1.6.24)
add_subdirectory(ogg-1.3.3)
add_subdirectory(vorbis-1.3.6)
if(COMPILER_SUPPORTS_CXX11)
	add_subdirectory(flac-1.3.2)
	add_subdirectory(theora-1.1.1)
endif()
add_subdirectory(RakNet-4.081)
add_subdirectory(lua-5.3.4)
add_subdirectory(freetype-2.8.1)
add_subdirectory(squirrel-3.1)
add_subdirectory(sqstdlib-3.1)
add_subdirectory(tinyxml-2.6.2)
add_subdirectory(asmjit-1.0.0)
if(COMPILER_SUPPORTS_CXX11 AND MSVC)
	add_subdirectory(discord-rpc-3.3.0)
	add_subdirectory(libressl-2.6.4)
endif()
add_subdirectory(libzip-1.5.1)
add_subdirectory(rapidjson-1.1.0)
if(COMPILER_SUPPORTS_CXX11)
	add_subdirectory(curl-7.57.0)
	add_subdirectory(SDL-2.0.9)
	add_subdirectory(mongoose-6.10)
	add_subdirectory(sqlite-3.22.0)
endif()
add_subdirectory(enet-1.3.3)
add_subdirectory(lzma-18.01)
if(COMPILER_SUPPORTS_CXX11)
	add_subdirectory(md5)
endif()
add_subdirectory(bass-2.4.13.8)
add_subdirectory(fmod-1.8.3)
add_subdirectory(jpeg-6b)
if(COMPILER_SUPPORTS_CXX11)
	add_subdirectory(pcre2-10.31-prerelease)
endif()
add_subdirectory(glew-1.2.3.4)
add_subdirectory(bzip2-1.0.5)
add_subdirectory(bsdiff)
