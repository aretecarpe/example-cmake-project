if (DEFINED CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "${CMAKE_BUILD_TYPE}")
else()
	set(CMAKE_BUILD_TYPE "Debug")
endif()

set(PROJECT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(NOT DEFINED PROJECT_CONFIGURATION_FILE)
	set(PROJECT_CONFIGURATION_FILE "project-config.json")
endif()

file(READ ${PROJECT_CONFIGURATION_FILE} PROJECT_CONTENT)
string(JSON PROJECT_NAME ERROR_VARIABLE JSON_STATUS GET ${PROJECT_CONTENT} "name")
if(NOT ${JSON_STATUS} STREQUAL "NOTFOUND")
	message(FATAL_ERROR "Project name is missing from project-config.json " ${JSON_STATUS})
endif()

string(JSON PROJECT_DESCRIPTION ERROR_VARIABLE JSON_STATUS GET ${PROJECT_CONTENT} "description")
if(NOT ${JSON_STATUS} STREQUAL "NOTFOUND")
	message(FATAL_ERROR "Project description is missing from project-config.json " ${JSON_STATUS})
endif()

string(JSON PROJECT_VERSION ERROR_VARIABLE JSON_STATUS GET ${PROJECT_CONTENT} "version")
if(NOT ${JSON_STATUS} STREQUAL "NOTFOUND")
	message(FATAL_ERROR "Project version is missing from project-config.json " ${JSON_STATUS})
endif()	

if(NOT DEFINED ARCHITECTURE)
	message("No architecture specified defaulting to 'x86_64'")
	set(ARCHITECTURE "x86_64")
endif()

if(NOT DEFINED OS)
	message("No OS specified defaulting to 'unknown'")
	set(OS "unknown")
endif()

if(NOT DEFINED ENABLE_TESTING)
	set(ENABLE_TESTING 0)
endif()

if(NOT DEFINED CMAKE_INSTALL_PREFIX)
	set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/installed_artifacts)
endif()

string(JSON PRODUCTS ERROR_VARIABLE JSON_STATUS GET ${PROJECT_CONTENT} "products")
if(NOT ${JSON_STATUS} STREQUAL "NOTFOUND")
	message(FATAL_ERROR "No products inside of project-config.json " ${JSON_STATUS})
endif()
foreach(index RANGE 0 999)
	string(JSON entry ERROR_VARIABLE JSON_STATUS GET ${PRODUCTS} ${index})
	if(NOT ${JSON_STATUS} STREQUAL "NOTFOUND")
		break()
	endif()
	list(APPEND PRODUCT_LIST ${entry})
endforeach()

set(RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/runtime)