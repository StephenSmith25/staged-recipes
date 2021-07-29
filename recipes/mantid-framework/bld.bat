mkdir build && cd build

cmake ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCONDA_BUILD=True ^
    -DENABLE_WORKBENCH=OFF ^
    -DENABLE_PRECOMMIT=OFF ^
    -DENABLE_DOCS=OFF ^
    -DUSE_SYSTEM_EIGEN=ON ^
    ..

if errorlevel 1 exit 1
cmake --build . --config Release
cmake --build . --config Release --target install
if errorlevel 1 exit 1


set DATA_DIR="%SP_DIR%\mantid"
if not exist %DATA_DIR% mkdir %DATA_DIR%
robocopy %LIBRARY_BIN%\mantid %DATA_DIR% * /E
if %ERRORLEVEL% GTR 3 exit 1

