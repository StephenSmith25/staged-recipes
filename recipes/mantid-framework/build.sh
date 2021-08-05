#!/usr/bin/env bash
set -ex

mkdir build
cd build

cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DENABLE_WORKBENCH=OFF \
  -DENABLE_DOCS=OFF \
  -DUSE_SYSTEM_EIGEN=ON \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DOpenSSL_ROOT=$PREFIX \
  -DHDF5_ROOT=$PREFIX \
  -DPython_ROOT_DIR=$PREFIX \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -GNinja \
  ../

ninja
ninja install

mv $PREFIX/lib/mantid ${SP_DIR}
