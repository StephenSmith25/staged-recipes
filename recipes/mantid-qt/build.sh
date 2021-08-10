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
  -DWORKBENCH_SITE_PACKAGES=$SP_DIR \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -DUSE_SYSTEM_FRAMEWORK=ON \
  -DENABLE_MANTIDQT=ON \
  -DQt5_DIR=$PREFIX/lib/cmake/qt5 \
  -GNinja \
  ../

ninja
ninja install

# mv $PREFIX/lib/mantid ${SP_DIR}
