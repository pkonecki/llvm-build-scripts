@echo off
CALL config.bat
CALL %vcenvbat%
CALL "cmake" "--version"

set build_type=%1
set build_dir=%~dp0"build_ninja_%build_type%"

RMDIR /S /Q "%~dp0/%build_dir%"
MKDIR "%~dp0/%build_dir%"
PUSHD "%~dp0/%build_dir%"
    CALL "cmake.exe" "-DLLVM_ENABLE_PROJECTS=clang" "-DLLVM_Z3_INSTALL_DIR=%z3dir%" "-DCMAKE_BUILD_TYPE=%build_type%" "-GNinja"  "%llvm_src_dir%/llvm"
POPD

PAUSE;
