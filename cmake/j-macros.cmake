
# to avoid repeating stuff
function(new_library_static NAME SOURCES DEFINES)
	set(LIBRARY_SOURCES "")
	foreach(SOURCE ${SOURCES})
		list(APPEND LIBRARY_SOURCES ${SOURCE})
	endforeach()

	add_library("${NAME}_static" STATIC ${LIBRARY_SOURCES})

	if(MSVC AND EMBEDDED_PDB)
		# embedd pdb
		set_target_properties("${NAME}_static" PROPERTIES COMPILE_OPTIONS "/Z7")
	endif()

	foreach(DEFINE ${DEFINES})
		target_compile_definitions("${NAME}_static" PRIVATE ${DEFINE})
	endforeach()

	install(TARGETS "${NAME}_static"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug)
	install(TARGETS "${NAME}_static"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release)
	install(TARGETS "${NAME}_static"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		LIBRARY DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo)
endfunction()

function(new_library_shared NAME SOURCES DEFINES)
	set(LIBRARY_SOURCES "")
	foreach(SOURCE ${SOURCES})
		list(APPEND LIBRARY_SOURCES ${SOURCE})
	endforeach()

	add_library("${NAME}" SHARED ${LIBRARY_SOURCES})

	set_target_properties("${NAME}" PROPERTIES RUNTIME_OUTPUT_NAME "${NAME}${RUNTIME_RELEASE_POSTFIX}")
	set_target_properties("${NAME}" PROPERTIES RUNTIME_OUTPUT_NAME_DEBUG "${NAME}${RUNTIME_DEBUG_POSTFIX}")

	foreach(DEFINE ${DEFINES})
		target_compile_definitions("${NAME}" PRIVATE ${DEFINE})
	endforeach()

	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug)
	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release)
	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		LIBRARY DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo)

	if(MSVC)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug OPTIONAL)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release OPTIONAL)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo OPTIONAL)
	endif()
endfunction()

function(new_library_executable NAME SOURCES DEFINES)
	set(LIBRARY_SOURCES "")
	foreach(SOURCE ${SOURCES})
		list(APPEND LIBRARY_SOURCES ${SOURCE})
	endforeach()

	add_executable("${NAME}" WIN32 ${LIBRARY_SOURCES})

	set_target_properties("${NAME}" PROPERTIES RUNTIME_OUTPUT_NAME "${NAME}${RUNTIME_RELEASE_POSTFIX}")
	set_target_properties("${NAME}" PROPERTIES RUNTIME_OUTPUT_NAME_DEBUG "${NAME}${RUNTIME_DEBUG_POSTFIX}")

	foreach(DEFINE ${DEFINES})
		target_compile_definitions("${NAME}" PRIVATE ${DEFINE})
	endforeach()

	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug)
	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		LIBRARY DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release)
	install(TARGETS "${NAME}"
		RUNTIME DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		LIBRARY DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo
		ARCHIVE DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo)

	if(MSVC)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/Debug" CONFIGURATIONS Debug OPTIONAL)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/Release" CONFIGURATIONS Release OPTIONAL)
		install(FILES $<TARGET_PDB_FILE:${NAME}> DESTINATION "${LIB_DIRECTORY}/RelWithDebInfo" CONFIGURATIONS RelWithDebInfo OPTIONAL)
	endif()
endfunction()
