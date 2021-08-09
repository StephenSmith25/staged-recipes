mkdir build && cd build

cmake ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCONDA_BUILD=True ^
    -DENABLE_WORKBENCH=OFF ^
    -DENABLE_MANTIDQT=OFF ^
    -DENABLE_PRECOMMIT=OFF ^
    -DENABLE_DOCS=OFF ^
    -DWORKBENCH_SITE_PACKAGES=%SP_DIR% ^
    -DSTANDALONE_FRAMEWORK=ON ^
    -DENABLE_MANTIDQT=ON ^
    -DUSE_SYSTEM_EIGEN=ON ^
    ..

if errorlevel 1 exit 1
cmake --build . --config Release
cmake --build . --config Release --target install
if errorlevel 1 exit 1


@REM set DATA_DIR="%SP_DIR%\mantid"
@REM if not exist %DATA_DIR% mkdir %DATA_DIR%
@REM robocopy %LIBRARY_BIN%\mantid %DATA_DIR% * /E
@REM if %ERRORLEVEL% GTR 3 exit 1
