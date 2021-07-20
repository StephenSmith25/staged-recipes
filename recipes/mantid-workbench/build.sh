#!/usr/bin/env bash
set -ex

mkdir build
cd build

cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DENABLE_WORKBENCH=ON \
  -DENABLE_DOCS=OFF \
  -DUSE_SYSTEM_EIGEN=ON \
  -DENABLE_PRECOMMIT=OFF \
  -DOpenSSL_ROOT=$PREFIX \
  -DHDF5_ROOT=$PREFIX \
  -DPython_ROOT_DIR=$PREFIX \
  -GNinja \
  ../

ninja
ninja install

mv $PREFIX/lib/mantid ${SP_DIR}
