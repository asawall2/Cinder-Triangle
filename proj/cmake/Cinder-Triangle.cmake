if(NOT TARGET Cinder-Triangle)
    get_filename_component(Cinder-Triangle_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)
    get_filename_component(CINDER_PATH "${Cinder-Triangle_PROJECT_ROOT}/../.." ABSOLUTE)
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS ${Cinder-Triangle_PROJECT_ROOT}/src/Triangle.cpp)

    add_library(Cinder-Triangle)

    target_include_directories(Cinder-Triangle PUBLIC "${Cinder-Triangle_PROJECT_ROOT}/src")
    target_include_directories(Cinder-Triangle SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include")

    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(Cinder-Triangle PRIVATE cinder)
endif()