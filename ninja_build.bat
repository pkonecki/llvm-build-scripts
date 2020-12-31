@echo off
CALL config.bat
CALL %vcenvbat%
CALL "cmake" "--version"

set build_type=%1
set build_dir=%~dp0"build_ninja_%build_type%"
IF NOT EXIST build_dir CALL ninja_configure.bat %build_type%

PUSHD %build_dir%
    CALL "ninja" "libclang"
POPD

PAUSE;
