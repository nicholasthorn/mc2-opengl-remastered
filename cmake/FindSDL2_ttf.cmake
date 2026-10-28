# Prefer the package's own CMake config (SDL2_ttf >= 2.20); fall back to
# pkg-config for distros that ship only a .pc file (e.g. Ubuntu 22.04).
find_package(SDL2_ttf CONFIG QUIET)
if(NOT TARGET SDL2_ttf::SDL2_ttf)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(PC_SDL2_TTF REQUIRED IMPORTED_TARGET SDL2_ttf)
    add_library(SDL2_ttf::SDL2_ttf INTERFACE IMPORTED)
    target_link_libraries(SDL2_ttf::SDL2_ttf INTERFACE PkgConfig::PC_SDL2_TTF)
endif()
set(SDL2_ttf_FOUND TRUE)
