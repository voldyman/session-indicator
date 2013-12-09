project (session-indicator)

cmake_minimum_required (VERSION 2.6)

LIST (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")
set (PKGDATADIR "${DATADIR}/session-indicator")
set (EXEC_NAME "session-indicator")
set (RELEASE_NAME "dingaling")
set (VERSION "0.1")
set (VERSION_INFO "indicator to Lock, Logout, Shutdown and Reboot system")

find_package (PkgConfig)
pkg_check_modules (DEPS gtk+-3.0 appindicator3-0.1)

add_definitions (${DEPS_CFLAGS})
link_libraries (${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

# Comment this out to enable C compiler warnings
add_definitions (-w)

find_package (Vala REQUIRED)
include (ValaVersion)

ensure_vala_version ("0.18" MINIMUM)

include (ValaPrecompile)

vala_precompile (VALA_C ${EXEC_NAME}
  src/Main.vala
  src/Indicator.vala
  src/SessionMan.vala
  src/ScreenSaver.vala
PACKAGES
  gtk+-3.0
  appindicator3-0.1
)

add_executable(${EXEC_NAME} ${VALA_C})

install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)

install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/session-indicator.desktop DESTINATION ${DATADIR}/applications/)

