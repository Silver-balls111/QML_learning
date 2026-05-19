cmake_minimum_required(VERSION 3.16)

project(climateControls VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appclimateControls
    main.cpp
)

qt_add_qml_module(appclimateControls
    URI climateControls
    QML_FILES
        Main.qml
        RESOURCES assets/BrushedMetal.jpg assets/cool.svg assets/fan_fill.svg assets/fan_off.svg assets/fan_outline.svg assets/heat.svg
        QML_FILES ClimateControl.qml
        QML_FILES ZoneControl.qml
        RESOURCES
        RESOURCES
        RESOURCES
        RESOURCES assets/Brushed-Metal.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appclimateControls PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appclimateControls
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appclimateControls
    PRIVATE Qt6::Quick
)

install(TARGETS appclimateControls
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
