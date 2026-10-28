# Prefer the package's own CMake config (SDL2_mixer >= 2.6); fall back to
# pkg-config for distros that ship only a .pc file (e.g. Ubuntu 22.04).
find_package(SDL2_mixer CONFIG QUIET)
if(NOT TARGET SDL2_mixer::SDL2_mixer)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(PC_SDL2_MIXER REQUIRED IMPORTED_TARGET SDL2_mixer)
    add_library(SDL2_mixer::SDL2_mixer INTERFACE IMPORTED)
    target_link_libraries(SDL2_mixer::SDL2_mixer INTERFACE PkgConfig::PC_SDL2_MIXER)
endif()
set(SDL2_mixer_FOUND TRUE)
