mkdir build && cd build

cmake ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCONDA_BUILD=true ^
    -DHDF5_DIR=%LIBRARY_PREFIX%/cmake/hdf5 ^
    -DENABLE_PRECOMMIT=OFF ^
    ..

cmake --build . --config Release --target install
if errorlevel 1 exit 1