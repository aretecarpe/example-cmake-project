include("${CMAKE_SOURCE_DIR}/cmake/product-template.cmake")

target_link_libraries(${PRODUCT_NAME} PUBLIC example_lib)