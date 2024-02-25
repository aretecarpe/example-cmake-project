include("${CMAKE_PATH}/product-template.cmake")

target_link_libraries(${PRODUCT_NAME} PUBLIC example_lib)