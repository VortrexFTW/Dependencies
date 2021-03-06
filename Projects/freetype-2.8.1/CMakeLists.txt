set(SOURCES
	"${CMAKE_CURRENT_SOURCE_DIR}/src/autofit/autofit.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/bdf/bdf.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/cff/cff.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftbase.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftbitmap.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/cache/ftcache.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/builds/windows/ftdebug.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftfstype.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftgasp.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftglyph.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/gzip/ftgzip.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftinit.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/lzw/ftlzw.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftstroke.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftsystem.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/smooth/smooth.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftbbox.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftfntfmt.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftmm.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftpfr.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftsynth.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/fttype1.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftwinfnt.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftlcdfil.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftgxval.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftotval.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/base/ftpatent.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/pcf/pcf.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/pfr/pfr.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/psaux/psaux.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/pshinter/pshinter.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/psnames/psmodule.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/raster/raster.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/sfnt/sfnt.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/truetype/truetype.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/type1/type1.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/cid/type1cid.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/type42/type42.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/winfonts/winfnt.c")

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DFT_DEBUG_LEVEL_ERROR -DFT_DEBUG_LEVEL_TRACE")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DFT_DEBUG_LEVEL_ERROR -DFT_DEBUG_LEVEL_TRACE")

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/include")

install_include("${CMAKE_CURRENT_SOURCE_DIR}/include")

new_library_static(freetype "${SOURCES}" "FT2_BUILD_LIBRARY")
new_library_shared(freetype "${SOURCES}" "FT2_BUILD_LIBRARY;FREETYPE_EXPORTS")

target_link_libraries(freetype png zlib)
